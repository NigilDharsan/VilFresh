import 'package:flutter/material.dart';
import 'package:vilfresh/Common_Widgets/Common_Button.dart';
import 'package:vilfresh/Common_Widgets/Image_Picker.dart';
import 'package:vilfresh/Model/CategoriesModel.dart';
import 'package:vilfresh/Src/Subscription_Detail_Ui/Subscription_Detail_Screen.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

//MY ORDER LIST
Widget MyorderList(
  context, {
  required String ProductImg,
  required String ProductName,
  required String Qnty,
  required String ProductRate,
  required String DeliveredDate,
}) {
  return Container(
    width: MediaQuery.sizeOf(context).width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: white1,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 10,
            ),
            Container(
              height: MediaQuery.sizeOf(context).height / 10,
              width: MediaQuery.sizeOf(context).width / 4.5,
              child: buildImage(ProductImg,
                  border: Radius.circular(0), fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width / 2,
                    child: Text(
                      ProductName,
                      style: orderNameT,
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width / 3.3,
                          child: Text(
                            'Qty:${Qnty}',
                            style: qntT,
                            maxLines: 4,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '₹ ${ProductRate}',
                          style: orderPriceT,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Delivered on ${DeliveredDate}',
                    style: phoneHT,
                  )
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: CommonElevatedButtonGreen(context, "Rate", () {})),
              const SizedBox(
                width: 20,
              ),
              Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: CommonElevatedButtonGreen(context, "Return", () {})),
            ],
          ),
        ),
      ],
    ),
  );
}

//PRODUCT CARD
Widget Product_Card(context) {
  return Container(
    width: MediaQuery.sizeOf(context).width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: backGround1,
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("lib/assets/glassmilk.png"),
                        fit: BoxFit.fitHeight)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.sizeOf(context).width / 2,
                        child: Text(
                          "Organic Pineapple xfdfdf",
                          style: productNameT,
                          maxLines: 2,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        '1 Kg',
                        style: kgT,
                      ),
                    ),
                    Text(
                      '₹ 25 - ₹ 35',
                      style: productPrice,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.share,
                color: green2,
              )),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    ),
  );
}

//CATEGORIES LIST
Widget Categories_List(context, CategoryData categoryData) {
  return Container(
    width: MediaQuery.sizeOf(context).width / 2.5,
    decoration: BoxDecoration(
        color: white1,
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(15), bottom: Radius.circular(15))),
    child: Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            categoryData.item ?? "",
            style: TextStyle(
                color: green2, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  height: MediaQuery.sizeOf(context).height / 8,
                  width: MediaQuery.sizeOf(context).width / 3.8,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(categoryData.itemImage ?? ""),
                    fit: BoxFit
                        .cover, // Adjust the BoxFit as per your requirement
                  ))),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categoryData.variant ?? "",
                    style: kgT,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                    child: Text(
                      "Approx Price ",
                      style: cardT,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    "₹${categoryData.sellingPrice} - ₹${categoryData.actualPrice}",
                    style: productPrice,
                    textAlign: TextAlign.center,
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 15),
                      color: Colors.grey.shade100,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 20, right: 30),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.add_shopping_cart_sharp,
                              size: 25,
                              color: green2,
                            ),
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

//AMOUNT
Widget AmountContain({required String amount}) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 2, color: Colors.black)),
    child: Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
      child: Text(
        "₹ ${amount}",
        style: amountT,
      ),
    ),
  );
}

//VF BASKET CARD
Widget VF_Basket_Card(
  context, {
  required String TaskImg,
  required String productName,
  required String weight,
  required String price,
  required String offerPrice,
  required void Function()? onTap
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: MediaQuery.sizeOf(context).width / 2.5,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: green2),
        borderRadius: BorderRadius.circular(15),
        color: white7,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 90,
            width: MediaQuery.sizeOf(context).width / 2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15), topLeft: Radius.circular(15)),
                image: DecorationImage(
                    image: NetworkImage(TaskImg), fit: BoxFit.cover)),
          ),
          Container(
              margin: EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Text(
                productName,
                style: cardT,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )),
          Container(
              margin: EdgeInsets.only(bottom: 0, left: 15, right: 15),
              child: Text(
                weight,
                style: rechargeHintT,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      "₹ ${price}",
                      style: cardT,
                    ),
                    Text(
                      "₹ ${offerPrice}",
                      style: offerStrikeT,
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: green2),
                  child: Center(
                      child: Text(
                    "Add",
                    style: ButtonT1,
                  )),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

//RELATED FARMER LIST
Widget Related_Farmer_List() {
  return Container(
    width: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(width: 2, color: green2),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 10),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2, color: green2),
                image: DecorationImage(
                    image: AssetImage('lib/assets/Sunset.jpeg'),
                    fit: BoxFit.cover)),
          ),
          Text(
            'Vilfresh Selva',
            style: shopT,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: Text(
              'Know my Story',
              style: cardT,
            ),
          ),
        ],
      ),
    ),
  );
}

//CHECKOUT LIST
//PRODUCT CARD
Widget CheckOut_List(
  context, {
  required String productname,
  required String varient,
  required String qty,
  required String totalamt,
  required String image,
  required Function() deleteBtn,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: white1,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.fitHeight)),
              ),

              const SizedBox(width: 5),

              Container(
                  width: MediaQuery.sizeOf(context).width /2.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productname,
                        style: productNameT,
                        maxLines: 7,
                      ),
                      Text(
                        varient,
                        style: kgT,
                      ),
                    ],
                  )
              ),

              const Spacer(),

              Quantity(),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                  width: MediaQuery.sizeOf(context).width/8,
                  child: Text(
                    '₹ ${totalamt}',
                    style: kgT,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5,),
          Divider(thickness: 1,)
        ],
      ),
    ),
  );
}

class Quantity extends StatefulWidget {
  const Quantity({super.key});

  @override
  State<Quantity> createState() => _QuantityState();
}

class _QuantityState extends State<Quantity> {
  int _count = 1;

  void _incrementCounter() {
    setState(() {
      _count++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_count > 1) {
        _count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          // Text(
          //   'Quantity  : ',
          //   style: kgT,
          // ),
          Container(
            height: 35,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: green1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: _decrementCounter,
                  child: Icon(
                    Icons.remove,
                    size: 18,
                    color: green1,
                  ),
                ),
                Text(
                  '$_count',
                  style: kgT,
                ),
                InkWell(
                  onTap: _incrementCounter,
                  child: Icon(
                    Icons.add,
                    size: 20,
                    color: green1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
