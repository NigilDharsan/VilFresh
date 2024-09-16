import 'package:flutter/material.dart';
import 'package:vilfresh/Common_Widgets/Common_Button.dart';
import 'package:vilfresh/Common_Widgets/Common_List.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Src/Farmer_Detail_Ui/Farmer_Detail_Screen.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class Product_Description_Screen extends StatefulWidget {
  const Product_Description_Screen({super.key});

  @override
  State<Product_Description_Screen> createState() =>
      _Product_Description_ScreenState();
}

class _Product_Description_ScreenState
    extends State<Product_Description_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_AppBar(
        title: "",
        actions: [],
        isNav: true,
        isGreen: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Product_Card(context),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 25),
                child: CommonElevatedButtonGreen(context, "Add", () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckOut_Screen()));
                }),
              ),
              Text(
                'Know your Product',
                style: knowT,
              ),
              //ALSO KNOWN
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                ),
                child: Text(
                  "Also known as:",
                  style: Textfield_Style2,
                ),
              ),
              Text(
                "Ananas comosus",
                style: contentT,
              ),
              //Seasonality
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                ),
                child: Text(
                  "Seasonality:",
                  style: Textfield_Style2,
                ),
              ),
              Text(
                "Round the year",
                style: contentT,
              ),
              //BASIC INFORMATION
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                ),
                child: Text(
                  "Seasonality:",
                  style: Textfield_Style2,
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Text(
                    "Pineapple is a tropical fruit that is known for its sweet and tangy flavor. One cup of fresh pineapple chunks (165g) contains approximately 82 calories. Pineapple is an excellent source of vitamin C. It is also a good source of manganese, vitamin B6, copper, and thiamin. Pineapple is low in fat and protein but high in fiber. In addition to its nutritional value, pineapple has been associated with several health benefits. For example, it may help reduce inflammation and boost immunity",
                    style: contentT,
                    maxLines: 10,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: CommonElevatedButtonGreen(context, "Recipes", () {}),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child:
                    CommonElevatedButtonGreen(context, "Know your Farmer", () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Farmer_Detail_Screen(
                                aboutFarmerData: null,
                              )));
                }),
              ),
              Text(
                'Similar Product',
                style: knowT,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 50),
                child: Container(height: 240, child: _relatedList()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //RELATED PRODUCT
  Widget _relatedList() {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(right: 15),
          child: VF_Basket_Card(
            context,
            TaskImg: "lib/assets/Sunset.jpeg",
            productName: "Lettuce",
            weight: "1 Kg",
            price: "40",
            offerPrice: "80",
            onTap: () {},
          ),
        );
      },
    );
  }
}
