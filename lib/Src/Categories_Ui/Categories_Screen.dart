import 'package:flutter/material.dart';
import 'package:vilfresh/Common_Widgets/Common_List.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class Categories_Screen extends StatefulWidget {
  @override
  _Categories_ScreenState createState() => _Categories_ScreenState();
}

class _Categories_ScreenState extends State<Categories_Screen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround1,
      appBar:Custom_AppBar(title: 'Categories ', actions: [
        Icon(Icons.search,size: 28,color: green2,),
        Container(
            margin: EdgeInsets.only(left:15,right: 20),
            height:35,width:35,child: ImgPathSvg("wallet.svg")),
      ], isNav: true, isGreen: false,),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
              const SizedBox(height: 25,),
            TabBar(
              controller: _tabController,
              dividerColor: backGround1,
              isScrollable: true,
              padding: EdgeInsets.only(left: 5,right: 5),
              labelColor: green2,
              labelStyle: productPrice,
              // labelStyle: TabT,
              indicator: BoxDecoration(
                  color: green3,
                  borderRadius: BorderRadius.circular(10)

              ),
              indicatorColor: green2,
              unselectedLabelColor: green2,
              unselectedLabelStyle: productPrice,
              indicatorPadding: EdgeInsets.zero,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Container(
                  child: Tab(
                    text: 'VF Basket',
                  ),
                ),
                Container(
                  child: Tab(
                    text: 'Farm2Home',
                  ),
                ),
                Container(
                  child: Tab(
                    text: 'Factory To Home',
                  ),
                ),
                Container(
                  child: Tab(
                    text: 'Home To Home',
                  ),
                ),
                Container(
                  child: Tab(
                    text: 'City Pride',
                  ),
                ),
                Container(
                  child: Tab(
                    text: 'Daily Deals',
                  ),
                ),
                Container(
                  child: Tab(
                    text: 'Featured Products',
                  ),
                ),

              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Center(child: _vfBasketList()),
                  Center(child: _vfBasketList()),
                  Center(child: _vfBasketList()),
                  Center(child: _vfBasketList()),
                  Center(child: _vfBasketList()),
                  Center(child: _vfBasketList()),
                  Center(child: _vfBasketList()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  //VF BASKET LIST
  Widget _vfBasketList(){
    return ListView.builder(
        itemCount:  10,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        // physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index){
          return InkWell(
            onTap:(){
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 15,left: 20,right: 20),
              child: Categories_List(context),
            ),
          );
        });
  }
}
