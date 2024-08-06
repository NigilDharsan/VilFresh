import 'package:flutter/material.dart';
import 'package:vilfresh/Common_Widgets/Common_Button.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/Common_Widgets/Text_Form_Field.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class Subscription_CheckOut_Screen extends StatefulWidget {
  const Subscription_CheckOut_Screen({super.key});

  @override
  State<Subscription_CheckOut_Screen> createState() => _Subscription_CheckOut_ScreenState();
}

class _Subscription_CheckOut_ScreenState extends State<Subscription_CheckOut_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white1,
      appBar: Custom_AppBar(title: "Subscription Checkout", actions: null, isNav: true, isGreen: false),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //PRODUCT DETAIL
                Container(
                  margin: EdgeInsets.only(top: 15,bottom: 20),
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: white2
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //PRODUCT IMAGE AND PRICE
                        Padding(
                          padding: const EdgeInsets.only(top: 15,bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             Container(
                               height: 100,
                               width: 100,
                               child: ImgPathPng("glassmilk.png"),
                             ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.sizeOf(context).width/2,
                                      child: Text("Buffalo Milk",style: shopT,maxLines: 2,)),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10,bottom: 10),
                                    child: Text("1000ml",style: subscribeHT,),
                                  ),
                                  Text("₹ 70.00",style: shopT,),
          
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          color:white1,
                        ),
                        //SCHEDULE
                        Padding(
                          padding: const EdgeInsets.only(top: 10,),
                          child: Text("Schedule Pattern:",style: subscribeHT,),
                        ),
                        Text("DAY 1",style: Textfield_Style,),
                        Container(
                            width: MediaQuery.sizeOf(context).width/1.8,
                            child: Text("Morning: 1    Evening: 1",style: shopT,maxLines: 1,)),
                        Text("DAY 2",style: Textfield_Style,),
                        Container(
                            width: MediaQuery.sizeOf(context).width/1.8,
                            child: Text("Morning: 1    Evening: 1",style: shopT,maxLines: 2,)),
                        //SUBSCRIBE DATE
                        Padding(
                          padding: const EdgeInsets.only(top: 10,),
                          child: Text("Subscription start date:",style: subscribeHT,),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                            width: MediaQuery.sizeOf(context).width/2,
                            child: Text("06 December 2021",style: shopT,maxLines: 2,)),
          
          
                      ],
                    ),
                  ),
                ),
                //COUPONS
                Text("Coupons & Discounts",style: qntT,),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                      color: white2
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15,bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                            ImgPathPng('discount.png'),
                              Text("Select Promo Code",style: shopT,),
                              const Spacer(),
                              Text("View All",style: viewOrg,)
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: white1
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text("You can view all available offer by clicking view all offer or you can enter promo code directly",style: circularT,maxLines: 2,)),
                          ),
          
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10,bottom: 15),
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width/2,
                                child: textFormField_green(
                                  hintText: 'Enter Promo Code',
                                  keyboardtype: TextInputType.text,
                                  inputFormatters: null,
                                  Controller: null,
                                  validating: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter a Block / Tower";
                                    } else if (value == null) {
                                      return "Please enter a Block / Tower";
                                    }
                                    return null;
                                  },
                                  onChanged: null,
                                ),
                              ),
                              const Spacer(),
                              Text('Apply',style: shopT,)
                            ],
                          ),
                        )
          
                      ],
                    ),
                  ),
                ),
               const SizedBox(height: 20,),
               //DELIVERY SLOT
                Text("Delivery Slot",style: qntT,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: white2
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                    child: Row(
                      children: [
                        Text("Delivery time slot",style: kgT,),
                        const Spacer(),
                        Icon(Icons.keyboard_arrow_down,color: green2,)
                      ],
                    ),
                  ),
                ),
               //BUTTON
                Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 50),
                  child: CommonElevatedButtonGreen(context, "Place Order", () { }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
