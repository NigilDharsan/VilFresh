import 'package:flutter/material.dart';
import 'package:vilfresh/Home%20Screen/Daily_Subscription_Screen.dart';
import 'package:vilfresh/Src/Checkout_Ui/Checkout_Screen.dart';
import 'package:vilfresh/Src/Home_DashBoard_Ui/Home_DashBoard_Screen.dart';
import 'package:vilfresh/Src/My_Order_Ui/My_Order_Screen.dart';

class Bottom_Navigation_Bar extends StatefulWidget {
  int select;
  Bottom_Navigation_Bar({super.key, required this.select});

  @override
  State<Bottom_Navigation_Bar> createState() => _Bottom_Navigation_BarState();
}

class _Bottom_Navigation_BarState extends State<Bottom_Navigation_Bar> {
  final pages = [
    Home_Screen(),
    Subscription_Details(ltrValue: '1', ltrOptions: ["2"], isMore: false,),
    My_Order_Screen(isMore: false,),
    CheckOut_Screen(),
  ];

  void b(index) {
    setState(() {
      widget.select = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: pages[widget.select],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.green.shade900,
            selectedLabelStyle: TextStyle(color: Colors.green.shade900),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                activeIcon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.list_alt_outlined),
                  icon: Icon(Icons.list_alt_outlined),
                  label: "Subscription"),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.shopping_bag_sharp),
                  icon: Icon(Icons.shopping_bag_sharp),
                  label: "My Orders"),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.shopping_cart),
                  icon: Icon(Icons.shopping_cart),
                  label: "Cart"),
              // BottomNavigationBarItem(
              //     activeIcon: _IconImg("package2.svg"),
              //     icon: _IconImg("package1.svg"),
              //     label: "Products"),
            ],
            currentIndex: widget.select,
            onTap: b,
          ),
        ),
      ),
    );
  }
}
