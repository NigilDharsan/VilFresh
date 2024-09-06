import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Src/Subscription_Detail_Ui/Subscription_Detail_Screen.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
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
          actions: [],
          isNav: widget.isMore == true ? true : false,
          isGreen: false,
        ),
        body: _categoriesData.when(data: (data) {
          return ListView.builder(
              itemCount: data?.data?.length ?? 0,
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
                              height: 80,
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(""), fit: BoxFit.cover),
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
                                    width:
                                        MediaQuery.sizeOf(context).width / 1.7,
                                    child: Text(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '1 Ltr' + ' - ',
                                        // '₹ ${data?.data?[index]. ?? ""}',
                                        style: SubT2,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Subscription_Detail_Screen(
                                                        subscriptionDetail:
                                                            data?.data?[index],
                                                      )));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(left: 20),
                                          color: green3,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Center(
                                                child: Text(
                                              "Subscribe",
                                              style: SubT4,
                                            )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
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
        }));
  }
}
