import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:vilfresh/Common_Widgets/Common_Pop_Up.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/Src/Subscription_Checkout_Ui/Subscription_CheckOut_Screen.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Generic.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class Day {
  String day;
  String morningQty;
  String eveningQty;

  Day({required this.day, required this.morningQty, required this.eveningQty});
}

class Subscription_Detail_Screen extends ConsumerStatefulWidget {
  String? varient_ID;
  String? Item_Id;
  Function(bool) pageRefresh;
  Subscription_Detail_Screen(
      {super.key,
      required this.varient_ID,
      required this.Item_Id,
      required this.pageRefresh});

  @override
  ConsumerState<Subscription_Detail_Screen> createState() =>
      _Subscription_Detail_ScreenState();
}

class _Subscription_Detail_ScreenState
    extends ConsumerState<Subscription_Detail_Screen> {
  DateTime _selectedDate = DateTime.now().add(const Duration(days: 1));
  DateTime _selectedToDate = DateTime.now().add(const Duration(days: 1));

  var formData = <String, dynamic>{};

  String getFormattedDate(DateTime date) {
    final DateFormat formatter = DateFormat('EEE, MMM d, yyyy');
    return formatter.format(date);
  }

  String dateConvert(DateTime date) {
    final DateFormat formatter = DateFormat('MM/dd/yyyy');
    return formatter.format(date);
  }

  Future<void> _selectDate(BuildContext context, String type) async {
    if (type == "Start") {
      final DateTime today = DateTime.now();
      final DateTime tomorrow = today.add(const Duration(days: 1));
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: tomorrow,
        firstDate: tomorrow,
        lastDate: DateTime(2101),
      );

      if (picked != null && picked != _selectedDate) {
        setState(() {
          _selectedDate = picked;
        });
      }
    } else {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: _selectedDate,
        lastDate: DateTime(2101),
      );

      if (picked != null && picked != _selectedToDate) {
        setState(() {
          _selectedToDate = picked;
        });
      }
    }
  }

  List<Day> subscribeArray = [
    Day(day: "Sunday", morningQty: "0", eveningQty: "0"),
    Day(day: "Monday", morningQty: "0", eveningQty: "0"),
    Day(day: "Tuesday", morningQty: "0", eveningQty: "0"),
    Day(day: "Wednesday", morningQty: "0", eveningQty: "0"),
    Day(day: "Thursday", morningQty: "0", eveningQty: "0"),
    Day(day: "Friday", morningQty: "0", eveningQty: "0"),
    Day(day: "Saturday", morningQty: "0", eveningQty: "0"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    formData = <String, dynamic>{
      "Variant_ID": widget.varient_ID,
      "Item_ID": widget.Item_Id,
      "User_ID": SingleTon().user_id,
    };
  }

  @override
  Widget build(BuildContext context) {
    final subscribeDetail = ref.watch(subscribeDetailProvider(formData));

    return Scaffold(
        backgroundColor: white1,
        appBar: Custom_AppBar(
            title: "Subscription Details",
            actions: null,
            isNav: true,
            isGreen: false),
        body: subscribeDetail.when(
          data: (data) {
            return SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 15, bottom: 20),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(data?.data?[0].image ?? ""))),
                    ),
                    Container(
                        margin: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 20, right: 20),
                        width: MediaQuery.sizeOf(context).width / 1.2,
                        child: Text(
                          "Order before 8.00 PM & get the delivery by next day",
                          style: subscribeHT,
                          maxLines: 2,
                        )),
                    //PRODUCT NAME
                    Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        width: MediaQuery.sizeOf(context).width / 1.5,
                        child: Center(
                            child: Text(
                          data?.data?[0].itemName ?? "",
                          style: knowT,
                          maxLines: 2,
                        ))),
                    //PRICE
                    Container(
                      margin: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 20, right: 20),
                      child: Text(
                        '₹${data?.data?[0].price ?? ""}',
                        style: knowT,
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                      color: green2,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const Text(
                                "Starts On",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: green2),
                              ),
                              GestureDetector(
                                onTap: () => _selectDate(context, "Start"),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: green5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(
                                      getFormattedDate(_selectedDate),
                                      style: startOnT,
                                    )),
                                  ),
                                ),
                              )
                            ],
                          ),
                          // const Spacer(),
                          // Column(
                          //   children: [
                          //     Text(
                          //       "Ends On",
                          //       style: TextStyle(
                          //           fontSize: 20,
                          //           fontWeight: FontWeight.w400,
                          //           color: green2),
                          //     ),
                          //     GestureDetector(
                          //       onTap: () => _selectDate(context, "End"),
                          //       child: Container(
                          //         decoration: BoxDecoration(
                          //             borderRadius: BorderRadius.circular(5),
                          //             color: green5),
                          //         child: Padding(
                          //           padding: const EdgeInsets.all(8.0),
                          //           child: Center(
                          //               child: Text(
                          //             getFormattedDate(_selectedToDate),
                          //             style: startOnT,
                          //           )),
                          //         ),
                          //       ),
                          //     )
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                      color: green2,
                    ),

                    //SELECT FREQUENCY
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 20),
                      child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Select Frequency',
                            style: shopT,
                          )),
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return SizedBox(
                                      height: 220,
                                      child: Frequency_PopUp(
                                        deliverydata: '',
                                        startdate: '',
                                        onCountUpdate: (count) {
                                          for (var day in subscribeArray) {
                                            day.morningQty = "$count";
                                          }
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Subscription_CheckOut_Screen(
                                                          subscribeArray:
                                                              subscribeArray,
                                                          selectedDate:
                                                              _selectedDate,
                                                          subscridata:
                                                              data!.data![0],
                                                          typeOfScription:
                                                              'Daily Subscription',
                                                          pageRefresh: widget
                                                              .pageRefresh)));
                                        },
                                      ));
                                });
                          },
                          child: Container(
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: green5),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: Center(
                                  child: Text(
                                'Daily Subscription',
                                style: startOnT,
                              )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25)),
                                ),
                                context: context,
                                builder: (BuildContext context) {
                                  return EveryDay_Pop2(
                                    deliverydata: "",
                                    startdate: _selectedDate.toString(),
                                    subscribeArray: subscribeArray,
                                    onCountUpdate: (subscriList) {
                                      subscribeArray = subscriList;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Subscription_CheckOut_Screen(
                                                      subscribeArray:
                                                          subscribeArray,
                                                      selectedDate:
                                                          _selectedDate,
                                                      subscridata:
                                                          data!.data![0],
                                                      typeOfScription:
                                                          'Custom Subscription',
                                                      pageRefresh:
                                                          widget.pageRefresh)));
                                    },
                                  );
                                  // EveryDay_Pop(context);
                                });
                          },
                          child: Container(
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: green5),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: Center(
                                  child: Text(
                                "Custom Subscription",
                                style: startOnT,
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Divider(
                        thickness: 2,
                        color: green2,
                      ),
                    ),
                    // Custom_Button(context, customTxt: 'Subscribe',
                    //     onTap: () async {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             Subscription_CheckOut_Screen()));

                    //   final userRegisterApiService =
                    //       ApiService(ref.read(dioProvider));

                    //   List<Map<String, String>> days = [];

                    //   for (int i = 0; i < subscribeArray.length; i++) {
                    //     final subscriday = {
                    //       "Day": subscribeArray[i].day,
                    //       "Morning_Qty": subscribeArray[i].morningQty,
                    //       "Evening_Qty": subscribeArray[i].eveningQty
                    //     };

                    //     days.add(subscriday);
                    //   }
                    //   Map<String, dynamic> formData = {
                    //     "User_ID": SingleTon().user_id,
                    //     "Item_ID": data?.data?[0].itemID ?? "",
                    //     "From_Date": dateConvert(_selectedDate),
                    //     "To_Date": null,
                    //     "Item_Variant_ID": data?.data?[0].variantID ?? "",
                    //     "subscribe": days
                    //   };
                    //   final userRegisterResponse =
                    //       await userRegisterApiService.SubscribeApiService(
                    //           formData: formData);
                    //   if (userRegisterResponse.status == "true") {
                    //     ShowToastMessage(userRegisterResponse.message ?? "");
                    //     Navigator.of(context).pop(true);
                    //   } else {
                    //     ShowToastMessage(userRegisterResponse.message ?? "");
                    //   }
                    // }),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
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
                    const Text('Nothing here!'),
                    const Text('You dont have any selected date')
                  ],
                ),
              ),
            ));
          },
          loading: () => const Center(child: CircularProgressIndicator()),
        ));
  }
}
