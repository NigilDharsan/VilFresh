import 'package:flutter/material.dart';
import 'package:vilfresh/Src/Farmer_Detail_Ui/Farmer_Detail_Screen.dart';
class Cart_Screeen extends StatefulWidget {
  const Cart_Screeen({super.key});

  @override
  State<Cart_Screeen> createState() => _Cart_ScreeenState();
}

class _Cart_ScreeenState extends State<Cart_Screeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.green.shade900,),
        title: Text("Organic Pomogranate",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 22,color: Colors.green.shade900),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.account_balance_wallet,color: Colors.green.shade900,),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.green.shade200
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Image.asset("lib/assets/onion1.png",height: 150,width: 130,)
                      ],
                    ),
                    SizedBox(width: 5,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Organic pomogranate",style:TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.green.shade900),),
                        Text("1 Kg",style:TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.green.shade700),),
                        Text("₹ 25 - ₹ 35",style:TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.green.shade900),),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10),
                child: Text("Select Variant",style:TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.green.shade800),),
              ),
              VariantSection(),
              VariantSection(),
              VariantSection(),
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 15),
                child:CommonButton(txt: "Add")
              ),
              Text("Know your Product",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.green.shade900),),
              TextWithHeader(
                  htxt: 'Also known as : ',
                  stxt: 'grainy apple'
              ),
              TextWithHeader(
                  htxt: 'Seasonality : ',
                  stxt: 'Round the year'
              ),
              TextWithHeader(
                  htxt: 'Basic Information : ',
                  stxt: 'Certainly! Pomegranate, scientifically known as Punica granatum, is a fruit-bearing deciduous shrub or small tree that is native to the region between Iran and Northern India. It belongs to the family Lythraceae. Pomegranates are widely cultivated throughout the Middle East, Mediterranean region, and other parts of the world with suitable climates.'
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 5),
                  child:CommonButton(txt: "Recipes")
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 5),
                  child:InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder:(context) => const Farmer_Detail_Screen())
                        );
                      },
                      child: CommonButton(txt: "Know your farmer"))
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10),
                child: Text("Similar Products",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.green.shade900),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductContainer(),
                  ProductContainer(),
                  ProductContainer(),

                ],
              ),
              SizedBox(height: 15,),
            ],
          ),
        ),
      ),
    );
  }
  Widget VariantSection(){
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.green.shade200
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 5,right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Radio(
                activeColor: Colors.green.shade900,
                  value: "radio value",
                  groupValue: "group value",
                  onChanged: (value){
                    print(value); //selected value
                  }
              ),
          RichText(
            text: TextSpan(
              // text: 'Original Price: \$20.00\n',
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(
                  text: '75',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.black, // You can set the color of the strikethrough line
                    decorationThickness: 2.0, // You can set the thickness of the strikethrough line
                  ),
                ),
              ],
            ),),
              Divider(color: Colors.green.shade900,),
              Text("₹ 25 - ₹ 35",style:TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.green.shade900),),
              Container(
                height: 20,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.green.shade900
                ),
                child: Center(child: Text("75% - 80% off",style:TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.green.shade400))),
              ),
              Text("1 Kg",style:TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.green.shade900),),

            ],
          ),
        ),
      ),
    );
  }
  Widget TextWithHeader({required String htxt,required String stxt}){
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(htxt,style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 18,)),
          ),
          Text(stxt,style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 16,)),
        ],
      ),
    );
  }
  Widget CommonButton({required String txt}){
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green.shade900,
      ),
      child: Center(child: Text(txt,style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 23),)),
    );
  }

  Widget ProductContainer(){
    return Container(
      height: 157,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Colors.green.shade900),
        color: Colors.green.shade200
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 5,left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset("lib/assets/onion1.png",height: 70,width: 80,)),
            Text("Apple",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.green.shade500,fontSize: 15),),
            Row(
              children: [
                Text("2 Kg"),
                Spacer(),
                Text("₹ 65",style: TextStyle(fontSize: 15,color: Colors.green.shade900,fontWeight: FontWeight.w500),)
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 5),
              child: Center(
                child: Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green.shade900,
                  ),
                  child: Center(child: Text("Add",style: TextStyle(color: Colors.white),)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
