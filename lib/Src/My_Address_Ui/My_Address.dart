import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Model/AddressModel.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Generic.dart';
import 'package:vilfresh/utilits/Loading_Overlay.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class My_Address extends ConsumerStatefulWidget {
  List<AddressData> addressData = [];

  My_Address({super.key, required this.addressData});

  @override
  ConsumerState<My_Address> createState() => _My_AddressState();
}

class _My_AddressState extends ConsumerState<My_Address> {
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
                                  InkWell(
                                    onTap: () {},
                                    child: Buttons(context,
                                        text: 'Edit', color: Colors.green),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showDialog<void>(
                                        context: context,
                                        barrierDismissible:
                                            false, // Prevents closing the dialog by tapping outside of it
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Delete'),
                                            content: Text(
                                                'Are you sure to delete the address'),
                                            actions: <Widget>[
                                              TextButton(
                                                child: Text('Cancel'),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop(); // Closes the dialog
                                                },
                                              ),
                                              TextButton(
                                                child: Text('OK'),
                                                onPressed: () async {
                                                  LoadingOverlay.show(context);
                                                  var formData =
                                                      <String, dynamic>{
                                                    "Address_ID": widget
                                                        .addressData[index]
                                                        .addressID,
                                                  };

                                                  final result = await ref.read(
                                                    addressDeleteProvider(
                                                            formData)
                                                        .future,
                                                  );
                                                  LoadingOverlay.forcedStop();
                                                  if (result?.status ==
                                                      "true") {
                                                    ShowToastMessage(
                                                        result?.message ?? "");
                                                    Navigator.pop(context);
                                                  } else {
                                                    ShowToastMessage(
                                                        result?.message ?? "");
                                                    Navigator.pop(context);
                                                  }
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Buttons(context,
                                        text: 'Delete', color: Colors.red),
                                  ),
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
