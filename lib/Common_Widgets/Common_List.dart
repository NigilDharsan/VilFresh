import 'package:flutter/material.dart';
import 'package:vilfresh/Common_Widgets/Common_Button.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

//MY ORDER LIST
Widget MyorderList(context) {
  return
    Container(
    width: MediaQuery.sizeOf(context).width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: white1,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("lib/assets/glassmilk.png"),
                fit: BoxFit.fitHeight)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("A1 Milk",style: orderNameT,maxLines: 2,),
                  Row(
                    children: [
                    Text('Qty: 1 L',style: qntT,),
                    const SizedBox(width: 100,),
                    Text('₹ 22',style: orderPriceT,),
                    ],
                  ),
                  Text('Delivered on 21/08/2023',style: phoneHT,)
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 35,bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width/3,
                  child: CommonElevatedButtonGreen(context, "Rate", () { })),
              const SizedBox(width: 20,),
              Container(
                  width: MediaQuery.of(context).size.width/3,
                  child: CommonElevatedButtonGreen(context, "Return", () { })),
            ],
          ),
        ),
      ],
    ),
  );
}

//PRODUCT CARD
Widget Product_Card(context){
  return Container(
    width: MediaQuery.sizeOf(context).width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: backGround1,
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("lib/assets/glassmilk.png"),
                        fit: BoxFit.fitHeight)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width/2,
                        child: Text("Organic Pineapple xfdfdf",style: productNameT,maxLines: 2,)),
                    Padding(
                      padding: const EdgeInsets.only(top: 5,bottom:5),
                      child: Text('1 Kg',style: kgT,),
                    ),
                    Text('₹ 25 - ₹ 35',style: productPrice,),
                  ],
                ),
              ),
            ],
          ),
          Container(

            alignment: Alignment.topRight,
              child: Icon(Icons.share,color: green2,)),
          const SizedBox(height: 20,),

        ],
      ),
    ),
  );
}

//CATEGORIES LIST
Widget Categories_List(context){
  return  Container(
    width: MediaQuery.sizeOf(context).width,
    decoration: BoxDecoration(
        color: white1,
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(15),
            bottom: Radius.circular(15))),
    child: Padding(
      padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Organic Pineapple",
            style: TextStyle(
                color: green2,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  height: 100,
                  width: 150,
                  child: Image.asset(
                      "lib/assets/Sunset.jpeg")),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1 Kg ",
                    style: kgT,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 5),
                    child: Text(
                      "Approx Price ",
                      style: cardT,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    "₹28 - ₹38",
                    style: productPrice,
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                      color: Colors.grey.shade100,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 5,left: 20,right: 30),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.add_shopping_cart_sharp,size: 25,color: green2,),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Add",
                              style: productPrice,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ))
                ],
              )
            ],
          )
        ],
      ),
    ),
  );

}