import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Model/CategoriesModel.dart';
import 'package:vilfresh/Src/Subscription_Detail_Ui/Subscription_Detail_Screen.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class Daily_Subscription_Screen extends ConsumerStatefulWidget {
  const Daily_Subscription_Screen({super.key});

  @override
  ConsumerState<Daily_Subscription_Screen> createState() =>
      _Daily_Subscription_ScreenState();
}

class _Daily_Subscription_ScreenState
    extends ConsumerState<Daily_Subscription_Screen> {
  List<int> _morningWeights = [1, 1, 1, 1, 1]; // Initial weights for each item
  List<int> _eveningWeights = [1, 1, 1, 1, 1]; // Initial weights for each item

  void _incrementMorningWeight(int index) {
    setState(() {
      _morningWeights[index]++;
    });
  }

  void _decrementMorningWeight(int index) {
    setState(() {
      if (_morningWeights[index] > 1) {
        _morningWeights[index]--;
      }
    });
  }

  void _incrementEveningWeight(int index) {
    setState(() {
      _eveningWeights[index]++;
    });
  }

  void _decrementEveningWeight(int index) {
    setState(() {
      if (_eveningWeights[index] > 1) {
        _eveningWeights[index]--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final _categoriesData = ref.watch(CategoriesProvider("1"));

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // leading: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.green.shade900,),
        title: Text(
          "Daily Subscription",
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 22, color: green2),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: _categoriesData.when(
              data: (data) {
                if (data != null) {
                  return _dailySubscriptionList(data.data);
                } else {
                  return Text("No Data Found");
                }
              },
              error: (Object error, StackTrace stackTrace) {
                return Text(error.toString());
              },
              loading: () => Center(child: CircularProgressIndicator()),
            )),
      ),
    );
  }

  Widget _dailySubscriptionList(List<CategoryData>? data) {
    return ListView.builder(
      itemCount: data?.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Row(
              children: [
                Image.asset(
                  "lib/assets/glassmilk.png",
                  height: 150,
                  width: 150,
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      "Onion",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: green2),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.green.shade100),
                      child: Text(
                        "      Buy Once     ",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: green2),
                      ),
                    )
                  ],
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.green.shade100),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Daily Subscription",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: green2),
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.green.shade400,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              "Morning",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: green2),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade400),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () => _decrementMorningWeight(index),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 10,
                                          bottom: 10),
                                      child: Text(
                                        '-',
                                        style: kgT,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${_morningWeights[index]} Kg",
                                    style: kgT,
                                  ),
                                  InkWell(
                                    onTap: () => _incrementMorningWeight(index),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 10,
                                          bottom: 10),
                                      child: Text(
                                        '+',
                                        style: kgT,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text(
                              "Evening",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: green2),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade400),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () => _decrementEveningWeight(index),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 10,
                                          bottom: 10),
                                      child: Text(
                                        '-',
                                        style: kgT,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${_eveningWeights[index]} Kg",
                                    style: kgT,
                                  ),
                                  InkWell(
                                    onTap: () => _incrementEveningWeight(index),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 10,
                                          bottom: 10),
                                      child: Text(
                                        '+',
                                        style: kgT,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Subscription_Detail_Screen()));
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green.shade100),
                child: Center(
                    child: Text(
                  "Custom Subscription",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400, color: green2),
                )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.green.shade100),
              child: Center(
                  child: Text(
                "Save",
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.w700, color: green2),
              )),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }
}
