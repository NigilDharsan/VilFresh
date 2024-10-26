import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:vilfresh/Common_Widgets/Bottom_Navigation_Bar.dart';
import 'package:vilfresh/Common_Widgets/Common_Button.dart';
import 'package:vilfresh/Common_Widgets/Common_List.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/Common_Widgets/Text_Form_Field.dart';
import 'package:vilfresh/Src/Checkout_Ui/OrderSuccess.dart';
import 'package:vilfresh/Src/Coupon_Ui/Coupon_Screen.dart';
import 'package:vilfresh/Src/Sign_Up_Ui/Sign_Up_Screen1.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Generic.dart';
import 'package:vilfresh/utilits/Loading_Overlay.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class CheckOut_Screen extends ConsumerStatefulWidget {
  const CheckOut_Screen({super.key});

  @override
  ConsumerState<CheckOut_Screen> createState() => _CheckOut_ScreenState();
}

class _CheckOut_ScreenState extends ConsumerState<CheckOut_Screen> {
  bool? _Custom_icon;
  List<bool> toggleValues = [];
  int? LenghtCal = 5;

  String? slotID = '';

  @override
  void initState() {
    super.initState();
    toggleValues = List.generate(LenghtCal ?? 0, (index) => false);
  }

  getCoupen() async {
    final coupenGet = await getCouponID();

    setState(() {
      couponCode = coupenGet[0];
      couponID = coupenGet[0];
      couponRate = coupenGet[0];
    });
  }

  String? couponCode = "";
  String? couponID = "";
  String? couponRate = "";

  final TextEditingController _couponCodeTextEditor = TextEditingController();

  final numberFormat = NumberFormat('##0.00');

  @override
  Widget build(BuildContext context) {
    final selecttimedate = ref.watch(TimeanddateApiProvider);
    final getkartData = ref.watch(GetCartProvider);

    return Scaffold(
      // backgroundColor: white1,
      backgroundColor: backGround1,

      appBar: Custom_AppBar(
        title: "Checkout",
        actions: null,
        isNav: false,
        isGreen: false,
      ),
      body: getkartData.when(
        data: (data) {
          data?.addressCount != "" ? addressAdded(true) : addressAdded(false);
          return data?.data != null
              ? SingleChildScrollView(
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15),
                          // PRODUCT DETAIL
                          Container(
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: (data?.data?.length ?? 0) - 1,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return CheckOut_List(
                                  context,
                                  incrementCounter: () async {
                                    LoadingOverlay.show(context);
                                    var formData = <String, dynamic>{
                                      "CH_USER_ID": await getuserId(),
                                      'Cart_Items': [
                                        {
                                          "CI_ITEM_ID":
                                              data.data?[index].itemID,
                                          "CI_VARIANT_TYPE":
                                              data.data?[index].itemVariantID,
                                          "CI_ITEM_QTY":
                                              "${int.parse(data.data?[index].qty ?? "0") + 1}",
                                          "Delivery_Date":
                                              data.data?[index].deliveryDate
                                        }
                                      ],
                                    };

                                    final result = await ref.read(
                                      AddToCardUpdateProvider(formData).future,
                                    );
                                    LoadingOverlay.forcedStop();
                                    if (result?.status == "true") {
                                      ShowToastMessage(result?.message ?? "");
                                      ref.refresh(GetCartProvider);
                                    } else {
                                      ShowToastMessage(result?.message ?? "");
                                    }
                                  },
                                  decrementCounter: () async {
                                    if (int.parse(
                                            data.data?[index].qty ?? "0") ==
                                        1) {
                                      LoadingOverlay.show(context);
                                      var formData = <String, dynamic>{
                                        "CH_USER_ID": await getuserId(),
                                        'Cart_Items': [
                                          {
                                            "CI_ITEM_ID":
                                                data.data?[index].itemID,
                                            "CI_VARIANT_TYPE":
                                                data.data?[index].itemVariantID,
                                          }
                                        ],
                                      };

                                      final result = await ref.read(
                                        AddToCardDeleteProvider(formData)
                                            .future,
                                      );
                                      LoadingOverlay.forcedStop();
                                      if (result?.status == "true") {
                                        ShowToastMessage(result?.message ?? "");
                                        ref.refresh(GetCartProvider);
                                      } else {
                                        ShowToastMessage(result?.message ?? "");
                                      }
                                    } else {
                                      LoadingOverlay.show(context);
                                      var formData = <String, dynamic>{
                                        "CH_USER_ID": await getuserId(),
                                        'Cart_Items': [
                                          {
                                            "CI_ITEM_ID":
                                                data.data?[index].itemID,
                                            "CI_VARIANT_TYPE":
                                                data.data?[index].itemVariantID,
                                            "CI_ITEM_QTY":
                                                "${int.parse(data.data?[index].qty ?? "0") - 1}",
                                            "Delivery_Date":
                                                data.data?[index].deliveryDate
                                          }
                                        ],
                                      };

                                      final result = await ref.read(
                                        AddToCardUpdateProvider(formData)
                                            .future,
                                      );
                                      LoadingOverlay.forcedStop();
                                      if (result?.status == "true") {
                                        ShowToastMessage(result?.message ?? "");
                                        ref.refresh(GetCartProvider);
                                      } else {
                                        ShowToastMessage(result?.message ?? "");
                                      }
                                    }
                                  },
                                  checkOutData: data!.data![index],
                                );
                              },
                            ),
                          ),

                          const SizedBox(height: 20),
                          // SUBTOTAL
                          // Row(
                          //   children: [
                          //     // Text(
                          //     //   "Subtotal",
                          //     //   style: walletBalanceT1,
                          //     // ),
                          //     // const Spacer(),
                          //     // Text(
                          //     //   "RS.",
                          //     //   style: walletBalanceT1,
                          //     // ),
                          //     // Text(
                          //     //   numberFormat.format(double.tryParse(data
                          //     //               ?.data?[
                          //     //                   (data.data?.length ?? 0) - 1]
                          //     //               .netAMt ??
                          //     //           "") ??
                          //     //       0),
                          //     //   style: enterAmountT,
                          //     // ),
                          //   ],
                          // ),
                          // SHIPPING CHARGES
                          Row(
                            children: [
                              Text(
                                "Shipping Charges",
                                style: CheckOutAmountShadow,
                              ),
                              const Spacer(),
                              Text(
                                "0",
                                style: CheckOutAmountShadow,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Platform Fee",
                                style: CheckOutAmountShadow,
                              ),
                              const Spacer(),
                              Text(
                                "0",
                                style: CheckOutAmountShadow,
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          // TOTAL
                          Row(
                            children: [
                              Text(
                                "TOTAL",
                                style: enterAmountT,
                              ),
                              const Spacer(),
                              Text(
                                "RS.",
                                style: walletBalanceT1,
                              ),
                              Text(
                                numberFormat.format(double.tryParse(data
                                            ?.data?[
                                                (data.data?.length ?? 0) - 1]
                                            .totalAmt ??
                                        "") ??
                                    0),
                                style: enterAmountT,
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 20),
                            width: MediaQuery.sizeOf(context).width / 1.2,
                            child: Text(
                              'The maximum amount will be on hold from your wallet. The amount will be detected once the product cut off time is over.',
                              style: Textfield_Style,
                              maxLines: 3,
                            ),
                          ),

                          // COUPONS
                          Text(
                            "Coupons & Discounts",
                            style: qntT,
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: white2,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, bottom: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ImgPathPng('discount.png'),
                                        Text(
                                          "Select Promo Code",
                                          style: shopT,
                                        ),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const Coupon_Screen(),
                                              ),
                                            ).then((onValue) async {
                                              if (onValue != null) {
                                                coupenCodeApply(onValue);
                                              }
                                            });
                                          },
                                          child: Text(
                                            "View All",
                                            style: viewOrg,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: white1,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          "You can view all available offers by clicking view all offers or you can enter promo code directly",
                                          style: circularT,
                                          maxLines: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 15),
                                    child: Row(
                                      children: [
                                        couponCode == ""
                                            ? SizedBox(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width /
                                                        2,
                                                child: textFormField_green(
                                                  hintText: 'Enter Promo Code',
                                                  keyboardtype:
                                                      TextInputType.text,
                                                  inputFormatters: null,
                                                  Controller:
                                                      _couponCodeTextEditor,
                                                  validating: (value) {
                                                    if (value!.isEmpty) {
                                                      return "Please enter a Promo Code";
                                                    } else if (value == null) {
                                                      return "Please enter a Promo Code";
                                                    }
                                                    return null;
                                                  },
                                                  onChanged: null,
                                                ),
                                              )
                                            : Text(couponCode!),
                                        const Spacer(),
                                        couponCode == ""
                                            ? InkWell(
                                                onTap: () {
                                                  if (_couponCodeTextEditor
                                                          .text !=
                                                      "") {
                                                    coupenCodeApply(
                                                        _couponCodeTextEditor
                                                            .text);
                                                  }
                                                },
                                                child: Text(
                                                  'Apply',
                                                  style: shopT,
                                                ),
                                              )
                                            : Text(
                                                "Applied",
                                                style: shopT,
                                              ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // DELIVERY SLOT
                          Text(
                            "Delivery Slot",
                            style: qntT,
                          ),
                          selecttimedate.when(
                            data: (data) {
                              LenghtCal = data?.data?.length ?? 0;
                              print("Length $LenghtCal");
                              slotID = data?.data?[0].slotID ?? "";
                              return Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: white2,
                                  ),
                                  child: Theme(
                                    data: ThemeData(
                                        dividerColor: Colors.transparent),
                                    child: ExpansionTile(
                                      trailing: const SizedBox.shrink(),
                                      onExpansionChanged: (bool expanded) {
                                        setState(() {
                                          _Custom_icon = expanded;
                                        });
                                      },
                                      title: Padding(
                                        padding: EdgeInsets.zero,
                                        child: Row(
                                          children: [
                                            Text(
                                              'Delivery time slot',
                                              style: kgT,
                                            ),
                                            const Spacer(),
                                            _Custom_icon == true
                                                ? const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: green2,
                                                  )
                                                : const Icon(
                                                    Icons.chevron_right,
                                                    color: green2,
                                                  ),
                                          ],
                                        ),
                                      ),
                                      tilePadding:
                                          const EdgeInsets.only(left: 20),
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5, bottom: 10),
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: data?.data?.length ?? 0,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return ListTile(
                                                title: Text(
                                                  data?.data?[index]
                                                          .description ??
                                                      "",
                                                  style: subscribeHT,
                                                ),
                                                subtitle: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 70),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        data?.data?[index]
                                                                .time ??
                                                            "",
                                                        style: subscribeHT,
                                                      ),
                                                      const Spacer(),
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            toggleValues[
                                                                    index] =
                                                                !toggleValues[
                                                                    index]; // Toggle the value
                                                          });
                                                        },
                                                        child: toggleValues[
                                                                index]
                                                            ? ImgPathPng(
                                                                'switchon.png')
                                                            : ImgPathPng(
                                                                'switchoff.png'),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            error: (error, _) {
                              return const Text('ERROR');
                            },
                            loading: () {
                              return const Center(
                                  child: CircularProgressIndicator());
                            },
                          ),

                          // BUTTON
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 50),
                            child: CommonElevatedButtonGreen(
                              context,
                              "Place Order",
                              () async {
                                if (SingleTon().walletBalance >=
                                    int.parse(data
                                            ?.data?[
                                                (data.data?.length ?? 0) - 1]
                                            .totalAmt ??
                                        "0")) {
                                  if (await isAddressAdded() == true) {
                                    final OrderplaceApiService =
                                        ApiService(ref.read(dioProvider));
                                    Map<String, dynamic> formData = {
                                      "User_ID": SingleTon().user_id,
                                      "Delivery_Slot_ID": slotID,
                                      "Coupen_ID": "",
                                      "Gross_Amount": data
                                          ?.data?[(data.data?.length ?? 0) - 1]
                                          .netAMt,
                                      "Discount_Amount": data
                                          ?.data?[(data.data?.length ?? 0) - 1]
                                          .totDisAmt,
                                      "Net_Amount": data
                                          ?.data?[(data.data?.length ?? 0) - 1]
                                          .totalAmt,
                                      // "Items": itemList
                                    };
                                    final userRegisterResponse =
                                        await OrderplaceApiService
                                            .OrderPlaceApiService(
                                                formData: formData);
                                    if (userRegisterResponse.status == "true") {
                                      ShowToastMessage(
                                          userRegisterResponse.message ?? "");

                                      storeCouponID("", "", "");

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => OrderSuccess(
                                            screenType: '',
                                          ),
                                        ),
                                      ).then((onValue) {
                                        var parentState =
                                            context.findAncestorStateOfType<
                                                Bottom_Navigation_BarState>();

                                        if (parentState != null) {
                                          parentState.setState(() {
                                            parentState.b(2);
                                          });
                                        }
                                      });
                                    } else {
                                      ShowToastMessage(
                                          userRegisterResponse.message ?? "");
                                    }
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => My_Address(),
                                    //   ),
                                    // ).then((onValue) async {
                                    //   if (onValue != "" && onValue != null) {
                                    //     // List<Map<String, dynamic>> itemList =
                                    //     //     [];
                                    //     // for (var i = 0;
                                    //     //     i < ((data?.data?.length ?? 0) - 1);
                                    //     //     i++) {
                                    //     //   Map<String, dynamic> item = {
                                    //     //     "Item_ID": data?.data?[i].itemID,
                                    //     //     "Item_Variant":
                                    //     //         data?.data?[i].itemVariantID,
                                    //     //     "Qty": data?.data?[i].qty,
                                    //     //     "Discount": "",
                                    //     //     "Rate": data?.data?[i].totalAmt,
                                    //     //     "Delivery_Date":
                                    //     //         data?.data?[i].Delivery_Date
                                    //     //   };
                                    //     //   itemList.add(item);
                                    //     // }

                                    //   }
                                    // });
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const Sign_Up_Screen1(),
                                      ),
                                    ).then((onValue) async {
                                      if (onValue == true) {
                                        // List<Map<String, dynamic>> itemList =
                                        //     [];
                                        // for (var i = 0;
                                        //     i < ((data?.data?.length ?? 0) - 1);
                                        //     i++) {
                                        //   Map<String, dynamic> item = {
                                        //     "Item_ID": data?.data?[i].itemID,
                                        //     "Item_Variant":
                                        //         data?.data?[i].itemVariantID,
                                        //     "Qty": data?.data?[i].qty,
                                        //     "Discount": "",
                                        //     "Rate": data?.data?[i].totalAmt,
                                        //     "Delivery_Date":
                                        //         data?.data?[i].Delivery_Date
                                        //   };
                                        //   itemList.add(item);
                                        // }
                                        final OrderplaceApiService =
                                            ApiService(ref.read(dioProvider));
                                        Map<String, dynamic> formData = {
                                          "User_ID": SingleTon().user_id,
                                          "Delivery_Slot_ID": slotID,
                                          "Coupen_ID": "",
                                          "Gross_Amount": data
                                              ?.data?[
                                                  (data.data?.length ?? 0) - 1]
                                              .netAMt,
                                          "Discount_Amount": data
                                              ?.data?[
                                                  (data.data?.length ?? 0) - 1]
                                              .totDisAmt,
                                          "Net_Amount": data
                                              ?.data?[
                                                  (data.data?.length ?? 0) - 1]
                                              .totalAmt,
                                          // "Address_ID": onValue,
                                          // "Items": itemList
                                        };
                                        final userRegisterResponse =
                                            await OrderplaceApiService
                                                .OrderPlaceApiService(
                                                    formData: formData);
                                        if (userRegisterResponse.status ==
                                            "true") {
                                          storeCouponID("", "", "");

                                          ShowToastMessage(
                                              userRegisterResponse.message ??
                                                  "");

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  OrderSuccess(
                                                screenType: '',
                                              ),
                                            ),
                                          ).then((onValue) {
                                            var parentState =
                                                context.findAncestorStateOfType<
                                                    Bottom_Navigation_BarState>();

                                            if (parentState != null) {
                                              parentState.setState(() {
                                                parentState.b(2);
                                              });
                                            }
                                          });
                                        } else {
                                          ShowToastMessage(
                                              userRegisterResponse.message ??
                                                  "");
                                        }
                                      }
                                    });
                                  }
                                } else {
                                  ShowToastMessage(
                                      "Your wallet amount is low so please recharge and place the order");
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Center(
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
                        const Text('No Items Found!!'),
                      ],
                    ),
                  ),
                ));
        },
        error: (Object error, StackTrace stackTrace) {
          return Text(error.toString());
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future<void> coupenCodeApply(String code) async {
    LoadingOverlay.show(context);

    var formData = <String, dynamic>{
      "CH_USER_ID": await getuserId(),
      "Cart_Header_TED": [
        {"CHT_TED_DESC": code}
      ]
    };

    final result = await ref.read(AddToCardProvider(formData).future);

    LoadingOverlay.forcedStop();
    if (result?.status == "true") {
      ShowToastMessage(result?.message ?? "");

      setState(() {
        couponCode = code;
      });
    } else {
      ShowToastMessage(result?.message ?? "");
    }
  }
}
