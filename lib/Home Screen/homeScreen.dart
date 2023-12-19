import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'NavDrawar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final items = [
    Image(image: AssetImage('lib/assets/Sunset.jpeg'), fit: BoxFit.fill),
    Image(
      image: AssetImage('lib/assets/Sunset.jpeg'),
      fit: BoxFit.fill,
    ),
    Image(
      image: AssetImage('lib/assets/Sunset.jpeg'),
      fit: BoxFit.fill,
    )
  ];
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
        // leading: Icon(Icons.menu,color: Colors.green,),
        title: Container(
          height: 30,
          width: 250,
          decoration: BoxDecoration(),
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black45, width: 1),
              ),
              suffixIcon: Icon(
                Icons.search,
                color: Colors.green,
              ),
              hintText: 'Search',
              contentPadding: EdgeInsets.all(10),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: items,
              options: CarouselOptions(
                  height: 250,
                  enlargeCenterPage: false,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  }),
            ),
            DotsIndicator(
              dotsCount: items.length,
              position: currentIndex.toInt(),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Shop By Category',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 160),
                  child: Text(
                    'View all',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.arrow_downward_outlined,
                  size: 18,
                  color: Colors.green,
                )
              ],
            ),
            Container(
              height: 220,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 4,
                children: List.generate(8, (index) {
                  return Column(
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(5.0, 5.0))
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('lib/assets/Sunset.jpeg'),
                              fit: BoxFit.fill,
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("data"),
                      // SizedBox(height: 10,),
                      // Text("data")
                    ],
                  );
                }),
              ),
            ),
            // Container(
            //   height: 160,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //       itemCount: 4,
            //       itemBuilder:(BuildContext,index){
            //     return Column(
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Container(
            //             height: 100,
            //             width: 80,
            //             decoration: BoxDecoration(
            //               boxShadow: [BoxShadow(color: Colors.grey,
            //               spreadRadius: 1,
            //               blurRadius: 5,
            //               offset: Offset(5.0,
            //                   5.0))],
            //               shape: BoxShape.circle,
            //               image: DecorationImage(
            //                 image: AssetImage('assets/Test.JPG'),fit: BoxFit.fill,
            //               )
            //             ),
            //           ),
            //         )
            //       ],
            //     );
            //   }
            // ),
            // ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Shop By Category',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 160),
                  child: Text(
                    'View all',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.arrow_downward_outlined,
                  size: 18,
                  color: Colors.green,
                )
              ],
            ),
            Container(
              height: 400,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: List.generate(4, (index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[100],
                    child: const Text("He'd have you all unravel at the"),
                  );
                }),
              ),
            )

            // Container(
            //     height: 160,
            //     child: ListView.builder(
            //         scrollDirection: Axis.horizontal,
            //         itemCount: 4,
            //         itemBuilder:(BuildContext,index){
            //           return Column(
            //             children: [
            //               Padding(
            //                 padding: const EdgeInsets.all(8.0),
            //                 child: Container(
            //                   height: 100,
            //                   width: 80,
            //                   decoration: BoxDecoration(
            //                       boxShadow: [BoxShadow(color: Colors.grey,
            //                           spreadRadius: 1,
            //                           blurRadius: 5,
            //                           offset: Offset(5.0,
            //                               5.0))],
            //                       shape: BoxShape.circle,
            //                       image: DecorationImage(
            //                           image: AssetImage('assets/Test.JPG'),fit: BoxFit.fill
            //                       )
            //                   ),
            //                 ),
            //               )
            //             ],
            //           );
            //         }
            //     )
            // )
          ],
        ),
      ),
    );
  }
}
