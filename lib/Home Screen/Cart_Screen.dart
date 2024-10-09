import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/Common_Widgets/Image_Picker.dart';
import 'package:vilfresh/Model/ProductDescriprtionModel.dart';
import 'package:vilfresh/Src/Farmer_Detail_Ui/Farmer_Detail_Screen.dart';
import 'package:vilfresh/Src/Wallet_Ui/Wallet_Screen.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Generic.dart';
import 'package:vilfresh/utilits/Loading_Overlay.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class Cart_Screeen extends ConsumerStatefulWidget {
  final String Categories_Id;
  final String Item_Id;
  final String Item_Name;
  final String deliveredDate;
  void Function(int?, int?)? countUpdate;

  Cart_Screeen(
      {super.key,
      required this.Categories_Id,
      required this.Item_Id,
      required this.Item_Name,
      required this.deliveredDate,
      required this.countUpdate});

  @override
  ConsumerState<Cart_Screeen> createState() => _Cart_ScreeenState();
}

class _Cart_ScreeenState extends ConsumerState<Cart_Screeen> {
  int selectVariant = 0;
  bool? isSelect;
  var formData1 = <String, dynamic>{};
  int _counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    formData1 = <String, dynamic>{
      "Category_ID": widget.Categories_Id,
      "Item_ID": widget.Item_Id,
      "User_ID": SingleTon().user_id,
    };
  }

  Future<void> _increment(
      int index, String VARIANT_ID, String Category_ID, String Item_Id) async {
    _counter++;

    if (_counter == 1) {
      LoadingOverlay.show(context);
      widget.countUpdate!(index, _counter);

      var formData = <String, dynamic>{
        "CH_USER_ID": await getuserId(),
        'Cart_Items': [
          {
            "CI_ITEM_ID": Item_Id,
            "CI_VARIANT_TYPE": VARIANT_ID,
            "CI_ITEM_QTY": "1",
            "Delivery_Date": widget.deliveredDate,
            "Category_ID": Category_ID
          }
        ],
      };

      final result = await ref.read(AddToCardProvider(formData).future);

      LoadingOverlay.forcedStop();
      // Handle the result
      if (result?.status == "true") {
        ShowToastMessage(result?.message ?? "");
        ref.refresh(ProductDetailProvider(formData1));
        // Handle success
      } else {
        // Handle failure
        ShowToastMessage(result?.message ?? "");
      }
    } else {
      LoadingOverlay.show(context);
      var formData = <String, dynamic>{
        "CH_USER_ID": await getuserId(),
        'Cart_Items': [
          {
            "CI_ITEM_ID": Item_Id,
            "CI_VARIANT_TYPE": VARIANT_ID,
            "CI_ITEM_QTY": "${_counter}",
            "Delivery_Date": widget.deliveredDate
          }
        ],
      };

      final result = await ref.read(
        AddToCardUpdateProvider(formData).future,
      );
      LoadingOverlay.forcedStop();
      if (result?.status == "true") {
        ShowToastMessage(result?.message ?? "");
        ref.refresh(ProductDetailProvider(formData1));
      } else {
        ShowToastMessage(result?.message ?? "");
      }
    }
  }

  Future<void> _decrement(int index, String VARIANT_ID, String Item_Id) async {
    if (_counter != 0) {
      _counter--;

      if (_counter == 0) {
        widget.countUpdate!(index, _counter);

        LoadingOverlay.show(context);

        var formData = <String, dynamic>{
          "CH_USER_ID": await getuserId(),
          'Cart_Items': [
            {
              "CI_ITEM_ID": Item_Id,
              "CI_VARIANT_TYPE": VARIANT_ID,
            }
          ],
        };

        final result = await ref.read(AddToCardDeleteProvider(formData).future);

        LoadingOverlay.forcedStop();
        // Handle the result
        if (result?.status == "true") {
          ShowToastMessage(result?.message ?? "");
          ref.refresh(ProductDetailProvider(formData1));
          // Handle success
        } else {
          // Handle failure
          ShowToastMessage(result?.message ?? "");
        }
      } else {
        LoadingOverlay.show(context);
        var formData = <String, dynamic>{
          "CH_USER_ID": await getuserId(),
          'Cart_Items': [
            {
              "CI_ITEM_ID": Item_Id,
              "CI_VARIANT_TYPE": VARIANT_ID,
              "CI_ITEM_QTY": "${_counter}",
              "Delivery_Date": widget.deliveredDate
            }
          ],
        };

        final result = await ref.read(
          AddToCardUpdateProvider(formData).future,
        );
        LoadingOverlay.forcedStop();
        if (result?.status == "true") {
          ShowToastMessage(result?.message ?? "");
          ref.refresh(ProductDetailProvider(formData1));
        } else {
          ShowToastMessage(result?.message ?? "");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final productDescriptionData = ref.watch(ProductDetailProvider(formData1));
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,

        // leading: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.green.shade900,),
        title: Text(
          widget.Item_Name,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 22,
              color: Colors.green.shade900),
        ),
        actions: [
          Container(
              margin: EdgeInsets.only(right: 20),
              height: 35,
              width: 35,
              child: Center(
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Wallet_Screen()));
                    },
                    child: ImgPathSvg("wallet.svg")),
              )),
        ],
      ),
      body: productDescriptionData.when(
        data: (productDetailData) {
          int? totalAmount = productDetailData
              ?.itemVariantData![0].itemDetail?[0].allVariant!
              .map((variant) =>
                  int.parse(variant.itemQty ?? "") *
                  int.parse(variant.sellingPrice ?? ""))
              .reduce((a, b) => a + b);

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.green.shade200),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Image.network(
                              productDetailData?.itemVariantData?[0]
                                      .itemDetail?[0].itemImage ??
                                  "",
                              height: 150,
                              width: 130,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: MediaQuery.sizeOf(context).width / 2,
                                child: Text(
                                  productDetailData?.itemVariantData?[0]
                                          .itemDetail?[0].item ??
                                      "",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.green.shade900),
                                  maxLines: 2,
                                )),
                            Text(
                              productDetailData
                                      ?.itemVariantData?[0]
                                      .itemDetail?[0]
                                      .allVariant?[0]
                                      .variantName ??
                                  "",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green.shade700),
                            ),
                            Text(
                              "₹${productDetailData?.itemVariantData?[0].itemDetail?[0].allVariant?[0].sellingPrice ?? ""}",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green.shade900),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width / 2,
                              child: Row(
                                children: [
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Share.share('VilFresh');
                                    },
                                    child: Container(
                                        height: 20,
                                        width: 20,
                                        alignment: Alignment.bottomRight,
                                        child: ImgPathSvg("share.svg")),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Select Variant",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.green.shade800),
                    ),
                  ),
                  widget.deliveredDate != ""
                      ? Center(
                          child: Text(
                          "Will be delivered on ${widget.deliveredDate}",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.green.shade900),
                        ))
                      : Center(
                          child: Text(
                          "Will be delivered on ${productDetailData?.itemVariantData?[0].itemDetail?[0].nextDeliveryDateDay?[0].dates}",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.green.shade900),
                        )),
                  VariantSection(productDetailData),

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0, right: 0, top: 20, bottom: 30),
                    child: Container(
                      height: 45,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: green1,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            Text(
                              "Total Item Price:",
                              style: appTitle2,
                            ),
                            const Spacer(),
                            Text(
                              "₹ ${totalAmount}",
                              style: appTitle2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Padding(
                  //     padding: const EdgeInsets.only(top: 10, bottom: 15),
                  //     child: InkWell(
                  //         onTap: () async {
                  //           // Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckOut_Screen()));

                  //           LoadingOverlay.show(context);

                  //           var formData = <String, dynamic>{
                  //             "CH_USER_ID": await getuserId(),
                  //             'Cart_Items': [
                  //               {
                  //                 "CI_ITEM_ID": widget.Item_Id,
                  //                 // "CI_VARIANT_TYPE": productDetailData
                  //                 //     ?.itemVariantData?[selectVariant!]
                  //                 //     .variantCount,
                  //                 "CI_ITEM_QTY": "1"
                  //               }
                  //             ],
                  //           };

                  //           final result = await ref
                  //               .read(AddToCardProvider(formData).future);

                  //           LoadingOverlay.forcedStop();
                  //           // Handle the result
                  //           if (result?.status == true) {
                  //             ShowToastMessage(result?.message ?? "");
                  //             Navigator.pop(context, true);

                  //             // Handle success
                  //           } else {
                  //             // Handle failure
                  //             ShowToastMessage(result?.message ?? "");
                  //           }
                  //         },
                  //         child: CommonButton(txt: "Add"))),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Know your Product",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.green.shade900),
                  ),
                  TextWithHeader(htxt: 'Also known as : ', stxt: ""),
                  TextWithHeader(htxt: 'Seasonality : ', stxt: ""),
                  TextWithHeader(
                    htxt: 'Basic Information : ',
                    stxt: "",
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: CommonButton(txt: "Recipes")),
                  Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Farmer_Detail_Screen(
                                          aboutFarmerData: productDetailData
                                              ?.aboutFarmerData,
                                        )));
                          },
                          child: CommonButton(txt: "Know your farmer"))),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Similar Products",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.green.shade900),
                    ),
                  ),
                  Container(
                      height: 157,
                      child: ProductContainer(
                          productDetailData?.similarItems ?? [])),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          );
        },
        error: (Object error, StackTrace stackTrace) {
          return Center(
              child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 300,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImgPathPng('nopreview.png'),
                  Text('No Data!'),
                ],
              ),
            ),
          ));
        },
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget VariantSection(ProductDescriptionModel? productDetailData) {
    // Determine the groupValue based on the selected variant index
    int? groupValue =
        selectVariant; // Assuming selectVariant is defined somewhere in your class

    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: productDetailData
              ?.itemVariantData?[0].itemDetail?[0].allVariant?.length ??
          0,
      itemBuilder: (BuildContext context, int index) {
        AllVariant? variant = productDetailData!
            .itemVariantData![0].itemDetail?[0].allVariant?[index];

        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.green.shade200,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Radio(
                  //   activeColor: Colors.green.shade900,
                  //   value:
                  //       index, // Use index as value to uniquely identify each radio button
                  //   groupValue: groupValue,
                  //   onChanged: (int? value) {
                  //     setState(() {
                  //       selectVariant =
                  //           value!; // Update selectVariant with the selected index
                  //       isSelect = true;
                  //       _counter = int.parse(variant?.itemQty ?? "0");
                  //     });
                  //   },
                  // ),
                  const SizedBox(width: 10),

                  Container(
                    width: MediaQuery.sizeOf(context).width / 6,
                    child: Text(
                      productDetailData.itemVariantData?[0].itemDetail?[0]
                              .allVariant?[index].variantName ??
                          "",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.green.shade900,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(width: 10),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.green.shade900,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: variant?.actualPrice ?? "",
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.black,
                            decorationThickness: 2.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Divider(
                    color: Colors.green.shade900,
                  ),
                  Text(
                    "₹${variant?.sellingPrice ?? ""}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.green.shade900,
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(width: 10),
                  // Container(
                  //   height: 20,
                  //   width: MediaQuery.of(context).size.width / 3.5,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(5),
                  //     color: Colors.green.shade900,
                  //   ),
                  //   child: Center(
                  //     child: Text(
                  //       "${productDetailData?.itemVariantData?[index].allVariant?[index].discount ?? ""}% - ${productDetailData?.itemVariantData?[index].discount ?? ""}% off",
                  //       style: TextStyle(
                  //         fontSize: 14,
                  //         fontWeight: FontWeight.w600,
                  //         color: Colors.green.shade400,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(width: 10),
                  Spacer(),

                  Container(
                    margin: EdgeInsets.only(top: 0, right: 5),
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            _counter = int.parse(variant?.itemQty ?? "");

                            _decrement(index, variant?.variantID ?? "",
                                widget.Item_Id);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            child: Text(
                              '-',
                              style: Textfield_Style,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            "${variant?.itemQty ?? ""}",
                            style: Textfield_Style,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _counter = int.parse(variant?.itemQty ?? "");

                            _increment(
                                index,
                                variant?.variantID ?? "",
                                productDetailData.itemVariantData?[0]
                                        .itemDetail?[0].Category_ID ??
                                    "",
                                widget.Item_Id);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            child: Text(
                              '+',
                              style: Textfield_Style,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget TextWithHeader({required String htxt, required String stxt}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(htxt,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 18,
                )),
          ),
          Text(stxt,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 16,
              )),
        ],
      ),
    );
  }

  Widget CommonButton({required String txt}) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green.shade900,
      ),
      child: Center(
          child: Text(
        txt,
        style: TextStyle(
            fontWeight: FontWeight.w500, color: Colors.white, fontSize: 23),
      )),
    );
  }

  Widget ProductContainer(List<SimilarItems>? data) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: data?[0].itemDetail?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          final itemCount = int.parse(
              data?[0].itemDetail?[index].allVariant?[0].itemQty ?? "");
          return InkWell(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => Cart_Screeen(
              //               Categories_Id: widget.Categories_Id,
              //               Item_Id: data?.data?[index].itemID ?? "",
              //             )));

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Cart_Screeen(
                            Categories_Id:
                                data?[0].itemDetail?[index].categoryID ?? "",
                            Item_Id: data?[0].itemDetail?[index].itemID ?? "",
                            Item_Name:
                                data?[0].itemDetail?[index].categoryName ?? "",
                            deliveredDate: data?[0]
                                    .itemDetail?[index]
                                    .nextDeliveryDateDay?[0]
                                    .dates ??
                                "",
                            countUpdate: (CountIndex, qty) {
                              setState(() {});
                            },
                          ))).then((onValue) {
                ref.refresh(ProductDetailProvider(formData1));
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                //height: 200,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: Colors.green.shade900),
                    color: Colors.green.shade200),
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 5, left: 5, top: 5, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Container(
                        height: 60,
                        width: 80,
                        child: buildImage(
                            data?[0].itemDetail?[index].itemImage ?? "",
                            border: null,
                            fit: null),
                      )),
                      Text(
                        maxLines: 1,
                        data?[0].itemDetail?[index].item ?? "",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.green.shade500,
                            fontSize: 15),
                      ),
                      Container(
                        width: 120,
                        child: Text(
                          "${data?[0].itemDetail?[index].allVariant?[0].variantName ?? ""}  ₹ ${data?[0].itemDetail?[index].allVariant?[0].sellingPrice ?? ""}",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.green.shade900,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      itemCount == 0
                          ? Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    _counter = int.parse(data?[0]
                                            .itemDetail?[index]
                                            .allVariant?[0]
                                            .itemQty ??
                                        "");
                                    // widget.countUpdate!(index, _counter + 1);

                                    _increment(
                                        index,
                                        data?[0]
                                                .itemDetail?[index]
                                                .allVariant?[0]
                                                .variantID ??
                                            "",
                                        data?[0]
                                                .itemDetail?[index]
                                                .categoryID ??
                                            "",
                                        data?[0].itemDetail?[index].itemID ??
                                            "");
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.green.shade900,
                                    ),
                                    child: Center(
                                        child: Text(
                                      "Add",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 0, bottom: 0),
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green.shade900,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        _counter = int.parse(data?[0]
                                                .itemDetail?[index]
                                                .allVariant?[0]
                                                .itemQty ??
                                            "");
                                        // widget.countUpdate!(index, _counter - 1);

                                        _decrement(
                                            index,
                                            data?[0]
                                                    .itemDetail?[index]
                                                    .allVariant?[0]
                                                    .variantID ??
                                                "",
                                            data?[0]
                                                    .itemDetail?[index]
                                                    .itemID ??
                                                "");
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15,
                                            right: 15,
                                            top: 10,
                                            bottom: 10),
                                        child: Text(
                                          '-',
                                          style: Textfield_Style,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Text(
                                        "${data?[0].itemDetail?[index].allVariant?[0].itemQty ?? ""}",
                                        style: Textfield_Style,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _counter = int.parse(data?[0]
                                                .itemDetail?[index]
                                                .allVariant?[0]
                                                .itemQty ??
                                            "");
                                        // widget.countUpdate!(index, _counter + 1);

                                        _increment(
                                            index,
                                            data?[0]
                                                    .itemDetail?[index]
                                                    .allVariant?[0]
                                                    .variantID ??
                                                "",
                                            data?[0]
                                                    .itemDetail?[index]
                                                    .categoryID ??
                                                "",
                                            data?[0]
                                                    .itemDetail?[index]
                                                    .itemID ??
                                                "");
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15,
                                            right: 15,
                                            top: 10,
                                            bottom: 10),
                                        child: Text(
                                          '+',
                                          style: Textfield_Style,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
