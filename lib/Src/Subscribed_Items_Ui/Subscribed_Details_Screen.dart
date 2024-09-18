import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Generic.dart';
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
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Text("A1 Milk - 500 ML", style: subscribedHT2),
                  ),
                  Container(
                    color: green3,
                    height: 30,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Day', style: appTitle2),
                        Text('Morning', style: appTitle2),
                        Text('Evening', style: appTitle2),
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(dateConvert(data?.data?[index].date ?? ""),
                                style: subscribedHT3),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.horizontal_rule),
                                  onPressed: () =>
                                      _increment(index, 0), // 0 for morning
                                ),
                                Text("${data?.data?[index].morningQty}",
                                    style: subscribedHT3),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () =>
                                      _decrement(index, 0), // 0 for morning
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.horizontal_rule),
                                  onPressed: () =>
                                      _increment(index, 1), // 1 for evening
                                ),
                                Text("${data?.data?[index].eveningQty}",
                                    style: subscribedHT3),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () =>
                                      _decrement(index, 1), // 1 for evening
                                ),
                              ],
                            ),
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
                        final userRegisterApiService =
                            ApiService(ref.read(dioProvider));
                        Map<String, dynamic> formData = {
                          "User_ID": SingleTon().user_id,
                          "Item_ID": data?.data?[0].itemID ?? "",
                          "Item_Variant_ID": data?.data?[0].variantID ?? "",
                          "subscribe": []
                        };
                        final userRegisterResponse =
                            await userRegisterApiService
                                .SubscribeUpdateApiService(formData: formData);
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
