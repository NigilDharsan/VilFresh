import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:vilfresh/Common_Widgets/Common_List.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/Home%20Screen/Cart_Screen.dart';
import 'package:vilfresh/Model/CategoriesModel.dart';
import 'package:vilfresh/Model/HomeModel.dart';
import 'package:vilfresh/Model/OtherCategoriesModel.dart';
import 'package:vilfresh/Src/Wallet_Ui/Wallet_Screen.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Generic.dart';
import 'package:vilfresh/utilits/Loading_Overlay.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class Categories_Screen extends ConsumerStatefulWidget {
  List<ShopByCategories>? shopByCategories;
  int initialIndex;

  Categories_Screen(
      {super.key, required this.shopByCategories, required this.initialIndex});

  @override
  _Categories_ScreenState createState() => _Categories_ScreenState();
}

class _Categories_ScreenState extends ConsumerState<Categories_Screen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> _days = [
    // 'Sunday',
    // 'Monday',
    // 'Tuesday',
    // 'Wednesday',
    // 'Thursday',
    // 'Friday',
    // 'Saturday',
  ];
  int tabBarIndex = 0;
  int _currentIndex = 0;

  void _scrollUp() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      }
    });
  }

  void _scrollDown() {
    setState(() {
      if (_currentIndex < _days.length - 1) {
        _currentIndex++;
      }
    });
  }

  @override
  void initState() {
    super.initState();

    tabBarIndex = widget.initialIndex;
    _tabController = TabController(
        length: (widget.shopByCategories?.length ?? 0) - 1,
        vsync: this,
        initialIndex: widget.initialIndex);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        print("Tab is changing, but hasn't settled yet");
      } else {
        print("Current Tab Index: ${_tabController.index}");
        setState(() {
          tabBarIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String dateConvert(String date) {
    DateFormat inputFormat = DateFormat("yyyy-MM-dd");
    DateTime dateTime = inputFormat.parse(date);

    DateFormat outputFormat = DateFormat("dd MMM");
    String formattedDate = outputFormat.format(dateTime);

    return formattedDate;
  }

  // String dateConvert1(String date) {
  //   DateFormat inputFormat = DateFormat("yyyy-MM-dd");
  //   DateTime dateTime = inputFormat.parse(date);

  //   DateFormat outputFormat = DateFormat("yyyy-MM-dd");
  //   String formattedDate = outputFormat.format(dateTime);

  //   return formattedDate;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround1,
      appBar: Custom_AppBar(
        title: 'Categories ',
        actions: [
          // Icon(
          //   Icons.search,
          //   size: 28,
          //   color: green2,
          // ),
          Container(
              margin: EdgeInsets.only(right: 20, left: 15),
              height: 35,
              width: 35,
              child: Center(
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Wallet_Screen()));
                    },
                    child: ImgPathSvg("wallet.svg")),
              )),
        ],
        isNav: true,
        isGreen: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
          ),
          TabBar(
            controller: _tabController,
            dividerColor: backGround1,
            isScrollable: true,
            padding: EdgeInsets.only(left: 5, right: 5),
            labelColor: green2,
            labelStyle: productPrice,
            // labelStyle: TabT,
            indicator: BoxDecoration(
                color: green3, borderRadius: BorderRadius.circular(10)),
            indicatorColor: green2,
            unselectedLabelColor: green2,
            unselectedLabelStyle: productPrice,
            indicatorPadding: EdgeInsets.zero,
            indicatorSize: TabBarIndicatorSize.tab,
            onTap: (value) {
              print(value);
              setState(() {
                tabBarIndex = value;
              });
            },
            tabs: List.generate((widget.shopByCategories?.length ?? 0) - 1,
                (index) {
              return Container(
                child: Tab(
                  text: widget.shopByCategories?[index + 1].catgName ?? "",
                ),
              );
            }),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: List.generate(
                  (widget.shopByCategories?.length ?? 0) - 1, (index) {
                // final _OtherCategoriesData = ref.watch(OtherCategoriesProvider(
                //     widget.shopByCategories?[index + 1].catgID ?? ""));

                final _categoriesData = ref.watch(CategoriesProvider(
                    widget.shopByCategories?[index + 1].catgID ?? ""));

                return _categoriesData.when(
                  data: (data) {
                    if (index == 0) {
                      _days = data?.data
                              ?.map((jsonItem) =>
                                  "${jsonItem.day ?? ""}" +
                                  "${dateConvert(jsonItem.date ?? "")}")
                              .toList() ??
                          [];
                    }

                    return data?.data == null
                        ? Center(
                            child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              height: 250,
                              width: 250, //MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ImgPathPng('nopreview.png'),
                                  Text('No Items!'),
                                ],
                              ),
                            ),
                          ))
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              index == 0
                                  ? Container(
                                      margin:
                                          EdgeInsets.only(top: 15, bottom: 20),
                                      // height: MediaQuery.sizeOf(context).height / 1.5,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                        color: green3,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: InkWell(
                                                onTap: () => _scrollUp(),
                                                child: Icon(
                                                  Icons.keyboard_arrow_up,
                                                  color: green2,
                                                )),
                                            decoration: BoxDecoration(
                                              // color: Colors
                                              //     .blue, // Background color of the container
                                              border: Border.all(
                                                color: Colors
                                                    .black, // Border color
                                                width: 1.0, // Border width
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20,
                                                bottom: 20,
                                                left: 10,
                                                right: 10),
                                            child: RotatedBox(
                                              quarterTurns: 3,
                                              child: Text(
                                                _days[_currentIndex],
                                                style: orderNameT,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: InkWell(
                                                onTap: () => _scrollDown(),
                                                child: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: green2,
                                                )),
                                            decoration: BoxDecoration(
                                              // color: Colors
                                              //     .blue, // Background color of the container
                                              border: Border.all(
                                                color: Colors
                                                    .black, // Border color
                                                width: 1.0, // Border width
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(),
                              Expanded(
                                  child: index == 0
                                      ? _vfBasketList(
                                          data?.data?[_currentIndex]
                                                  .itemDetail ??
                                              [],
                                          widget.shopByCategories?[index + 1]
                                                  .catgID ??
                                              "")
                                      : _vfBasketList(
                                          data?.data?[0].itemDetail ?? [],
                                          widget.shopByCategories?[index + 1]
                                                  .catgID ??
                                              "")),
                            ],
                          );
                  },
                  error: (Object error, StackTrace stackTrace) {
                    return Center(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 300,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImgPathPng('nopreview.png'),
                            Text('No Data!'),
                          ],
                        ),
                      ),
                    ));
                  },
                  loading: () => Center(child: CircularProgressIndicator()),
                );
                // _OtherCategoriesData.when(
                //     data: (data) {
                //       return data?.data == null
                //           ? Center(child: ImgPathPng('nodata.png'))
                //           : _CategoryList(
                //               data!.data?[index].itemDetail ?? [],
                //               widget.shopByCategories?[index + 1].catgID ??
                //                   "");
                //     },
                //     error: (Object error, StackTrace stackTrace) {
                //       return Text(error.toString());
                //     },
                //     loading: () =>
                //         Center(child: CircularProgressIndicator()),
                //   );
              }),
            ),
          ),
        ],
      ),
      // Container(
      //   width: MediaQuery.of(context).size.width,
      //   child: Column(
      //     children: [
      //       const SizedBox(
      //         height: 25,
      //       ),
      //       TabBar(
      //         controller: _tabController,
      //         dividerColor: backGround1,
      //         isScrollable: true,
      //         padding: EdgeInsets.only(left: 5, right: 5),
      //         labelColor: green2,
      //         labelStyle: productPrice,
      //         // labelStyle: TabT,
      //         indicator: BoxDecoration(
      //             color: green3, borderRadius: BorderRadius.circular(10)),
      //         indicatorColor: green2,
      //         unselectedLabelColor: green2,
      //         unselectedLabelStyle: productPrice,
      //         indicatorPadding: EdgeInsets.zero,
      //         indicatorSize: TabBarIndicatorSize.tab,
      //         onTap: (value) {
      //           print(value);
      //         },
      //         tabs:
      //             List.generate(widget.shopByCategories?.length ?? 0, (index) {
      //           return Container(
      //             child: Tab(
      //               text: widget.shopByCategories?[index].catgName ?? "",
      //             ),
      //           );
      //         }),
      //       ),
      //
      //         TabBarView(
      //           controller: _tabController,
      //           children: List.generate(widget.shopByCategories?.length ?? 0,
      //               (index) {
      //             final _categoriesData = ref.watch(CategoriesProvider(
      //                 widget.shopByCategories?[index].catgID ?? ""));
      //
      //             return _categoriesData.when(
      //               data: (data) {
      //                 return Center(child: _vfBasketList(data?.data ?? []));
      //               },
      //               error: (Object error, StackTrace stackTrace) {
      //                 return Text(error.toString());
      //               },
      //               loading: () => Center(child: CircularProgressIndicator()),
      //             );
      //           }),
      //         ),
      //     ],
      //   ),
      // ),
    );
  }

  //VF BASKET LIST
  Widget _vfBasketList(List<ItemDetail> data, String CategoriesId) {
    return Container(
      child: ListView.builder(
          itemCount: data.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          // physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Cart_Screeen(
                              Categories_Id: CategoriesId,
                              Item_Id: data[index].itemID ?? "",
                              Item_Name: data[index].categoryName ?? "",
                              deliveredDate: data[index]
                                      .nextDeliveryDateDay?[data[index]
                                              .selectedNextDeliveryDate ??
                                          0]
                                      .dates ??
                                  "",
                            )));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                child: Categories_List(
                  context,
                  data[index],
                  increment: () async {
                    int qty = int.parse(
                        data[index].defaultVariant?[0].itemQty ?? "0");

                    LoadingOverlay.show(context);

                    var formData = <String, dynamic>{
                      "CH_USER_ID": SingleTon().user_id,
                      'Cart_Items': [
                        {
                          "CI_ITEM_ID": data[index].itemID,
                          "CI_VARIANT_TYPE":
                              data[index].defaultVariant?[0].variantID,
                          "CI_ITEM_QTY": "${qty + 1}",
                          "Delivery_Date": data[index]
                                  .nextDeliveryDateDay?[
                                      data[index].selectedNextDeliveryDate ?? 0]
                                  .dates ??
                              ""
                        }
                      ],
                    };

                    final result = await ref
                        .read(AddToCardUpdateProvider(formData).future);

                    LoadingOverlay.forcedStop();
                    // Handle the result
                    if (result?.status == "true") {
                      ShowToastMessage(result?.message ?? "");
                      // Handle success
                      setState(() {
                        data[index].defaultVariant?[0].itemQty = "${qty + 1}";
                      });
                    } else {
                      // Handle failure
                      ShowToastMessage(result?.message ?? "");
                    }
                  },
                  decrement: () async {
                    int qty = int.parse(
                        data[index].defaultVariant?[0].itemQty ?? "0");

                    if (qty == 1) {
                      LoadingOverlay.show(context);

                      var formData = <String, dynamic>{
                        "CH_USER_ID": SingleTon().user_id,
                        'Cart_Items': [
                          {
                            "CI_ITEM_ID": data[index].itemID,
                            "CI_VARIANT_TYPE":
                                data[index].defaultVariant?[0].variantID,
                          }
                        ],
                      };

                      final result = await ref
                          .read(AddToCardDeleteProvider(formData).future);

                      LoadingOverlay.forcedStop();
                      // Handle the result
                      if (result?.status == "true") {
                        ShowToastMessage(result?.message ?? "");
                        // Handle success
                        setState(() {
                          data[index].defaultVariant?[0].itemQty = "0";
                        });
                      } else {
                        // Handle failure
                        ShowToastMessage(result?.message ?? "");
                      }
                    } else {
                      LoadingOverlay.show(context);

                      var formData = <String, dynamic>{
                        "CH_USER_ID": SingleTon().user_id,
                        'Cart_Items': [
                          {
                            "CI_ITEM_ID": data[index].itemID,
                            "CI_VARIANT_TYPE":
                                data[index].defaultVariant?[0].variantID,
                            "CI_ITEM_QTY": "${qty - 1}",
                            "Delivery_Date": data[index]
                                    .nextDeliveryDateDay?[
                                        data[index].selectedNextDeliveryDate ??
                                            0]
                                    .dates ??
                                ""
                          }
                        ],
                      };

                      final result = await ref
                          .read(AddToCardUpdateProvider(formData).future);

                      LoadingOverlay.forcedStop();
                      // Handle the result
                      if (result?.status == "true") {
                        ShowToastMessage(result?.message ?? "");
                        // Handle success
                        setState(() {
                          data[index].defaultVariant?[0].itemQty = "${qty - 1}";
                        });
                      } else {
                        // Handle failure
                        ShowToastMessage(result?.message ?? "");
                      }
                    }
                  },
                  Add: () async {
                    int qty = int.parse(
                        data[index].defaultVariant?[0].itemQty ?? "0");

                    LoadingOverlay.show(context);

                    var formData = <String, dynamic>{
                      "CH_USER_ID": SingleTon().user_id,
                      'Cart_Items': [
                        {
                          "CI_ITEM_ID": data[index].itemID,
                          "CI_VARIANT_TYPE":
                              data[index].defaultVariant?[0].variantID,
                          "CI_ITEM_QTY": "${qty + 1}",
                          "Delivery_Date": data[index]
                                  .nextDeliveryDateDay?[
                                      data[index].selectedNextDeliveryDate ?? 0]
                                  .dates ??
                              ""
                        }
                      ],
                    };

                    final result =
                        await ref.read(AddToCardProvider(formData).future);

                    LoadingOverlay.forcedStop();
                    // Handle the result
                    if (result?.status == "true") {
                      ShowToastMessage(result?.message ?? "");
                      // Handle success
                      setState(() {
                        data[index].defaultVariant?[0].itemQty = "1";
                      });
                    } else {
                      // Handle failure
                      ShowToastMessage(result?.message ?? "");
                    }
                  },
                  delivered: (int) {
                    setState(() {
                      data[index].selectedNextDeliveryDate = int;
                    });
                  },
                  countUpdate: (itemIndex, itemCount) {
                    setState(() {
                      data[index].allVariant?[itemIndex!].itemQty =
                          "${itemCount}";
                    });
                  },
                ),
              ),
            );
          }),
    );
  }

  Widget _CategoryList(List<OtherItemDetail> data, String CategoriesId) {
    return Container(
      child: ListView.builder(
          itemCount: data.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          // physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Cart_Screeen(
                              Categories_Id: CategoriesId,
                              Item_Id: "",
                              Item_Name: "",
                              deliveredDate: '',
                            )));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                child: OtherCategories_List(context, data[index],
                    increment: (String qty, String varientID) {},
                    decrement: (String qty, String varientID) {}),
              ),
            );
          }),
    );
  }
}
