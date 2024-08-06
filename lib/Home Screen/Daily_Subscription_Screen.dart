import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  const Subscription_Details({Key? key, required this.ltrValue, required this.ltrOptions,required this.isMore}) : super(key: key);

  @override
  ConsumerState<Subscription_Details> createState() => _Subscription_DetailsState();
}

class _Subscription_DetailsState extends ConsumerState<Subscription_Details> {
  String? ltrValue = " ";
  List<dynamic> ltrOptions = [];


  @override
  Widget build(BuildContext context){
    final _categoriesData = ref.watch(CategoriesProvider("1"));
    final _SubscriptionQntydata = ref.watch(SubscriptionQntyProvider("1"));

    return Scaffold(
        backgroundColor: backGround1,
        appBar: Custom_AppBar(title: "Daily Subscription", actions: [], isNav: widget.isMore == true?true:false, isGreen: false,),
        body: _categoriesData.when(data: (data){
          return ListView.builder(
              itemCount:  data?.data?.length ?? 0,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              // physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index){
                return Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        color: green3,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                    image:NetworkImage(data?.data?[index].itemImage ?? "")
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10, top: 5),
                                    child: Text(
                                      data?.data?[index].item  ?? "",
                                      style: SubT,
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,),
                                    child: Row(
                                      children: [
                                        _SubscriptionQntydata.when(data: (data){
                                         var LiterOptionVaL = data?.variants ?? [];
                                          return Container(
                                            height: 42,
                                            width: MediaQuery.of(context).size.width / 4,
                                            child: DropdownButtonFormField<String>(
                                              value: ltrValue,
                                              onTap: () {
                                                // Handle onTap event
                                                print("CLICKED");
                                              },
                                              isExpanded: false,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "1 Ltr",
                                                helperStyle: SubT2,
                                              ),
                                              icon: Icon(Icons.keyboard_arrow_down_sharp),
                                              items: LiterOptionVaL.map((option) {
                                                return DropdownMenuItem<String>(
                                                  value:ltrValue ,
                                                  child: Center(
                                                    child: Text(
                                                      option?.itemVariantName ?? "",
                                                      style: SubT2,
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {
                                                // Handle onChanged event
                                                // setState(() {
                                                //   ltrValue = newValue;
                                                // });
                                              },
                                            ),
                                          );
                                        },  error: (Object error, StackTrace stackTrace){
                                          return Text("ERROR");
                                        }, loading: (){
                                          return Center(child: CircularProgressIndicator());
                                        }),

                                        Padding(
                                          padding: const EdgeInsets.only(left: 10,bottom: 5),
                                          child: Text(
                                            "₹ ${data?.data?[index].actualPrice}",
                                            style: SubT2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  InkWell(
                                    onTap: (){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Subscription_Detail_Screen(
                                                    productname: data?.data?[index].item ?? "",
                                                    image: data?.data?[index].itemImage ?? "",
                                                    actualprice: data?.data?[index].actualPrice ?? "",
                                                    catogoryname: data?.data?[index].CategoryName ?? "",
                                                    deliverydate: data?.data?[index].itemID ?? "",
                                                    varient: data?.data?[index].variant ?? "",
                                                  )));
                                    },
                                    child: Container(
                                      height: 24,
                                      color: green2,
                                      child: Center(child: Text("Subscribe",style: SubT3,)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
          );
        }, error: (Object error, StackTrace stackTrace){
          return Text("ERROR");
        }, loading: (){
          return Center(child: CircularProgressIndicator());
        })
    );
  }
}

