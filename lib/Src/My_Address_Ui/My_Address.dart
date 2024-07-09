import 'package:flutter/material.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';
class My_Address extends StatefulWidget {
  const My_Address({super.key});

  @override
  State<My_Address> createState() => _My_AddressState();
}

class _My_AddressState extends State<My_Address> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround1,
      appBar: Custom_AppBar(title: 'My Address', actions: null, isNav: true, isGreen: false,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              //ADDRESS LIST
              ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  //physics: const NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: white1
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              //INSIDE LIST
                              Text('Full Name : Dharini',style: CouponT,),
                              const SizedBox(height: 5),
                              Text('Email ID : dharini@gmail.com',style: CouponT,),
                              const SizedBox(height: 5),
                              Text('Residency Type : Independent',style: CouponT,),
                              const SizedBox(height: 5),
                              Text('Address : 3/32 , NN Home , Telegu Street , Nera Ganes Street , Coimbatore - 641087',style: CouponT,),

                              const SizedBox(height: 20),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Buttons(context,text: 'Edit', color: Colors.green),
                                  Buttons(context,text: 'Delete', color: Colors.red),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget Buttons (context,{required String text,required Color? color}){
  return Container(
    width: MediaQuery.sizeOf(context).width/2.8,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: color
    ),
    child: Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 10),
      child: Center(child: Text(text,style: ButtonT1,)),
    ),
  );
}
