import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Common_Widgets/Common_List.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/Home%20Screen/Cart_Screen.dart';
import 'package:vilfresh/Model/CategoriesModel.dart';
import 'package:vilfresh/Model/HomeModel.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
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
  final List<String> _days = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
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
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround1,
      appBar: Custom_AppBar(
        title: 'Categories ',
        actions: [
          Icon(
            Icons.search,
            size: 28,
            color: green2,
          ),
          Container(
              margin: EdgeInsets.only(left: 15, right: 20),
              height: 35,
              width: 35,
              child: ImgPathSvg("wallet.svg")),
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
            child: Row(
              children: [
                tabBarIndex == 0
                    ? Container(
                        margin: EdgeInsets.only(top: 15, bottom: 20),
                        // height: MediaQuery.sizeOf(context).height / 1.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          color: green3,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () => _scrollUp(),
                                child: Icon(
                                  Icons.keyboard_arrow_up,
                                  color: green2,
                                )),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, bottom: 20, left: 10, right: 10),
                              child: RotatedBox(
                                quarterTurns: 1,
                                child: Text(
                                  _days[_currentIndex],
                                  style: orderNameT,
                                ),
                              ),
                            ),
                            InkWell(
                                onTap: () => _scrollDown(),
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: green2,
                                )),
                          ],
                        ),
                      )
                    : Container(),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: List.generate(
                        (widget.shopByCategories?.length ?? 0) - 1, (index) {
                      final _categoriesData = ref.watch(CategoriesProvider(
                          widget.shopByCategories?[index + 1].catgID ?? ""));

                      return _categoriesData.when(
                        data: (data) {
                          return data?.data == null
                              ? Center(child: ImgPathPng('nodata.png'))
                              : _vfBasketList(
                                  data?.data ?? [],
                                  widget.shopByCategories?[index + 1].catgID ??
                                      "");
                        },
                        error: (Object error, StackTrace stackTrace) {
                          return Text(error.toString());
                        },
                        loading: () =>
                            Center(child: CircularProgressIndicator()),
                      );
                    }),
                  ),
                ),
              ],
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
  Widget _vfBasketList(List<CategoryData> data, String CategoriesId) {
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
                              Item_Id: data?[index].itemID ?? "",
                            )));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                child: Categories_List(context, data[index]),
              ),
            );
          }),
    );
  }
}
