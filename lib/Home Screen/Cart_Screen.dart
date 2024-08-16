import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/Common_Widgets/Image_Picker.dart';
import 'package:vilfresh/Model/ProductDescriprtionModel.dart';
import 'package:vilfresh/Model/SimilarItemsListModel.dart';
import 'package:vilfresh/Src/Farmer_Detail_Ui/Farmer_Detail_Screen.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Generic.dart';
import 'package:vilfresh/utilits/Loading_Overlay.dart';

class Cart_Screeen extends ConsumerStatefulWidget {
  final String Categories_Id;
  final String Item_Id;
  Cart_Screeen({super.key, required this.Categories_Id, required this.Item_Id});

  @override
  ConsumerState<Cart_Screeen> createState() => _Cart_ScreeenState();
}

class _Cart_ScreeenState extends ConsumerState<Cart_Screeen> {
  int selectVariant = 0;
  bool? isSelect;
  var formData = <String, dynamic>{};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    formData = <String, dynamic>{
      "Category_ID": widget.Categories_Id,
      "Item_ID": widget.Item_Id,
    };
  }

  @override
  Widget build(BuildContext context) {
    final productDescriptionData = ref.watch(ProductDetailProvider(formData));
    final similarItemData =
        ref.watch(SimilarItemProvider(widget.Categories_Id));
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,

        // leading: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.green.shade900,),
        title: productDescriptionData.when(
          data: (data) {
            return Text(
              data?.itemVariantData?[0].item ?? "",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: Colors.green.shade900),
            );
          },
          error: (Object error, StackTrace stackTrace) {
            return Text(error.toString());
          },
          loading: () => Center(child: CircularProgressIndicator()),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.account_balance_wallet,
              color: Colors.green.shade900,
            ),
          )
        ],
      ),
      body: productDescriptionData.when(
        data: (productDetailData) {
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
                              productDetailData?.itemVariantData?[0].itemImage ?? "",
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
                                  productDetailData?.itemVariantData?[0].item ??
                                      "",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.green.shade900),
                                  maxLines: 2,
                                )),
                            Text(
                              productDetailData?.itemVariantData?[0].variant ??
                                  "",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green.shade700),
                            ),
                            Text(
                              "₹${productDetailData?.itemVariantData?[0].sellingPrice ?? ""}",
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
                                  Container(
                                      height: 20,
                                      width: 20,
                                      alignment: Alignment.bottomRight,
                                      child: ImgPathSvg("share.svg")),
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
                  VariantSection(productDetailData),
                  Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 15),
                      child: InkWell(
                          onTap: () async {
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckOut_Screen()));

                            LoadingOverlay.show(context);

                            var formData = <String, dynamic>{
                              "CH_USER_ID": await getuserId(),
                              'Cart_Items': [
                                {
                                  "CI_ITEM_ID": widget.Item_Id,
                                  "CI_VARIANT_TYPE": productDetailData
                                      ?.itemVariantData?[selectVariant!]
                                      .variantID,
                                  "CI_ITEM_QTY": "1"
                                }
                              ],
                            };

                            final result = await ref
                                .read(AddToCardProvider(formData).future);

                            LoadingOverlay.forcedStop();
                            // Handle the result
                            if (result?.status == true) {
                              ShowToastMessage(result?.message ?? "");
                              Navigator.pop(context, true);

                              // Handle success
                            } else {
                              // Handle failure
                              ShowToastMessage(result?.message ?? "");
                            }
                          },
                          child: CommonButton(txt: "Add"))),
                  Text(
                    "Know your Product",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.green.shade900),
                  ),
                  TextWithHeader(htxt: 'Also known as : ',
                      stxt: ""),
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
                  similarItemData.when(
                    data: (data) {
                      return Container(
                          height: 157, child: ProductContainer(data));
                    },
                    error: (Object error, StackTrace stackTrace) {
                      return Text(error.toString());
                    },
                    loading: () => Center(child: CircularProgressIndicator()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          );
        },
        error: (Object error, StackTrace stackTrace) {
          return Text(error.toString());
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
      itemCount: productDetailData?.itemVariantData?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        ItemVariantData variant = productDetailData!.itemVariantData![index];

        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            height: 50,
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
                  Radio(
                    activeColor: Colors.green.shade900,
                    value:
                        index, // Use index as value to uniquely identify each radio button
                    groupValue: groupValue,
                    onChanged: (int? value) {
                      setState(() {
                        selectVariant =
                            value!; // Update selectVariant with the selected index
                        isSelect = true;
                      });
                    },
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
                          text: productDetailData
                                  ?.itemVariantData?[index].actualPrice ??
                              "",
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
                    "₹${productDetailData?.itemVariantData?[index].sellingPrice ?? ""}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.green.shade900,
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 20,
                    width: MediaQuery.of(context).size.width / 3.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.green.shade900,
                    ),
                    child: Center(
                      child: Text(
                        "${productDetailData?.itemVariantData?[index].discount ?? ""}% - ${productDetailData?.itemVariantData?[index].discount ?? ""}% off",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.green.shade400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: MediaQuery.sizeOf(context).width / 5,
                    child: Text(
                      productDetailData.itemVariantData?[index].variant ?? "",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.green.shade900,
                      ),
                      maxLines: 2,
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

  Widget ProductContainer(SimilarItemListModel? data) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: data?.data?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              //height: 200,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: Colors.green.shade900),
                  color: Colors.green.shade200),
              child: Padding(
                padding: const EdgeInsets.only(right: 5, left: 5,top: 5,bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Container(
                      height: 60,
                      width: 80,
                      child: buildImage(data?.data?[index].image ?? "",
                          border: null, fit: null),
                    )),
                    Text(
                      maxLines: 1,
                      data?.data?[index].itemName ?? "",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.green.shade500,
                          fontSize: 15),
                    ),
                    Container(
                      width: 120,
                      child: Text(
                        "${data?.data?[index].itemVariantName ?? ""}  ₹ ${data?.data?[index].sellingPrice ?? ""}",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.green.shade900,
                            fontWeight: FontWeight.w500,overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Center(
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
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
