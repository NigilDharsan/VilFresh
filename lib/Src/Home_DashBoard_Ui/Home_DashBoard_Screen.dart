import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vilfresh/Common_Widgets/Common_Button.dart';
import 'package:vilfresh/Common_Widgets/Common_List.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/Common_Widgets/Text_Form_Field.dart';
import 'package:vilfresh/Src/Categories_Ui/Categories_Screen.dart';
import 'package:vilfresh/Src/Product_Description_Ui/Product_Description_Screen.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

import 'NavDrawar.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  int currentIndex = 0;
  var arrayitems = [
    'Daily Subscription',
    'VF Basket',
    'Farm to Home',
    'Factory to Home'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        toolbarHeight: 80,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Container(height:25,width:25,child: ImgPathSvg('menu.svg')),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Container(
          height: 50,
          width: 250,
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: white1,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: green1,width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: green1, width: 1),
              ),
              suffixIcon: Icon(
                Icons.search,
                color: green1,size: 30,
              ),
              hintText: 'Search',
              hintStyle: searchT,
              contentPadding: EdgeInsets.all(10),
            ),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            height:35,width:35,child: ImgPathSvg("wallet.svg")),
        ],
        backgroundColor: white1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [
              //CAROSEL SLIDER
              CarouselSlider(
                  items:[
                    _carouselImg(context, offerImg: "lib/assets/Sunset.jpeg"),

                  ],
                  options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    aspectRatio: 16/9,
                    autoPlayAnimationDuration:Duration(milliseconds: 800),
                    onPageChanged: (index,reason){
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 10),
                child: Center(
                  child: AnimatedSmoothIndicator(
                    activeIndex: currentIndex,
                    count: 4,
                    effect: ExpandingDotsEffect(
                        dotHeight: 5,
                        dotWidth: 5,
                        activeDotColor: green1
                    ),
                  ),
                ),
              ),

              //VIEW ALL
              _viewAll(titleT: 'Shop By Category'),
              const SizedBox(height: 10,),

              _ShopCreate(), //SHOP BY CATEGORY
              const SizedBox(height: 20,),
              _ShopCreate(),//SHOP BY CATEGORY
              const SizedBox(height: 20,),

              //VF BASKET
              _viewAll(titleT: 'VF Basket'),
              Padding(
                padding: const EdgeInsets.only(top: 25,bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_Description_Screen()));
                      },
                        child:  VF_Basket_Card(
                          context,
                          TaskImg: "lib/assets/Sunset.jpeg",
                          productName: "Lettuce",
                          weight: "1 Kg",
                          price: "40",
                          offerPrice: "80",
                        ),),
                    InkWell(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_Description_Screen()));
                        },
                        child:  VF_Basket_Card(
                          context,
                          TaskImg: "lib/assets/Sunset.jpeg",
                          productName: "Lettuce",
                          weight: "1 Kg",
                          price: "40",
                          offerPrice: "80",
                        ),),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_Description_Screen()));
                      },
                      child:  VF_Basket_Card(
                        context,
                        TaskImg: "lib/assets/Sunset.jpeg",
                        productName: "Lettuce",
                        weight: "1 Kg",
                        price: "40",
                        offerPrice: "80",
                      ),),
                  InkWell(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_Description_Screen()));
                      },
                      child:  VF_Basket_Card(
                        context,
                        TaskImg: "lib/assets/Sunset.jpeg",
                        productName: "Lettuce",
                        weight: "1 Kg",
                        price: "40",
                        offerPrice: "80",
                      ),),
                ],
              ),
              const SizedBox(height: 20,),
              //Factory to Home
              _viewAll(titleT: 'Factory to Home'),
              Padding(
                padding: const EdgeInsets.only(top: 25,bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_Description_Screen()));
                      },
                      child:  VF_Basket_Card(
                        context,
                        TaskImg: "lib/assets/Sunset.jpeg",
                        productName: "Lettuce",
                        weight: "1 Kg",
                        price: "40",
                        offerPrice: "80",
                      ),),
                    InkWell(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_Description_Screen()));
                      },
                      child:  VF_Basket_Card(
                        context,
                        TaskImg: "lib/assets/Sunset.jpeg",
                        productName: "Lettuce",
                        weight: "1 Kg",
                        price: "40",
                        offerPrice: "80",
                      ),),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_Description_Screen()));
                    },
                    child:  VF_Basket_Card(
                      context,
                      TaskImg: "lib/assets/Sunset.jpeg",
                      productName: "Lettuce",
                      weight: "1 Kg",
                      price: "40",
                      offerPrice: "80",
                    ),),
                  InkWell(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_Description_Screen()));
                    },
                    child:  VF_Basket_Card(
                      context,
                      TaskImg: "lib/assets/Sunset.jpeg",
                      productName: "Lettuce",
                      weight: "1 Kg",
                      price: "40",
                      offerPrice: "80",
                    ),),
                ],
              ),
              const SizedBox(height: 20,),
              //Home to Home
              _viewAll(titleT: 'Home to Home'),
              Padding(
                padding: const EdgeInsets.only(top: 25,bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_Description_Screen()));
                      },
                      child:  VF_Basket_Card(
                        context,
                        TaskImg: "lib/assets/Sunset.jpeg",
                        productName: "Lettuce",
                        weight: "1 Kg",
                        price: "40",
                        offerPrice: "80",
                      ),),
                    InkWell(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_Description_Screen()));
                      },
                      child:  VF_Basket_Card(
                        context,
                        TaskImg: "lib/assets/Sunset.jpeg",
                        productName: "Lettuce",
                        weight: "1 Kg",
                        price: "40",
                        offerPrice: "80",
                      ),),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_Description_Screen()));
                    },
                    child:  VF_Basket_Card(
                      context,
                      TaskImg: "lib/assets/Sunset.jpeg",
                      productName: "Lettuce",
                      weight: "1 Kg",
                      price: "40",
                      offerPrice: "80",
                    ),),
                  InkWell(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_Description_Screen()));
                    },
                    child:  VF_Basket_Card(
                      context,
                      TaskImg: "lib/assets/Sunset.jpeg",
                      productName: "Lettuce",
                      weight: "1 Kg",
                      price: "40",
                      offerPrice: "80",
                    ),),
                ],
              ),
              const SizedBox(height: 20,),
              //Home to Home
              _viewAll(titleT: 'Today"s Deal'),
              Padding(
                padding: const EdgeInsets.only(top: 25,bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_Description_Screen()));
                      },
                      child:  VF_Basket_Card(
                        context,
                        TaskImg: "lib/assets/Sunset.jpeg",
                        productName: "Lettuce",
                        weight: "1 Kg",
                        price: "40",
                        offerPrice: "80",
                      ),),
                    InkWell(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_Description_Screen()));
                      },
                      child:  VF_Basket_Card(
                        context,
                        TaskImg: "lib/assets/Sunset.jpeg",
                        productName: "Lettuce",
                        weight: "1 Kg",
                        price: "40",
                        offerPrice: "80",
                      ),),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_Description_Screen()));
                    },
                    child:  VF_Basket_Card(
                      context,
                      TaskImg: "lib/assets/Sunset.jpeg",
                      productName: "Lettuce",
                      weight: "1 Kg",
                      price: "40",
                      offerPrice: "80",
                    ),),
                  InkWell(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_Description_Screen()));
                    },
                    child:  VF_Basket_Card(
                      context,
                      TaskImg: "lib/assets/Sunset.jpeg",
                      productName: "Lettuce",
                      weight: "1 Kg",
                      price: "40",
                      offerPrice: "80",
                    ),),
                ],
              ),
              const SizedBox(height: 20,),
              //SUGGEST MISSING
              Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 2,color: green2)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30,bottom: 20),
                        child: Text('Suggest missing product',style: shopT,),
                      ),
                      textfieldDescription(
                          hintText: 'Type your text here....',
                        validating: null,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15,bottom: 30),
                        alignment: Alignment.topLeft,
                        width: 150,
                          child: CommonElevatedButtonGreen(context, "SUBMIT", () { }))
                    ],
                  ),
                ),
              ),
             SizedBox(height: 50,)

            ],
          ),
        ),
      ),
    );
  }
  //SHOP BY CREATE
  Widget _ShopCreate(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        circularImg(context),
        const Spacer(),
        circularImg(context),
        const Spacer(),
        circularImg(context),
        const Spacer(),
        circularImg(context),
      ],
    );
  }
}

//CIRCULAR PRODUCT IMG
 Widget circularImg(context){
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Categories_Screen()));
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: white7
          ),
          child: ImgPathPng('glassmilk.png'),
        ),
        Container(
          width: 80,
            child: Text('Daily Subscription',style: circularT,maxLines: 3,textAlign: TextAlign.center,)),
      ],
    ),
  );
 }

Widget _carouselImg(context,{required String offerImg}){
  return Container(
    height: 200,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      image: DecorationImage(image: AssetImage(offerImg)),
    ),
  );
}

//VIEW ALL
Widget _viewAll({required String titleT,}){
  return  Row(
    children: [
      Text(
        titleT,
        style: shopT,
      ),
      const Spacer(),
      Text(
        'View all',
        style: viewAllT,
      ),
      Icon(
        Icons.arrow_forward_ios_rounded,
        size: 18,
        color: green1,
      )
    ],
  );
}
//BASKET CONTAINER
Widget _basketCard(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: 180,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: AssetImage("lib/assets/Sunset.jpeg"),fit: BoxFit.cover),
          border: Border.all(width: 2,color: green1)
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 5),
        alignment: Alignment.center,
        width: 100,
          child: Text("City Pride",style: cardT,maxLines: 2,)),
    ],
  );
}

