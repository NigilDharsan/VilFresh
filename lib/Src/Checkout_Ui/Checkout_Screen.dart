import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Common_Widgets/Common_Button.dart';
import 'package:vilfresh/Common_Widgets/Common_List.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/Common_Widgets/Text_Form_Field.dart';
import 'package:vilfresh/Src/Coupon_Ui/Coupon_Screen.dart';
import 'package:vilfresh/Src/My_Address_Ui/My_Address.dart';
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
  bool _Custom_icon = false;

  String? coupenCode = "";

  @override
  Widget build(BuildContext context) {
    final selecttimedate = ref.watch(TimeanddateApiProvider);
    final getkartData = ref.watch(GetCartProvider);

    return Scaffold(
        backgroundColor: white1,
        appBar: Custom_AppBar(
            title: "Checkout", actions: null, isNav: false, isGreen: false),
        body: getkartData.when(data: (data) {
          return SingleChildScrollView(
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    //PRODUCT DETAIL

                    Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          //physics: const NeverScrollableScrollPhysics(),
                          itemCount: (data?.data?.length ?? 0) - 1,
                          itemBuilder: (context, index) {
                            return CheckOut_List(
                              context,
                              productname: data?.data?[index].iTEMNAME ?? "",
                              varient: data?.data?[index].iTEMVARIANT ?? "",
                              qty: data?.data?[index].qty ?? "",
                              totalamt: data?.data?[index].totalAmt ?? "",
                              image: data?.data?[index].image ?? "",
                              deleteBtn: () async {
                                LoadingOverlay.show(context);

                                var formData = <String, dynamic>{
                                  "CH_USER_ID": await getuserId(),
                                  'Cart_Items': [
                                    {
                                      "CI_ITEM_ID": data?.data?[index].itemID,
                                      "CI_VARIANT_TYPE":
                                          data?.data?[index].iTEMVARIANT,
                                    }
                                  ],
                                };

                                final result = await ref.read(
                                    AddToCardDeleteProvider(formData).future);

                                LoadingOverlay.forcedStop();
                                // Handle the result
                                if (result?.status == true) {
                                  ShowToastMessage(result?.message ?? "");

                                  ref.refresh(GetCartProvider);
                                  // Handle success
                                } else {
                                  // Handle failure
                                  ShowToastMessage(result?.message ?? "");
                                }
                              },
                            );
                          }),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    //SUBTOTAL
                    Row(
                      children: [
                        Text(
                          "Subtotal",
                          style: walletBalanceT1,
                        ),
                        const Spacer(),
                        Text(
                          "RS.",
                          style: walletBalanceT1,
                        ),
                        Text(
                          data?.data?[(data.data?.length ?? 0) - 1].netAMt ??
                              "",
                          style: enterAmountT,
                        ),
                      ],
                    ),
                    //SHIPPING CHARGES
                    Row(
                      children: [
                        Text(
                          "SHIPPING CHARGES",
                          style: walletBalanceT1,
                        ),
                        const Spacer(),
                        Text(
                          "FREE",
                          style: enterAmountT,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //TOTAL
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
                          data?.data?[(data.data?.length ?? 0) - 1].totalAmt ??
                              "",
                          style: enterAmountT,
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 20),
                      width: MediaQuery.sizeOf(context).width / 1.2,
                      child: Text(
                        'The maximum amount will be on hold from your wallet. The amount will be detected once the product cut off time is over.',
                        style: Textfield_Style,
                        maxLines: 3,
                      ),
                    ),

                    //COUPONS
                    Text(
                      "Coupons & Discounts",
                      style: qntT,
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: white2),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                                        Coupon_Screen()))
                                            .then((onValue) async {
                                          if (onValue != null) {
                                            LoadingOverlay.show(context);

                                            var formData = <String, dynamic>{
                                              "CH_USER_ID": await getuserId(),
                                              "Cart_Header_TED": [
                                                {"CHT_TED_DESC": onValue}
                                              ]
                                            };

                                            final result = await ref.read(
                                                AddToCardProvider(formData)
                                                    .future);

                                            LoadingOverlay.forcedStop();
                                            // Handle the result
                                            if (result?.status == "true") {
                                              ShowToastMessage(
                                                  result?.message ?? "");

                                              setState(() {
                                                coupenCode = onValue;
                                              });
                                              ref.refresh(GetCartProvider);
                                              // Handle success
                                            } else {
                                              // Handle failure
                                              ShowToastMessage(
                                                  result?.message ?? "");
                                            }
                                          }
                                        });
                                      },
                                      child: Text(
                                        "View All",
                                        style: viewOrg,
                                      ))
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: white1),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text(
                                  "You can view all available offer by clicking view all offer or you can enter promo code directly",
                                  style: circularT,
                                  maxLines: 2,
                                )),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 15),
                              child: Row(
                                children: [
                                  coupenCode == ""
                                      ? Container(
                                          width:
                                              MediaQuery.sizeOf(context).width /
                                                  2,
                                          child: textFormField_green(
                                            hintText: 'Enter Promo Code',
                                            keyboardtype: TextInputType.text,
                                            inputFormatters: null,
                                            Controller: null,
                                            validating: (value) {
                                              if (value!.isEmpty) {
                                                return "Please enter a Block / Tower";
                                              } else if (value == null) {
                                                return "Please enter a Block / Tower";
                                              }
                                              return null;
                                            },
                                            onChanged: null,
                                          ),
                                        )
                                      : Text(coupenCode!),
                                  const Spacer(),
                                  Text(
                                    coupenCode == "" ? 'Apply' : "Applied",
                                    style: shopT,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //DELIVERY SLOT
                    Text(
                      "Delivery Slot",
                      style: qntT,
                    ),
                    selecttimedate.when(data: (data) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white2,
                          ),
                          child: Theme(
                            data: ThemeData(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              trailing: SizedBox.shrink(),
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
                                        ? Icon(
                                            Icons.keyboard_arrow_down,
                                            color: green2,
                                          )
                                        : Icon(
                                            Icons.chevron_right,
                                            color: green2,
                                          ),
                                  ],
                                ),
                              ),
                              tilePadding: EdgeInsets.only(left: 20),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5, bottom: 10),
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      //physics: const NeverScrollableScrollPhysics(),
                                      itemCount: data?.data?.length ?? 0,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Text(
                                            data?.data?[index].description ??
                                                "",
                                            style: subscribeHT,
                                          ),
                                          subtitle: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 70),
                                            child: Row(
                                              children: [
                                                Text(
                                                  data?.data?[index].time ?? "",
                                                  style: subscribeHT,
                                                ),
                                                const Spacer(),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      // toggleValues[index] = ! toggleValues[index];
                                                    });
                                                  },
                                                  // child: toggleValues[index] ? ImgPathPng('switchon.png') : ImgPathPng('switchoff.png'),
                                                  child: ImgPathPng(
                                                      'switchoff.png'),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }, error: (error, _) {
                      return Text('ERROR');
                    }, loading: () {
                      return Center(child: CircularProgressIndicator());
                    }),

                    //BUTTON
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 50),
                      child: CommonElevatedButtonGreen(context, "Place Order",
                          () async {
                        final result =
                            await ref.read(AddressApiProvider.future);

                        if ((result?.data?.length ?? 0) != 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => My_Address(
                                        addressData: result?.data ?? [],
                                      )));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Sign_Up_Screen1()));
                        }
                      }),
                    )
                  ],
                ),
              ),
            ),
          );
        }, error: (Object error, StackTrace stackTrace) {
          return Text(error.toString());
        }, loading: () {
          return Center(child: CircularProgressIndicator());
        }));
  }
}
