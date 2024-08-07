import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:vilfresh/Common_Widgets/Common_Button.dart';
import 'package:vilfresh/Common_Widgets/Common_Pop_Up.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Src/Subscription_Checkout_Ui/Subscription_CheckOut_Screen.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class Subscription_Detail_Screen extends ConsumerStatefulWidget {
  String? productname;
  String? image;
  String? actualprice;
  String? catogoryname;
  String? deliverydate;
  String? varient;
   Subscription_Detail_Screen({super.key,required this.productname,required this.image,required this.actualprice,required this.catogoryname,required this.deliverydate,required this.varient});

  @override
  ConsumerState<Subscription_Detail_Screen> createState() =>
      _Subscription_Detail_ScreenState();
}

class _Subscription_Detail_ScreenState
    extends ConsumerState<Subscription_Detail_Screen> {
  DateTime _selectedDate = DateTime.now();
  String getFormattedDate(DateTime date) {
    final DateFormat formatter = DateFormat('EEE, MMM d, yyyy');
    return formatter.format(date);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime today = DateTime.now();
    final DateTime tomorrow = today.add(Duration(days: 1));
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: tomorrow,
      firstDate: tomorrow,
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate ) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white1,
      appBar: Custom_AppBar(
          title: "Subscription Details",
          actions: null,
          isNav: true,
          isGreen: false),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 15, bottom: 20),
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                      image: NetworkImage(widget.image ?? ""))
                ),
              ),
              //PRODUCT NAME
              Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  width: MediaQuery.sizeOf(context).width / 1.5,
                  child: Center(
                      child: Text(
                        widget.productname ?? '', style: knowT, maxLines: 2,
                      ))),
              //PRICE
              Container(
                margin:
                EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                child: Row(
                  children: [
                    Text(
                      widget.catogoryname ?? "",
                      style: knowT,
                    ),
                    const Spacer(),
                    Text(
                      '₹ ${widget.actualprice ?? ''}',
                      style: knowT,
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: green2,
              ),
              Container(
                  margin:
                  EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  width: MediaQuery.sizeOf(context).width / 1.2,
                  child: Text(
                    "Order before 8.00 PM & get the delivery by next day",
                    style: subscribeHT,
                    maxLines: 2,
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Starts On",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: green2),
                        ),
                        GestureDetector(
                          onTap: () => _selectDate(context),
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
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: green2,
              ),

              //SELECT FREQUENCY
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Select Frequency',
                      style: kgT,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20,),
                child: Row(
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Frequency_Pop(context);
                                });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: green5),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: Center(
                                  child: Text(
                                    "Everyday",
                                    style: startOnT,
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                                ),
                                context: context,
                                builder: (BuildContext context) {
                                  return EveryDay_Pop2(
                                    deliverydata: widget.deliverydate ?? "",
                                    startdate: _selectedDate.toString());
                                  // EveryDay_Pop(context);
                                });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: green5),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: Center(
                                  child: Text(
                                    "Custom",
                                    style: startOnT,
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Divider(
                  thickness: 2,
                  color: green2,
                ),
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Subscription_CheckOut_Screen()));
                  },
                  child: Custom_Button(context, customTxt: 'Subscribe')),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
