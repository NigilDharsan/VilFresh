import 'package:flutter/material.dart';
import 'package:vilfresh/Home%20Screen/Daily_Subscription_Screen.dart';
import 'package:vilfresh/Src/Checkout_Ui/Checkout_Screen.dart';
import 'package:vilfresh/Src/Home_DashBoard_Ui/Home_DashBoard_Screen.dart';
import 'package:vilfresh/Src/My_Order_Ui/My_Order_Screen.dart';

class Bottom_Navigation_Bar extends StatefulWidget {
  int select;
  Bottom_Navigation_Bar({super.key, required this.select});

  @override
  Bottom_Navigation_BarState createState() => Bottom_Navigation_BarState();
}

class Bottom_Navigation_BarState extends State<Bottom_Navigation_Bar> {
  GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  final pages = [
    const Home_Screen(),
    const Subscription_Details(
      ltrValue: '1',
      ltrOptions: ["2"],
      isMore: false,
    ),
    My_Order_Screen(
      isMore: false,
    ),
    const CheckOut_Screen(),
  ];

  Future<bool> _onWillPop() async {
    // Check if navigator can pop
    if (_navigatorKey.currentState!.canPop()) {
      _navigatorKey.currentState!.pop();
      return false;
    }
    return false;
  }

  b(index) {
    setState(() {
      widget.select = index;
    });

    _navigatorKey.currentState!.pushReplacement(
      MaterialPageRoute(builder: (context) => getPage(index)),
    );
  }

  Widget getPage(int index) {
    switch (index) {
      case 0:
        return const Home_Screen();
      case 1:
        return const Subscription_Details(
          ltrValue: '1',
          ltrOptions: ["2"],
          isMore: false,
        );
      case 2:
        return My_Order_Screen(
          isMore: false,
        );
      case 3:
        return const CheckOut_Screen();
      default:
        return const Home_Screen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: Navigator(
          key: _navigatorKey,
          onGenerateRoute: (routeSettings) {
            return MaterialPageRoute(
              builder: (context) => getPage(widget.select),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.green.shade900,
            selectedLabelStyle: TextStyle(color: Colors.green.shade900),
            type: BottomNavigationBarType.fixed,
            items: const [
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
            ],
            currentIndex: widget.select,
            onTap: b,
          ),
        ),
      ),
    );
  }
}

// class Bottom_Navigation_Bar extends StatefulWidget {
//   int select;
//   Bottom_Navigation_Bar({super.key, required this.select});

//   @override
//   // State<Bottom_Navigation_Bar> createState() => _Bottom_Navigation_BarState();
//   Bottom_Navigation_BarState createState() => Bottom_Navigation_BarState();
// }

// class Bottom_Navigation_BarState extends State<Bottom_Navigation_Bar> {
//   GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

//   final pages = [
//     const Home_Screen(),
//     const Subscription_Details(
//       ltrValue: '1',
//       ltrOptions: ["2"],
//       isMore: false,
//     ),
//     My_Order_Screen(
//       isMore: false,
//     ),
//     const CheckOut_Screen(),
//   ];

//   b(index) {
//     setState(() {
//       widget.select = index;
//       _navigatorKey = GlobalKey<
//           NavigatorState>(); // Generate a new key to force the widget to rebuild
//     });

//     _navigatorKey.currentState!.pushReplacement(
//       MaterialPageRoute(builder: (context) => getPage(index)),
//     );
//   }

//   Widget getPage(int index) {
//     switch (index) {
//       case 0:
//         return const Home_Screen();
//       case 1:
//         return const Subscription_Details(
//           ltrValue: '1',
//           ltrOptions: ["2"],
//           isMore: false,
//         );
//       case 2:
//         return My_Order_Screen(
//           isMore: false,
//         );
//       case 3:
//         return const CheckOut_Screen();
//       default:
//         return const Home_Screen();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Navigator(
//         key: _navigatorKey,
//         onGenerateRoute: (routeSettings) {
//           return MaterialPageRoute(
//             builder: (context) => getPage(widget.select),
//           );
//         },
//       ),
//       bottomNavigationBar: Container(
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           ),
//         ),
//         child: ClipRRect(
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           ),
//           child: BottomNavigationBar(
//             backgroundColor: Colors.white,
//             selectedItemColor: Colors.green.shade900,
//             selectedLabelStyle: TextStyle(color: Colors.green.shade900),
//             type: BottomNavigationBarType.fixed,
//             items: const [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 activeIcon: Icon(Icons.home),
//                 label: "Home",
//               ),
//               BottomNavigationBarItem(
//                   activeIcon: Icon(Icons.list_alt_outlined),
//                   icon: Icon(Icons.list_alt_outlined),
//                   label: "Subscription"),
//               BottomNavigationBarItem(
//                   activeIcon: Icon(Icons.shopping_bag_sharp),
//                   icon: Icon(Icons.shopping_bag_sharp),
//                   label: "My Orders"),
//               BottomNavigationBarItem(
//                   activeIcon: Icon(Icons.shopping_cart),
//                   icon: Icon(Icons.shopping_cart),
//                   label: "Cart"),
//               // BottomNavigationBarItem(
//               //     activeIcon: _IconImg("package2.svg"),
//               //     icon: _IconImg("package1.svg"),
//               //     label: "Products"),
//             ],
//             currentIndex: widget.select,
//             onTap: b,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class BottomNavBarScreen extends StatefulWidget {
//   const BottomNavBarScreen({super.key});

//   @override
//   _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
// }

// class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
//   int _currentIndex = 0;

//   final List<Widget> _pages = [
//     Navigator(
//       onGenerateRoute: (settings) {
//         return MaterialPageRoute(
//           builder: (context) => const Home_Screen(),
//         );
//       },
//     ),
//     Navigator(
//       onGenerateRoute: (settings) {
//         return MaterialPageRoute(
//           builder: (context) => const Subscription_Details(
//             ltrValue: '1',
//             ltrOptions: ["2"],
//             isMore: false,
//           ),
//         );
//       },
//     ),
//     Navigator(
//       onGenerateRoute: (settings) {
//         return MaterialPageRoute(
//           builder: (context) => My_Order_Screen(
//             isMore: false,
//           ),
//         );
//       },
//     ),
//     Navigator(
//       onGenerateRoute: (settings) {
//         return MaterialPageRoute(
//           builder: (context) => const CheckOut_Screen(),
//         );
//       },
//     ),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         // ignore: deprecated_member_use
//         home: WillPopScope(
//             onWillPop: () async {
//               if (_currentIndex != 0) {
//                 setState(() {
//                   _currentIndex = 0;
//                 });
//                 return false;
//               }
//               return true;
//             },
//             child: Scaffold(
//               body: _pages[_currentIndex],
//               bottomNavigationBar: BottomNavigationBar(
//                 backgroundColor: Colors.white,
//                 selectedItemColor: Colors.green.shade900,
//                 unselectedItemColor: Colors.grey,
//                 selectedLabelStyle: TextStyle(color: Colors.green.shade900),
//                 type: BottomNavigationBarType.fixed,
//                 items: const [
//                   BottomNavigationBarItem(
//                     icon: Icon(Icons.home),
//                     label: "Home",
//                   ),
//                   BottomNavigationBarItem(
//                     icon: Icon(Icons.list_alt_outlined),
//                     label: "Subscription",
//                   ),
//                   BottomNavigationBarItem(
//                     icon: Icon(Icons.shopping_bag_sharp),
//                     label: "My Orders",
//                   ),
//                   BottomNavigationBarItem(
//                     icon: Icon(Icons.shopping_cart),
//                     label: "Cart",
//                   ),
//                 ],
//                 currentIndex: _currentIndex,
//                 onTap: _onItemTapped,
//               ),
//             )));
//   }
// }
