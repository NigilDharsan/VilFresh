import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/Src/Sign_Up_Ui/Sign_Up_Screen1.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class My_Address extends ConsumerStatefulWidget {
  const My_Address({super.key});

  @override
  ConsumerState<My_Address> createState() => _My_AddressState();
}

class _My_AddressState extends ConsumerState<My_Address> {
  bool? isaddressShow = true;

  @override
  Widget build(BuildContext context) {
    backNav(String addressID) {
      Navigator.of(context).pop(addressID);
    }

    final result = ref.watch(AddressApiProvider);

    return Scaffold(
        backgroundColor: backGround1,
        appBar: Custom_AppBar(
          title: 'My Address',
          actions: [
            isaddressShow == false
                ? Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 35,
                    width: 35,
                    child: Center(
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Sign_Up_Screen1()));
                          },
                          child: const Icon(
                            Icons.add,
                            color: green1,
                            size: 35,
                          )),
                    ))
                : Container(),
          ],
          isNav: true,
          isGreen: false,
        ),
        body: result.when(
          data: (data) {
            setState(() {
              isaddressShow =
                  data?.data?[0].addressNewButton == "No" ? true : false;
            });
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
                          const Text('No Address!'),
                        ],
                      ),
                    ),
                  ))
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //ADDRESS LIST
                          ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: data?.data?.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      data?.data?[index].ischeck = true;
                                    });
                                    showDialog<void>(
                                      context: context,
                                      barrierDismissible:
                                          false, // Prevents closing the dialog by tapping outside of it
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text("Place Order"),
                                          content: const Text(
                                              'Are you sure you want to confirm this address to place the order?'),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text('Cancel'),
                                              onPressed: () {
                                                setState(() {
                                                  data?.data?[index].ischeck =
                                                      false;
                                                });
                                                Navigator.of(context)
                                                    .pop(); // Closes the dialog
                                              },
                                            ),
                                            TextButton(
                                              child: const Text('Yes'),
                                              onPressed: () async {
                                                Navigator.of(context)
                                                    .pop(); // Closes the dialog
                                                backNav(data?.data?[index]
                                                        .addressID ??
                                                    "");
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: white1),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15,
                                            right: 15,
                                            top: 20,
                                            bottom: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //INSIDE LIST
                                            Row(
                                              children: [
                                                Text(
                                                  'Full Name : ${data?.data?[index].fullName}',
                                                  style: CouponT,
                                                ),
                                                const Spacer(),
                                                data?.data?[index].ischeck ==
                                                        true
                                                    ? const Icon(
                                                        Icons.check_circle)
                                                    : Container()
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              'Email ID : ${data?.data?[index].emailID}',
                                              style: CouponT,
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              'Residency Type : ${data?.data?[index].residencyType}',
                                              style: CouponT,
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              'Address : ${data?.data?[index].houseFlatNo}, ${data?.data?[index].floorNo}, ${data?.data?[index].streetColony}, ${data?.data?[index].area}, ${data?.data?[index].city} - ${data?.data?[index].pinCode}',
                                              style: CouponT,
                                            ),

                                            // const SizedBox(height: 20),
                                            // Row(
                                            //   mainAxisAlignment:
                                            //       MainAxisAlignment.spaceEvenly,
                                            //   crossAxisAlignment:
                                            //       CrossAxisAlignment.start,
                                            //   children: [
                                            //     InkWell(
                                            //       onTap: () {},
                                            //       child: Buttons(context,
                                            //           text: 'Edit',
                                            //           color: Colors.green),
                                            //     ),
                                            //     InkWell(
                                            //       onTap: () {
                                            //         showDialog<void>(
                                            //           context: context,
                                            //           barrierDismissible:
                                            //               false, // Prevents closing the dialog by tapping outside of it
                                            //           builder: (BuildContext
                                            //               context) {
                                            //             return AlertDialog(
                                            //               title: Text('Delete'),
                                            //               content: Text(
                                            //                   'Are you sure to delete the address'),
                                            //               actions: <Widget>[
                                            //                 TextButton(
                                            //                   child: Text(
                                            //                       'Cancel'),
                                            //                   onPressed: () {
                                            //                     Navigator.of(
                                            //                             context)
                                            //                         .pop(); // Closes the dialog
                                            //                   },
                                            //                 ),
                                            //                 TextButton(
                                            //                   child: Text('OK'),
                                            //                   onPressed:
                                            //                       () async {
                                            //                     LoadingOverlay
                                            //                         .show(
                                            //                             context);
                                            //                     var formData =
                                            //                         <String,
                                            //                             dynamic>{
                                            //                       "Address_ID": data
                                            //                           ?.data?[
                                            //                               index]
                                            //                           .addressID,
                                            //                     };

                                            //                     final result =
                                            //                         await ref
                                            //                             .read(
                                            //                       addressDeleteProvider(
                                            //                               formData)
                                            //                           .future,
                                            //                     );
                                            //                     LoadingOverlay
                                            //                         .forcedStop();
                                            //                     if (result
                                            //                             ?.status ==
                                            //                         "True") {
                                            //                       ShowToastMessage(
                                            //                           result?.message ??
                                            //                               "");
                                            //                       Navigator.of(
                                            //                               context)
                                            //                           .pop(); // Closes the dialog
                                            //                       ref.refresh(
                                            //                           AddressApiProvider);
                                            //                     } else {
                                            //                       ShowToastMessage(
                                            //                           result?.message ??
                                            //                               "");
                                            //                       Navigator.of(
                                            //                               context)
                                            //                           .pop(); // Closes the dialog
                                            //                     }
                                            //                   },
                                            //                 ),
                                            //               ],
                                            //             );
                                            //           },
                                            //         );
                                            //       },
                                            //       child: Buttons(context,
                                            //           text: 'Delete',
                                            //           color: Colors.red),
                                            //     ),
                                            //   ],
                                            // )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              })
                        ],
                      ),
                    ),
                  );
          },
          error: (Object error, StackTrace stackTrace) {
            return Text(error.toString());
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        ));
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
