import 'package:flutter/material.dart';
import 'package:vilfresh/Common_Widgets/Common_Button.dart';
import 'package:vilfresh/Common_Widgets/Common_List.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/Common_Widgets/Text_Form_Field.dart';
import 'package:vilfresh/Src/Sign_Up_Ui/Sign_Up_Screen1.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class CheckOut_Screen extends StatefulWidget {
  const CheckOut_Screen({super.key});

  @override
  State<CheckOut_Screen> createState() => _CheckOut_ScreenState();
}

class _CheckOut_ScreenState extends State<CheckOut_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white1,
      appBar: Custom_AppBar(title: "Checkout", actions: null, isNav: true, isGreen: false),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 15,),
                //PRODUCT DETAIL
                CheckOut_List(context),
                const SizedBox(height: 20,),
                //SUBTOTAL
                Row(
                  children: [
                    Text("Subtotal",style: walletBalanceT1,),
                    const Spacer(),
                    Text("RS.",style: walletBalanceT1,),
                    Text("114.00",style: enterAmountT,),
                  ],
                ),
                //SHIPPING CHARGES
                Row(
                  children: [
                    Text("SHIPPING CHARGES",style: walletBalanceT1,),
                    const Spacer(),
                    Text("FREE",style: enterAmountT,),
                  ],
                ),
                const SizedBox(height: 15,),
                //TOTAL
                Row(
                  children: [
                    Text("SHIPPING CHARGES",style: enterAmountT,),
                    const Spacer(),
                    Text("RS.",style: walletBalanceT1,),
                    Text("114.00",style: enterAmountT,),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10,bottom: 20),
                  width: MediaQuery.sizeOf(context).width/1.2,
                  child: Text('The maximum amount will be on hold from your wallet. The amount will be detected once the product cut off time is over.'
                  ,style: Textfield_Style,maxLines: 3,),
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
                  child: CommonElevatedButtonGreen(context, "Place Order", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Sign_Up_Screen1()));
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
