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
        body: ListView.builder(
            itemCount:  4,
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
                      color: white2,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("lib/assets/onion1.png"))
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10, top: 5),
                                child: Text(
                                  "Cow Milk",
                                  style: SubT,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left: 10,),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('1 Ltr' + ' - ' + '₹ 33', style:SubT2 ,),


                                    InkWell(
                                      onTap: (){
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Subscription_Detail_Screen(productname: '', image: '', actualprice: '', catogoryname: '', deliverydate: '', varient: '',)));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(left: 100),
                                        color: green5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Center(child: Text("Subscribe",style: SubT4,)),
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
                  ],
                ),
              );
            }
        )
    );
  }
}

