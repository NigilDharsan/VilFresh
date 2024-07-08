import 'package:flutter/material.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class Coupon_Screen extends StatefulWidget {
  const Coupon_Screen({super.key});

  @override
  State<Coupon_Screen> createState() => _Coupon_ScreenState();
}

class _Coupon_ScreenState extends State<Coupon_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround1,
      appBar: Custom_AppBar(title: 'Coupons', actions: null, isNav: true, isGreen: false,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //COUPON LIST
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          //INSIDE COUPON
                          Text('Coupon Code : CBE10%',style: walletBalanceT,),
                          Text("Rate : 10",style: CouponT,),
                          Text('Celebrate the season with savings! Enjoy 10% off all flavored milk varieties this summer',style: CouponT,)
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
