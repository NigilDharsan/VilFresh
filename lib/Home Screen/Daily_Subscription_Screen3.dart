import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    // "2 Ltr",
    // "3 Ltr",
    // "4 Ltr",
    // "5 Ltr",
  ];
  Map<String, int> selectedQuantities = {};
  String? CategoriesId;
  @override
  Widget build(BuildContext context) {
    //final subscriptiondetails = ref.watch(CategoriesProvider('1'));
    //final subscriptionQntyData = ref.watch(SubscriptionQntyProvider(CategoriesId ?? "1"));
    return Scaffold(
        backgroundColor: Colors.white,
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
        body: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            //itemCount: data?.data?.length ?? 0,
            itemBuilder: (context, index) {
             // final isLastItem = index == ((data?.data?.length ?? 0) - 1);
              return Column(
                children: [
                  Container(
                    // height: 140,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                        color: green3,
                        border: Border.all(width: 0.5, color: Colors.grey)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: backGround1,
                          width: MediaQuery.sizeOf(context).width / 3.5,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 45,
                              bottom: 51,
                            ),
                            child: Center(child: Text('Picture')),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 10, top: 5),
                                child: Text( "Buffolo Milk",
                                  //data?.data?[index].item ?? "",
                                  style: SubT,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, bottom: 8),
                                child: Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 42,
                                        width:
                                        MediaQuery.sizeOf(context).width /
                                            6,
                                        child:
                                        DropdownButtonFormField<String>(
                                          value: LtrValue,
                                          onTap: () {
                                            //CategoriesId = data?.data?[index].itemID ??
                                                    "";
                                            print("CLICKED");
                                          },
                                          isExpanded: true,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "1 Ltr",
                                            helperStyle: SubT2,
                                          ),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_sharp,
                                          ),
                                          items:
                                          LtrOption?.map((String option) {
                                            return DropdownMenuItem<String>(
                                              value: option,
                                              child: Center(
                                                  child: Text(
                                                    option,
                                                    style: SubT2,
                                                  )),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              LtrValue = newValue;
                                            });
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(top: 10),
                                        child: Text( "₹ 33",
                                          //"₹ ${data?.data?[index].actualPrice ?? ""}",
                                          style: SubT2,
                                        ),
                                      )
                                    ],
                                  ),
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
                                        top: 3.5, bottom: 3.5),
                                    child: Center(
                                        child: Text(
                                          'Subscribe',
                                          style: SubT3,
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  //isLastItem ? Container() :
                  Container(
                    height: 30,
                    color: Colors.white,
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 3.5,
                        ),
                        Container(
                          height: 50,
                          width: 2,
                          color: Color.fromARGB(255, 245, 245, 245),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }));
  }
}
