import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Common_Widgets/Common_Button.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class Subscription_Details_Screen2 extends ConsumerStatefulWidget {
  const Subscription_Details_Screen2({super.key});

  @override
  ConsumerState<Subscription_Details_Screen2> createState() => _Subscription_Details_Screen2State();
}

class _Subscription_Details_Screen2State extends ConsumerState<Subscription_Details_Screen2> {
  String? LtrValue;
  List<String> LtrOption = [];
  @override
  Widget build(BuildContext context) {
    final subscriptiondetails = ref.watch(CategoriesProvider('1'));
    final varientdatails = ref.watch(VarientProvider('1'));
    return Scaffold(
      body: subscriptiondetails.when(data: (data){
        return
          ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              //physics: const NeverScrollableScrollPhysics(),
              itemCount: data?.data?.length ?? 0,
              itemBuilder: (context, index){
                return Container(
                  height: 140,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 0.5,color: Colors.grey)
                  ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: backGround1,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 45,bottom: 45,left: 30,right: 30),
                          child: Text('Picture'),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,top: 5),
                            child: Text(data?.data?[index].item ?? "",style: SubT,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                dropDownFieldprofileedit(
                                  context,
                                  width: MediaQuery.sizeOf(context).width/6,
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
                                  child: Icon(Icons.currency_rupee,size: 20,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(data?.data?[index].actualPrice ?? "",style: SubT2,),
                                )
                              ],
                            ),
                          ),
                          Container(
                            color: green2,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 85,right: 85 ,top: 5,bottom: 5),
                              child: Text('Subscribe',style: SubT3,),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }
          );
      }, error: (error ,_){
        return Text('ERROR');
      },
          loading: (){
        return Center(child: CircularProgressIndicator());
          })
    );
  }
}
