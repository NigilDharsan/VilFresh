import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/Src/Categories_Ui/Categories_Screen.dart';
import 'package:vilfresh/Src/Product_Description_Ui/Product_Description_Screen.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

import '../../Home Screen/NavDrawar.dart';

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
              _viewAll(titleT: 'Shop By Category'),              //SHOP BY CATEGORY
              Container(
                height: 180,
                margin: EdgeInsets.only(top: 15,bottom: 20),
                child: Center(
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    primary: true,
                    crossAxisCount: 4,
                    children: List.generate(8, (index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Categories_Screen()));
                            },
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage('lib/assets/Sunset.jpeg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Text('data'),
                        ],
                      );
                    }),
                  ),
                ),
              ),
             //VF BASKET
              _viewAll(titleT: 'VF Basket'),
              Padding(
                padding: const EdgeInsets.only(top: 25,bottom: 15),
                child: Row(
                  children: [
                    InkWell(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_Description_Screen()));
                      },
                        child: _basketCard()),
                    const Spacer(),
                    InkWell(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_Description_Screen()));
                        },
                        child: _basketCard()),
                  ],
                ),
              ),
              Row(
                children: [
                  InkWell(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_Description_Screen()));
                      },
                      child: _basketCard()),
                  const Spacer(),
                  InkWell(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_Description_Screen()));
                      },
                      child: _basketCard()),
                ],
              ),
             SizedBox(height: 50,)

            ],
          ),
        ),
      ),
    );
  }
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

