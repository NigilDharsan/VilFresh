import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:vilfresh/Common_Widgets/Common_Button.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/Model/SubscribeDetailsModel.dart';
import 'package:vilfresh/Src/Checkout_Ui/OrderSuccess.dart';
import 'package:vilfresh/Src/My_Address_Ui/My_Address.dart';
import 'package:vilfresh/Src/Subscription_Detail_Ui/Subscription_Detail_Screen.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Generic.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class Subscription_CheckOut_Screen extends ConsumerStatefulWidget {
  List<Day> subscribeArray = [];
  DateTime selectedDate;
  SubscribeData subscridata;
  String typeOfScription;
  Function(bool) pageRefresh;

  Subscription_CheckOut_Screen(
      {super.key,
      required this.subscribeArray,
      required this.selectedDate,
      required this.subscridata,
      required this.typeOfScription,
      required this.pageRefresh});

  @override
  ConsumerState<Subscription_CheckOut_Screen> createState() =>
      _Subscription_CheckOut_ScreenState();
}

class _Subscription_CheckOut_ScreenState
    extends ConsumerState<Subscription_CheckOut_Screen> {
  String getFormattedDate(DateTime date) {
    final DateFormat formatter = DateFormat('EEE, MMM d, yyyy');
    return formatter.format(date);
  }

  String dateConvert(DateTime date) {
    final DateFormat formatter = DateFormat('MM/dd/yyyy');
    return formatter.format(date);
  }

  bool? _Custom_icon;
  List<bool> toggleValues = [];
  int? LenghtCal = 5;
  String? slotID = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    toggleValues = List.generate(LenghtCal ?? 0, (index) => true);
  }

  @override
  Widget build(BuildContext context) {
    final selecttimedate = ref.watch(TimeanddateApiProvider);

    return Scaffold(
      backgroundColor: white1,
      appBar: Custom_AppBar(
          title: "Subscription Checkout",
          actions: null,
          isNav: true,
          isGreen: false),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //PRODUCT DETAIL
                Container(
                  margin: EdgeInsets.only(top: 15, bottom: 20),
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: white2),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //PRODUCT IMAGE AND PRICE
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Container(
                              //   height: 100,
                              //   width: 100,
                              //   child: ImgPathPng("glassmilk.png"),
                              // ),
                              Container(
                                alignment: Alignment.center,
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            widget.subscridata.image ?? ""))),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: MediaQuery.sizeOf(context).width -
                                          230,
                                      child: Text(
                                        widget.subscridata.itemName ?? "",
                                        style: shopT,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: Text(
                                      widget.subscridata.variantName ?? "",
                                      style: subscribeHT,
                                    ),
                                  ),
                                  Text(
                                    widget.subscridata.price ?? "",
                                    style: shopT,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          color: white1,
                        ),
                        //SCHEDULE
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Schedule Pattern:",
                                style: subscribeHT,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.typeOfScription,
                                style: CouponT,
                              ),
                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 44,
                          child: ListView.builder(
                              itemCount: widget.subscribeArray.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          child: Text(widget
                                              .subscribeArray[index].day
                                              .substring(0, 3)),
                                        ),
                                        Container(
                                          child: Text(widget
                                              .subscribeArray[index]
                                              .morningQty),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 5,
                                    )
                                  ],
                                );
                              }),
                        ),

                        // Text(
                        //   "DAY 1",
                        //   style: Textfield_Style,
                        // ),
                        // Container(
                        //     width: MediaQuery.sizeOf(context).width / 1.8,
                        //     child: Text(
                        //       "Morning: 1    Evening: 1",
                        //       style: shopT,
                        //       maxLines: 1,
                        //     )),
                        // Text(
                        //   "DAY 2",
                        //   style: Textfield_Style,
                        // ),
                        // Container(
                        //     width: MediaQuery.sizeOf(context).width / 1.8,
                        //     child: Text(
                        //       "Morning: 1    Evening: 1",
                        //       style: shopT,
                        //       maxLines: 2,
                        //     )),
                        //SUBSCRIBE DATE
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Text(
                            "Subscription start date:",
                            style: subscribeHT,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(bottom: 20),
                            width: MediaQuery.sizeOf(context).width - 40,
                            child: Text(
                              getFormattedDate(widget.selectedDate),
                              style: shopT,
                              maxLines: 2,
                            )),
                      ],
                    ),
                  ),
                ),
                //COUPONS
                // Text(
                //   "Coupons & Discounts",
                //   style: qntT,
                // ),
                // Container(
                //   width: MediaQuery.sizeOf(context).width,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10), color: white2),
                //   child: Padding(
                //     padding: const EdgeInsets.only(left: 15, right: 15),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.only(top: 15, bottom: 10),
                //           child: Row(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             mainAxisAlignment: MainAxisAlignment.start,
                //             children: [
                //               ImgPathPng('discount.png'),
                //               Text(
                //                 "Select Promo Code",
                //                 style: shopT,
                //               ),
                //               const Spacer(),
                //               Text(
                //                 "View All",
                //                 style: viewOrg,
                //               )
                //             ],
                //           ),
                //         ),
                //         Container(
                //           decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(5),
                //               color: white1),
                //           child: Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: Center(
                //                 child: Text(
                //               "You can view all available offer by clicking view all offer or you can enter promo code directly",
                //               style: circularT,
                //               maxLines: 2,
                //             )),
                //           ),
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.only(top: 10, bottom: 15),
                //           child: Row(
                //             children: [
                //               Container(
                //                 width: MediaQuery.sizeOf(context).width / 2,
                //                 child: textFormField_green(
                //                   hintText: 'Enter Promo Code',
                //                   keyboardtype: TextInputType.text,
                //                   inputFormatters: null,
                //                   Controller: null,
                //                   validating: (value) {
                //                     if (value!.isEmpty) {
                //                       return "Please enter a Block / Tower";
                //                     } else if (value == null) {
                //                       return "Please enter a Block / Tower";
                //                     }
                //                     return null;
                //                   },
                //                   onChanged: null,
                //                 ),
                //               ),
                //               const Spacer(),
                //               Text(
                //                 'Apply',
                //                 style: shopT,
                //               )
                //             ],
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // DELIVERY SLOT
                Text(
                  "Delivery Slot",
                  style: qntT,
                ),
                selecttimedate.when(
                  data: (data) {
                    LenghtCal = data?.data?.length ?? 0;
                    print("Length ${LenghtCal}");
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
                                padding:
                                    const EdgeInsets.only(left: 5, bottom: 10),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: data?.data?.length ?? 0,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(
                                        data?.data?[index].description ?? "",
                                        style: subscribeHT,
                                      ),
                                      subtitle: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 70),
                                        child: Row(
                                          children: [
                                            Text(
                                              data?.data?[index].time ?? "",
                                              style: subscribeHT,
                                            ),
                                            const Spacer(),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  toggleValues[index] =
                                                      !toggleValues[
                                                          index]; // Toggle the value
                                                });
                                              },
                                              child: toggleValues[index]
                                                  ? ImgPathPng('switchon.png')
                                                  : ImgPathPng('switchoff.png'),
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
                    return Text('ERROR');
                  },
                  loading: () {
                    return Center(child: CircularProgressIndicator());
                  },
                ),
                // Container(
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10), color: white2),
                //   child: Padding(
                //     padding: const EdgeInsets.only(
                //         left: 15, right: 15, top: 10, bottom: 10),
                //     child: Row(
                //       children: [
                //         Text(
                //           "Delivery time slot",
                //           style: kgT,
                //         ),
                //         const Spacer(),
                //         Icon(
                //           Icons.keyboard_arrow_down,
                //           color: green2,
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                //BUTTON
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 50),
                  child: CommonElevatedButtonGreen(context, "Place Order",
                      () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => My_Address(),
                      ),
                    ).then((onValue) async {
                      if (onValue != "" && onValue != null) {
                        final userRegisterApiService =
                            ApiService(ref.read(dioProvider));

                        List<Map<String, String>> days = [];

                        for (int i = 0; i < widget.subscribeArray.length; i++) {
                          final subscriday = {
                            "Day": widget.subscribeArray[i].day,
                            "Morning_Qty": widget.subscribeArray[i].morningQty,
                            "Evening_Qty": widget.subscribeArray[i].eveningQty
                          };

                          days.add(subscriday);
                        }
                        Map<String, dynamic> formData = {
                          "User_ID": SingleTon().user_id,
                          "Item_ID": widget.subscridata.itemID,
                          "From_Date": dateConvert(widget.selectedDate),
                          "To_Date": null,
                          "Item_Variant_ID": widget.subscridata.variantID,
                          "Address_ID": onValue,
                          "Coupen_ID": "0",
                          "Delivery_Slot_ID": slotID,
                          "subscribe": days
                        };
                        final userRegisterResponse =
                            await userRegisterApiService.SubscribeApiService(
                                formData: formData);
                        if (userRegisterResponse.status == "true") {
                          ShowToastMessage(userRegisterResponse.message ?? "");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderSuccess(),
                            ),
                          ).then((onValue) {
                            widget.pageRefresh(true);
                            int count = 0;
                            Navigator.popUntil(context, (route) {
                              return count++ ==
                                  2; // Stops when two screens are popped
                            });
                          });
                        } else {
                          ShowToastMessage(userRegisterResponse.message ?? "");
                        }
                      }
                    });
                  }),
                  //   Custom_Button(context, customTxt: 'Subscribe',
                  //     onTap: () async {

                  // }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
