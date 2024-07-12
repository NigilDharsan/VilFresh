import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Common_Widgets/Common_Button.dart';
import 'package:vilfresh/Src/Subscription_Detail_Ui/Subscription_Detail_Screen.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class Subscription_Details_Screen2 extends ConsumerStatefulWidget {
  const Subscription_Details_Screen2({super.key});

  @override
  ConsumerState<Subscription_Details_Screen2> createState() =>
      _Subscription_Details_Screen2State();
}

class _Subscription_Details_Screen2State
    extends ConsumerState<Subscription_Details_Screen2> {
  String? LtrValue = "1 Ltr";
  List<String> LtrOption = [
    "1 Ltr",
  ];
  @override
  Widget build(BuildContext context) {
    final subscriptiondetails = ref.watch(CategoriesProvider('1'));
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // leading: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.green.shade900,),
          title: Center(
            child: Text(
              "Daily Subscription",
              style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 22, color: green2),
            ),
          ),
        ),
        body: subscriptiondetails.when(data: (data) {
          return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              //physics: const NeverScrollableScrollPhysics(),
              itemCount: data?.data?.length ?? 0,
              itemBuilder: (context, index) {
                return Container(
                  height: 140,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 0.5, color: Colors.grey)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: backGround1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 45, bottom: 45, left: 30, right: 30),
                          child: Text('Picture'),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 5),
                            child: Text(
                              data?.data?[index].item ?? "",
                              style: SubT,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                dropDownFieldprofileedit(
                                  context,
                                  width: MediaQuery.sizeOf(context).width / 6,
                                  hintT: '1 Ltr',
                                  value: LtrValue,
                                  listValue: LtrOption,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      LtrValue = newValue;
                                    });
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Icon(
                                    Icons.currency_rupee,
                                    size: 20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    data?.data?[index].actualPrice ?? "",
                                    style: SubT2,
                                  ),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Subscription_Detail_Screen()));
                            },
                            child: Container(
                              color: green2,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 85, right: 85, top: 3.5, bottom: 3.5),
                                child: Text(
                                  'Subscribe',
                                  style: SubT3,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              });
        }, error: (error, _) {
          return Text('ERROR');
        }, loading: () {
          return Center(child: CircularProgressIndicator());
        }));
  }
}
