import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Common_Widgets/Common_Pop_Up.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Generic.dart';

import '../../utilits/Common_Colors.dart';

class Help_SupportList extends ConsumerStatefulWidget {
  const Help_SupportList({super.key});

  @override
  ConsumerState<Help_SupportList> createState() => _Help_SupportListState();
}

class _Help_SupportListState extends ConsumerState<Help_SupportList> {
  @override
  Widget build(BuildContext context) {
    final hsList = ref.watch(getHSListProvider);

    return Scaffold(
      backgroundColor: backGround1,
      appBar: Custom_AppBar(
        title: 'Help & Support List',
        actions: null,
        isNav: true,
        isGreen: false,
      ),
      body: hsList.when(
        data: (data) {
          if (data?.data?.length == 0) {
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
                    const Text('No Data Founds')
                  ],
                ),
              ),
            ));
          } else {
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
              child: ListView.builder(
                itemCount: data?.data?.length ?? 0,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black45),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 10, bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            data?.data?[index].invoiceNo == ''
                                ? Container()
                                : Details(context,
                                    text: 'Invoice No',
                                    text2: '${data?.data?[index].invoiceNo}'),
                            data?.data?[index].invoiceNo == ''
                                ? Container()
                                : Details(context,
                                    text: 'Item Details',
                                    text2: '${data?.data?[index].itemDetails}'),
                            Details(context,
                                text: 'Issue',
                                text2: '${data?.data?[index].issue}'),
                            Row(
                              children: [
                                Details2(context,
                                    text: 'Status',
                                    text2: '${data?.data?[index].status}'),
                                const Spacer(),
                                SizedBox(
                                    width: 100,
                                    height: 20,
                                    child: Row(
                                      children: [
                                        Checkbox(
                                            value:
                                                data?.data?[index].reopen == ""
                                                    ? false
                                                    : true,
                                            onChanged: (df) async {
                                              data?.data?[index].reopen == ""
                                                  ? showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return Remarkspop(
                                                            context,
                                                            data?.data?[index]
                                                                .issue,
                                                            submitRemarks:
                                                                (remarks) async {
                                                          final userRegisterApiService =
                                                              ApiService(ref.read(
                                                                  dioProvider));

                                                          Map<String, dynamic>
                                                              formData = {
                                                            "Issue_ID": data
                                                                ?.data?[index]
                                                                .issueID,
                                                            "Reopen": "Yes",
                                                            "Reopen_Remarks":
                                                                remarks,
                                                            "User_ID":
                                                                SingleTon()
                                                                    .user_id
                                                          };

                                                          final userRegisterResponse =
                                                              await userRegisterApiService
                                                                  .SubmitReopenRemarksApiService(
                                                                      formData:
                                                                          formData);
                                                          if (userRegisterResponse
                                                                  .status ==
                                                              "true") {
                                                            ShowToastMessage(
                                                                userRegisterResponse
                                                                        .message ??
                                                                    "");
                                                            Navigator.pop(
                                                                context, true);
                                                            ref.refresh(
                                                                getHSListProvider);
                                                          } else {
                                                            ShowToastMessage(
                                                                userRegisterResponse
                                                                        .message ??
                                                                    "");
                                                          }
                                                        });
                                                      },
                                                    )
                                                  : "";
                                            }),
                                        const Text("Reopen"),
                                      ],
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
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
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.green[900],
      //   onPressed: () {
      //     Navigator.push(context,
      //             MaterialPageRoute(builder: (context) => Add_Help_Support()))
      //         .then((onValue) {
      //       if (onValue == true) {
      //         ref.refresh(getHSListProvider);
      //       }
      //     });
      //   },
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.white60,
      //   ),
      // ),
    );
  }
}

Widget Details(context, {required String text, required String text2}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: MediaQuery.sizeOf(context).width / 3.5,
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )),
        SizedBox(
            width: MediaQuery.sizeOf(context).width / 2,
            child: Text(
              text2,
            )),
      ],
    ),
  );
}

Widget Details2(context, {required String text, required String text2}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: MediaQuery.sizeOf(context).width / 3.5,
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )),
        Container(
            child: Text(
          text2,
          overflow: TextOverflow.ellipsis,
        )),
      ],
    ),
  );
}
