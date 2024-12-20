import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vilfresh/Common_Widgets/Common_Button.dart';
import 'package:vilfresh/Common_Widgets/Common_Pop_Up.dart';
import 'package:vilfresh/Common_Widgets/Image_Picker.dart';
import 'package:vilfresh/Model/CartModel.dart';
import 'package:vilfresh/Model/CategoriesModel.dart';
import 'package:vilfresh/Model/OtherCategoriesModel.dart';
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
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 10,
              width: MediaQuery.sizeOf(context).width / 4.5,
              child: buildImage(ProductImg,
                  border: const Radius.circular(0), fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 2,
                    child: Text(
                      ProductName,
                      style: orderNameT,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 3.3,
                          child: Text(
                            'Qty:$Qnty',
                            style: qntT,
                            maxLines: 4,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '₹ $ProductRate',
                          style: orderPriceT,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Delivered on $DeliveredDate',
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
              SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: CommonElevatedButtonGreen(context, "Rate", () {})),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: CommonElevatedButtonGreen(context, "Cancel", () {})),
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
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("lib/assets/glassmilk.png"),
                        fit: BoxFit.fitHeight)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
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
              child: const Icon(
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
Widget Categories_List(
  context,
  ItemDetail categoryData, {
  required void Function()? increment,
  required void Function()? decrement,
  required void Function()? Add,
  required void Function(int?)? delivered,
  required void Function(int?, int?)? countUpdate,
}) {
  int totalQty = categoryData.allVariant!
      .map((variant) => int.parse(variant.itemQty ?? ""))
      .reduce((a, b) => a + b);

  int allVarientTotalQty = categoryData.allVariant!
      .map((variant) => int.parse(variant.itemQty ?? ""))
      .reduce((a, b) => a + b);

  int counter = 0;

  void increment0() {
    counter++;
  }

  void decrement0() {
    if (counter != 0) {
      counter--;
    }
  }

  void BottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ItemIncrement_PopUp(
            categoryData: categoryData,
            countUpdate: countUpdate,
          );
        });
  }

  String dateConvert(String date) {
    DateFormat inputFormat = DateFormat("yyyy-MM-dd");
    DateTime dateTime = inputFormat.parse(date);

    DateFormat outputFormat = DateFormat("dd MMM EEE");
    String formattedDate = outputFormat.format(dateTime);

    return formattedDate;
  }

  return Container(
    width: MediaQuery.sizeOf(context).width / 2.5,
    decoration: const BoxDecoration(
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
            style: const TextStyle(
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
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categoryData.allVariant?[0].variantName ?? "",
                    style: kgT,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      "Approx Price ",
                      style: cardT,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  categoryData.Category_Type != "Others"
                      ? Text(
                          "₹${categoryData.allVariant?[0].sellingPrice} - ₹${categoryData.allVariant?[0].actualPrice}",
                          style: productPrice,
                          textAlign: TextAlign.center,
                        )
                      : Text(
                          "₹${categoryData.allVariant?[0].sellingPrice}",
                          style: productPrice,
                          textAlign: TextAlign.center,
                        ),
                  totalQty > 0 &&
                          int.parse(categoryData.variantCount ?? "0") == 1
                      ? Container(
                          margin: const EdgeInsets.only(bottom: 10, top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.shade100,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: decrement,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 10, bottom: 10),
                                  child: Text(
                                    '-',
                                    style: kgT,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Text(
                                  "$totalQty",
                                  style: kgT,
                                ),
                              ),
                              InkWell(
                                onTap: increment,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 10, bottom: 10),
                                  child: Text(
                                    '+',
                                    style: kgT,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : int.parse(categoryData.variantCount ?? "0") > 1 &&
                              allVarientTotalQty == 0
                          ? InkWell(
                              onTap: () {
                                BottomSheet();
                              },
                              child: Container(
                                  margin: const EdgeInsets.only(bottom: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey.shade100,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5, left: 20, right: 30),
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "${categoryData.variantCount ?? ""} Options",
                                          style: productPrice,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  )),
                            )
                          : int.parse(categoryData.variantCount ?? "0") == 1 &&
                                  totalQty == 0
                              ? InkWell(
                                  onTap: () {},
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          bottom: 10, top: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey.shade100,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5,
                                            bottom: 5,
                                            left: 20,
                                            right: 30),
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Icon(
                                              Icons.add_shopping_cart_sharp,
                                              size: 25,
                                              color: green2,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            InkWell(
                                              onTap: Add,
                                              child: Text(
                                                "Add",
                                                style: productPrice,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                )
                              : InkWell(
                                  onTap: () {
                                    BottomSheet();
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        bottom: 0, top: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey.shade100,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 10,
                                              bottom: 10),
                                          child: Text(
                                            '-',
                                            style: kgT,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Text(
                                            "$allVarientTotalQty",
                                            style: kgT,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 10,
                                              bottom: 10),
                                          child: Text(
                                            '+',
                                            style: kgT,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                  totalQty != 0 && allVarientTotalQty == 0
                      ? Text(
                          "$totalQty in cart",
                          style: StarT1,
                        )
                      : allVarientTotalQty != 0
                          ? Text(
                              "$allVarientTotalQty in cart",
                              style: StarT1,
                            )
                          : Container()
                ],
              )
            ],
          ),
          categoryData.Category_Type != "VF Basket"
              ? Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Will be delivered on ${dateConvert(categoryData.nextDeliveryDateDay?[categoryData.selectedNextDeliveryDate!].dates ?? "")} or Choose date",
                        style: circularT2,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                insetPadding: EdgeInsets
                                    .zero, // Remove default left and right padding
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius
                                      .zero, // Set corner radius to 0
                                ),
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  height: 100, // Set the height of the pop-up
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: categoryData
                                            .nextDeliveryDateDay?.length ??
                                        0,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          delivered!(index);
                                          Navigator.pop(context);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              SizedBox(
                                                width: 50,
                                                child: Text(
                                                  textAlign: TextAlign.center,
                                                  dateConvert(categoryData
                                                          .nextDeliveryDateDay?[
                                                              index]
                                                          .dates ??
                                                      ""),
                                                  style: const TextStyle(
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: const Icon(
                          Icons.calendar_month,
                          size: 25,
                          color: green2,
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    ),
  );
}

Widget OtherCategories_List(
  context,
  OtherItemDetail categoryData, {
  required void Function(String qty, String varientID)? increment,
  required void Function(String qty, String varientID)? decrement,
}) {
  int totalQty = categoryData.allVariant!
      .map((variant) => int.parse(variant.itemQty ?? ""))
      .reduce((a, b) => a + b);

  int counter = 0;

  void increment0() {
    counter++;
  }

  void decrement0() {
    if (counter != 0) {
      counter--;
    }
  }

  void BottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ItemIncrement_PopUp1(categoryData: categoryData);
        });
  }

  return Container(
    width: MediaQuery.sizeOf(context).width / 2.5,
    decoration: const BoxDecoration(
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
            style: const TextStyle(
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
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categoryData.allVariant?[0].variantName ?? "",
                    style: kgT,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      "Approx Price ",
                      style: cardT,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    "₹${categoryData.allVariant?[0].sellingPrice} - ₹${categoryData.allVariant?[0].actualPrice}",
                    style: productPrice,
                    textAlign: TextAlign.center,
                  ),
                  totalQty > 0
                      ? InkWell(
                          onTap: () {
                            BottomSheet();
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10, top: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.shade100,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 10, bottom: 10),
                                  child: Text(
                                    '-',
                                    style: kgT,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Text(
                                    "$totalQty",
                                    style: kgT,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 10, bottom: 10),
                                  child: Text(
                                    '+',
                                    style: kgT,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : int.parse(categoryData.variantCount ?? "0") > 1
                          ? InkWell(
                              onTap: () {
                                BottomSheet();
                              },
                              child: Container(
                                  margin: const EdgeInsets.only(bottom: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey.shade100,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5, left: 20, right: 30),
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "${categoryData.variantCount ?? ""} Options",
                                          style: productPrice,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  )),
                            )
                          : int.parse(categoryData.variantCount ?? "0") == 1
                              ? Container(
                                  margin: const EdgeInsets.only(
                                      bottom: 10, top: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey.shade100,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          // BottomSheet();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 10,
                                              bottom: 10),
                                          child: Text(
                                            '-',
                                            style: kgT,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          "$totalQty",
                                          style: kgT,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          // BottomSheet();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 10,
                                              bottom: 10),
                                          child: Text(
                                            '+',
                                            style: kgT,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : InkWell(
                                  onTap: () {},
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          bottom: 10, top: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey.shade100,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5,
                                            bottom: 5,
                                            left: 20,
                                            right: 30),
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Icon(
                                              Icons.add_shopping_cart_sharp,
                                              size: 25,
                                              color: green2,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Add",
                                              style: productPrice,
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
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
        "₹ $amount",
        style: amountT,
      ),
    ),
  );
}

//VF BASKET CARD
Widget VF_Basket_Card(context,
    {required String TaskImg,
    required String productName,
    required String weight,
    required String price,
    required String offerPrice,
    required void Function()? onTap}) {
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
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15)),
                image: DecorationImage(
                    image: NetworkImage(TaskImg), fit: BoxFit.cover)),
          ),
          Container(
              margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Text(
                productName,
                style: cardT,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )),
          Container(
              margin: const EdgeInsets.only(bottom: 0, left: 15, right: 15),
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
                      "₹ $price",
                      style: cardT,
                    ),
                    Text(
                      "₹ $offerPrice",
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
            margin: const EdgeInsets.only(top: 20, bottom: 10),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2, color: green2),
                image: const DecorationImage(
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
  required CartData checkOutData,
  required Function() incrementCounter,
  required Function() decrementCounter,
}) {
// int _count = 1;
//   void _incrementCounter() {
//     setState(() {
//       _count++;
//     });
//   }

//   void _decrementCounter() {
//     setState(() {
//       if (_count > 1) {
//         _count--;
//       }
//     });
//   }

  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
          // color: white1,
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
                        image: NetworkImage(checkOutData.image ?? ""),
                        fit: BoxFit.fitHeight)),
              ),

              const SizedBox(width: 5),

              SizedBox(
                  width: MediaQuery.sizeOf(context).width / 2.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        checkOutData.iTEMNAME ?? "",
                        style: productNameT,
                        maxLines: 7,
                      ),
                      Text(
                        checkOutData.iTEMVARIANT ?? "",
                        style: kgT,
                      ),
                    ],
                  )),

              const Spacer(),

              // Quantity(),
              Padding(
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
                            onTap: decrementCounter,
                            child: const Icon(
                              Icons.remove,
                              size: 18,
                              color: green1,
                            ),
                          ),
                          Text(
                            checkOutData.qty ?? "",
                            style: kgT,
                          ),
                          InkWell(
                            onTap: incrementCounter,
                            child: const Icon(
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
              ),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width / 8,
                  child: Text(
                    '₹ ${checkOutData.totalAmt ?? ""}',
                    style: kgT,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: Text(
              "Will be delivered on ${checkOutData.deliveryDate ?? ""}",
              style: cardT,
            ),
          ),
          const Divider(
            thickness: 1,
          )
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
                  child: const Icon(
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
                  child: const Icon(
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
