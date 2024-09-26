import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Generic.dart';
import 'package:vilfresh/utilits/Loading_Overlay.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class Subscribed_Details_Screen extends ConsumerStatefulWidget {
  final String? ItemId;
  final String? varientId;

  const Subscribed_Details_Screen(
      {super.key, required this.ItemId, required this.varientId});

  @override
  ConsumerState<Subscribed_Details_Screen> createState() =>
      _Subscribed_Details_ScreenState();
}

class _Subscribed_Details_ScreenState
    extends ConsumerState<Subscribed_Details_Screen> {
  String itemId = '';
  List<String> itemData = [];
  var formData1 = <String, dynamic>{};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    itemData = [widget.ItemId ?? "", widget.varientId ?? ""];

    formData1 = <String, dynamic>{
      "Category_ID": "3",
      "Item_ID": "113",
      "User_ID": "101",
    };
  }

  void _increment(int index, int period) {
    // setState(() {
    //   _data[index][period] = (_data[index][period] ?? 0) + 1;
    // });
  }

  void _decrement(int index, int period) {
    setState(() {
      // if ((_data[index][period] ?? 0) > 0) {
      //   _data[index][period] = (_data[index][period] ?? 0) - 1;
      // }
    });
  }

  String dateConvert(String date) {
    DateFormat inputFormat = DateFormat("M/dd/yyyy");
    DateTime dateTime = inputFormat.parse(date);

    DateFormat outputFormat = DateFormat("MMM dd EEE");
    String formattedDate = outputFormat.format(dateTime);

    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    final productDescriptionData =
        ref.watch(SubscribeditemdetailsProvider(itemData));

    return Scaffold(
        backgroundColor: backGround1,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios),
          ),
          toolbarHeight: 40,
          backgroundColor: Colors.green.shade100,
          centerTitle: true,
          title: Text("Subscription Details", style: subscribedapp),
        ),
        body: productDescriptionData.when(data: (data) {
          final sectionWidth = ((data?.data?[0].eveningYesNo ?? "") == "Yes")
              ? (MediaQuery.of(context).size.width - 40) / 3
              : (MediaQuery.of(context).size.width - 40) / 2;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                        "${data?.data?[0].itemName ?? ""} - ${data?.data?[0].variantName ?? ""}",
                        style: subscribedHT2),
                  ),
                  Container(
                    color: green3,
                    height: 30,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Container(
                            width: sectionWidth,
                            child:
                                Center(child: Text('Day', style: appTitle2))),

                        Container(
                            width: sectionWidth,
                            child: Center(
                                child: Text('Morning', style: appTitle2))),

                        ((data?.data?[0].eveningYesNo ?? "") == "Yes")
                            ? Container(
                                width: sectionWidth,
                                child: Center(
                                    child: Text('Evening', style: appTitle2)))
                            : Container(),
                        // (data?.data?[0].eveningYesNo ?? "") == "Yes"
                        //     ? Text('Evening', style: appTitle2)
                        //     : Container(),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: data?.data?.length,
                    physics:
                        NeverScrollableScrollPhysics(), // Disable scrolling

                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black, width: 1),
                          ),
                        ),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: sectionWidth,
                              child: Center(
                                child: Text(
                                  dateConvert(data?.data?[index].date ?? ""),
                                  style: subscribedHT3,
                                  maxLines: 3,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Container(
                              width: sectionWidth,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 30,
                                    child: IconButton(
                                        icon: Icon(Icons.horizontal_rule),
                                        onPressed: () {
                                          _decrement(index, 0); // 0 for morning
                                          if (int.parse(data?.data?[index]
                                                      .morningQty ??
                                                  "0") >
                                              0) {
                                            setState(() {
                                              data?.data?[index].morningQty =
                                                  "${int.parse(data.data?[index].morningQty ?? "0") - 1}";
                                              data?.data?[index].isEdit = true;
                                            });
                                          }

                                          // 0 for morning
                                        }),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${data?.data?[index].morningQty}",
                                    style: subscribedHT3,
                                  ),
                                  Container(
                                    width: 30,
                                    child: IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: () {
                                          _increment(index, 0);
                                          setState(() {
                                            data?.data?[index].morningQty =
                                                "${int.parse(data.data?[index].morningQty ?? "0") + 1}";
                                            data?.data?[index].isEdit = true;
                                          });
                                        }),
                                  ),
                                ],
                              ),
                            ),
                            (data?.data?[0].eveningYesNo ?? "") == "Yes"
                                ? Container(
                                    width: sectionWidth,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 30,
                                          child: IconButton(
                                            icon: Icon(Icons.horizontal_rule),
                                            onPressed: () => _increment(
                                                index, 1), // 1 for evening
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("${data?.data?[index].eveningQty}",
                                            style: subscribedHT3),
                                        IconButton(
                                          icon: Icon(Icons.add),
                                          onPressed: () => _decrement(
                                              index, 1), // 1 for evening
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  // SUBMIT BUTTON
                  Center(
                    child: InkWell(
                      onTap: () async {
                        LoadingOverlay.show(context);

                        var subscribeArr = [];

                        for (int i = 0; i < (data?.data?.length ?? 0); i++) {
                          if (data?.data?[i].isEdit == true) {
                            final subscribe = {
                              "ID": data?.data?[i].iD,
                              "Day": data?.data?[i].day,
                              "Date": data?.data?[i].date,
                              "Morning_Qty": data?.data?[i].morningQty,
                              "Evening_Qty": data?.data?[i].eveningQty
                            };
                            subscribeArr.add(subscribe);
                          }
                        }

                        final userRegisterApiService =
                            ApiService(ref.read(dioProvider));
                        Map<String, dynamic> formData = {
                          "User_ID": SingleTon().user_id,
                          "Item_ID": data?.data?[0].itemID ?? "",
                          "Item_Variant_ID": data?.data?[0].variantID ?? "",
                          "subscribe": subscribeArr
                        };
                        final userRegisterResponse =
                            await userRegisterApiService
                                .SubscribeUpdateApiService(formData: formData);
                        LoadingOverlay.forcedStop();

                        if (userRegisterResponse.status == "true") {
                          ShowToastMessage(userRegisterResponse.message ?? "");
                          Navigator.of(context).pop(true);
                        } else {
                          ShowToastMessage(userRegisterResponse.message ?? "");
                        }
                      },
                      child: Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width / 3,
                        color: green3,
                        child:
                            Center(child: Text("Submit", style: subscribedHT)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          );
        }, error: (Object error, StackTrace stackTrace) {
          return Text("ERROR$error");
        }, loading: () {
          return Center(child: CircularProgressIndicator());
        }));
  }
}
