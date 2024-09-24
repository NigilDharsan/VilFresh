import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Src/Subscribed_Items_Ui/Subscribed_Details_Screen.dart';
import 'package:vilfresh/Src/Subscription_Detail_Ui/Subscription_Detail_Screen.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Generic.dart';
import 'package:vilfresh/utilits/Loading_Overlay.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class Subscription_Details extends ConsumerStatefulWidget {
  final String? ltrValue;
  final List<String> ltrOptions;
  final bool isMore;

  const Subscription_Details(
      {Key? key,
      required this.ltrValue,
      required this.ltrOptions,
      required this.isMore})
      : super(key: key);

  @override
  ConsumerState<Subscription_Details> createState() =>
      _Subscription_DetailsState();
}

class _Subscription_DetailsState extends ConsumerState<Subscription_Details> {
  String? ltrValue = " ";
  List<dynamic> ltrOptions = [];

  @override
  Widget build(BuildContext context) {
    final _categoriesData = ref.watch(CategoriesProvider("1"));
    // final _SubscriptionQntydata = ref.watch(SubscriptionQntyProvider("1"));

    return Scaffold(
      backgroundColor: backGround1,
      appBar: Custom_AppBar(
        title: "Daily Subscription",
        actions: [
          Container(
              margin: EdgeInsets.only(right: 10),
              height: 35,
              child: Center(
                child: InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => Wallet_Screen()));
                    },
                    child: Text("Set Holiday")),
              )),
        ],
        isNav: widget.isMore == true ? true : false,
        isGreen: false,
      ),

      // floatingActionButtonLocation: FloatingActionButtonLocation
      //     .centerFloat, // Optional: position at the bottom center
      body: _categoriesData.when(data: (data) {
        return ListView.builder(
            itemCount: data?.data?[0].itemDetail?.length ?? 0,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            // physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(top: 10),
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            height: 80,
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(data?.data?[0]
                                          .itemDetail?[index].itemImage ??
                                      ""),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 10, bottom: 5, right: 5),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width / 1.7,
                                  child: Text(
                                    data?.data?[0].itemDetail?[index].item ??
                                        "",
                                    style: SubT,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '1 Ltr' + ' - ',
                                      // '₹ ${data?.data?[index]. ?? ""}',
                                      style: SubT2,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    data?.data?[0].itemDetail?[index]
                                                .Subscription_Status ==
                                            "No"
                                        ? InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Subscription_Detail_Screen(
                                                            varient_ID: data
                                                                ?.data?[0]
                                                                .itemDetail?[
                                                                    index]
                                                                .allVariant?[0]
                                                                .variantID,
                                                            Item_Id: data
                                                                ?.data?[0]
                                                                .itemDetail?[
                                                                    index]
                                                                .itemID,
                                                            pageRefresh:
                                                                (bool) {
                                                              ref.refresh(
                                                                  CategoriesProvider(
                                                                      "1"));
                                                            },
                                                          ))).then((onValue) {
                                                if (onValue == true) {}
                                              });
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(left: 20),
                                              color: green3,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                child: Center(
                                                    child: Text(
                                                  "Subscribe",
                                                  style: SubT4,
                                                )),
                                              ),
                                            ),
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Subscribed_Details_Screen(
                                                                ItemId: data
                                                                    ?.data?[0]
                                                                    .itemDetail?[
                                                                        index]
                                                                    .itemID,
                                                                varientId: data
                                                                    ?.data?[0]
                                                                    .itemDetail?[
                                                                        index]
                                                                    .allVariant?[
                                                                        0]
                                                                    .variantID,
                                                              )));
                                                },
                                                child: Container(
                                                  color: green3,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 25,
                                                            right: 25,
                                                            top: 4,
                                                            bottom: 4),
                                                    child: Text(
                                                      "Edit",
                                                      style: subscribedHT,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  showDialog<void>(
                                                    context: context,
                                                    barrierDismissible:
                                                        false, // Prevents closing the dialog by tapping outside of it
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            "${data?.data?[0].itemDetail?[index].item}"),
                                                        content: const Text(
                                                            'Are you sure to cancel the Subscribed'),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            child: const Text(
                                                                'Cancel'),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(); // Closes the dialog
                                                            },
                                                          ),
                                                          TextButton(
                                                            child: const Text(
                                                                'Yes'),
                                                            onPressed:
                                                                () async {
                                                              LoadingOverlay
                                                                  .show(
                                                                      context);
                                                              Map<String,
                                                                      dynamic>
                                                                  formData = {
                                                                "User_ID":
                                                                    SingleTon()
                                                                        .user_id,
                                                                "Item_ID": data
                                                                    ?.data?[0]
                                                                    .itemDetail?[
                                                                        index]
                                                                    .itemID,
                                                                "Item_Variant_ID": data
                                                                    ?.data?[0]
                                                                    .itemDetail?[
                                                                        index]
                                                                    .allVariant?[
                                                                        0]
                                                                    .variantID,
                                                              };

                                                              final result =
                                                                  await ref
                                                                      .read(
                                                                RemovesubscribeditemProvider(
                                                                        formData)
                                                                    .future,
                                                              );
                                                              LoadingOverlay
                                                                  .forcedStop();
                                                              if (result
                                                                      ?.status ==
                                                                  "true") {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                ShowToastMessage(
                                                                    result?.message ??
                                                                        "");
                                                                ref.refresh(
                                                                    CategoriesProvider(
                                                                        "1"));
                                                              } else {
                                                                ShowToastMessage(
                                                                    result?.message ??
                                                                        "Error");
                                                              }
                                                            },
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  color: Colors.orangeAccent,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            right: 10,
                                                            top: 4,
                                                            bottom: 4),
                                                    child: Text(
                                                      "Cancel",
                                                      style: subscribedHT,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider()
                  ],
                ),
              );
            });
      }, error: (Object error, StackTrace stackTrace) {
        return Text("ERROR");
      }, loading: () {
        return Center(child: CircularProgressIndicator());
      }),
      floatingActionButton: Padding(
        padding:
            const EdgeInsets.only(bottom: 20.0), // Set padding from the bottom
        child: Container(
          width: double.infinity, // Full width
          height: 56, // Height for FAB-like size
          margin: EdgeInsets.symmetric(
              horizontal: 16), // Margin from left and right edges
          decoration: BoxDecoration(
            color: Colors.transparent, // Hidden background color
            borderRadius:
                BorderRadius.circular(28), // Circular corners to mimic FAB
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black26, // Shadow for visibility
            //     blurRadius: 10, // Shadow blur
            //     offset: Offset(0, 4), // Shadow position
            //   ),
            // ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Action for FAB button
                  print('Floating Action Button Clicked');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // FAB button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28), // Circular shape
                  ),
                ),
                child: Text(
                  'Holiday',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Action for FAB button
                  print('Floating Action Button Clicked');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // FAB button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28), // Circular shape
                  ),
                ),
                child: Text(
                  'Pause',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ), // Optional: position at the bottom center
    );
  }
}
