import 'package:flutter/material.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Model/AddressModel.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class My_Address extends StatefulWidget {
  List<AddressData> addressData = [];

  My_Address({super.key, required this.addressData});

  @override
  State<My_Address> createState() => _My_AddressState();
}

class _My_AddressState extends State<My_Address> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround1,
      appBar: Custom_AppBar(
        title: 'My Address',
        actions: null,
        isNav: true,
        isGreen: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //ADDRESS LIST
              ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  //physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.addressData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: white1),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 20, bottom: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //INSIDE LIST
                              Text(
                                'Full Name : ${widget.addressData[index].fullName}',
                                style: CouponT,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Email ID : ${widget.addressData[index].emailID}',
                                style: CouponT,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Residency Type : ${widget.addressData[index].residencyType}',
                                style: CouponT,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Address : ${widget.addressData[index].houseFlatNo}, ${widget.addressData[index].floorNo}, ${widget.addressData[index].streetColony}, ${widget.addressData[index].area}, ${widget.addressData[index].city} - ${widget.addressData[index].pinCode}',
                                style: CouponT,
                              ),

                              const SizedBox(height: 20),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Buttons(context,
                                      text: 'Edit', color: Colors.green),
                                  Buttons(context,
                                      text: 'Delete', color: Colors.red),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

Widget Buttons(context, {required String text, required Color? color}) {
  return Container(
    width: MediaQuery.sizeOf(context).width / 2.8,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
    child: Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Center(
          child: Text(
        text,
        style: ButtonT1,
      )),
    ),
  );
}
