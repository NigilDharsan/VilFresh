import 'package:flutter/material.dart';
import 'package:vilfresh/Home%20Screen/Daily_Subscription_Screen.dart';
import 'package:vilfresh/Src/Checkout_Ui/Checkout_Screen.dart';
import 'package:vilfresh/Src/Home_DashBoard_Ui/Home_DashBoard_Screen.dart';
import 'package:vilfresh/Src/My_Order_Ui/My_Order_Screen.dart';

class Bottom_Navigation_Bar extends StatefulWidget {
  int select;
  Bottom_Navigation_Bar({super.key, required this.select});

  @override
  // State<Bottom_Navigation_Bar> createState() => _Bottom_Navigation_BarState();
  _Bottom_Navigation_BarState createState() => _Bottom_Navigation_BarState();
}

class _Bottom_Navigation_BarState extends State<Bottom_Navigation_Bar> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);

  final pages = [
    Home_Screen(
      onSelection: (int) {
        print(int);
      },
    ),
    Subscription_Details(
      ltrValue: '1',
      ltrOptions: ["2"],
      isMore: false,
    ),
    My_Order_Screen(
      isMore: false,
    ),
    CheckOut_Screen(onSelection: (int) {
      print(int);
    }),
  ];

  b(index) {
    setState(() {
      widget.select = index;
    });

    _navigatorKey.currentState!.pushReplacement(
      MaterialPageRoute(builder: (context) => _getPage(index)),
    );
  }

  void _navigateToDetails() async {
    // Navigate to details screen and wait for the result
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Home_Screen(
          onSelection: (index) {
            setState(() {
              widget.select = index;
            });
          },
        ),
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return Home_Screen(
          onSelection: (int) {
            setState(() {
              widget.select = int;
            });
            _navigatorKey.currentState!.pushReplacement(
              MaterialPageRoute(builder: (context) => _getPage(int)),
            );
          },
        );
      case 1:
        return Subscription_Details(
          ltrValue: '1',
          ltrOptions: ["2"],
          isMore: false,
        );
      case 2:
        return My_Order_Screen(
          isMore: false,
        );
      case 3:
        return CheckOut_Screen(
          onSelection: (int) {
            setState(() {
              widget.select = int;
            });
            _navigatorKey.currentState!.pushReplacement(
              MaterialPageRoute(builder: (context) => _getPage(int)),
            );
          },
        );
      default:
        return Home_Screen(
          onSelection: (int) {
            setState(() {
              widget.select = index;
            });
          },
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _currentIndex,
        builder: (context, int index, _) {
          return WillPopScope(
              onWillPop: () async {
                // Handle the back button behavior
                if (index != 0) {
                  _currentIndex.value = 0;
                  return false; // Don't exit the app
                }
                return true;
              },
              child: Scaffold(
                body:
                    // Container(
                    //   height: MediaQuery.of(context).size.height,
                    //   child: pages[widget.select],
                    // ),
                    Navigator(
                  key: _navigatorKey,
                  onGenerateRoute: (routeSettings) {
                    return MaterialPageRoute(
                      builder: (context) => _getPage(widget.select),
                    );
                  },
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
                      selectedLabelStyle:
                          TextStyle(color: Colors.green.shade900),
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
              ));
        });
  }
}

class BottomNavBarScreen extends StatefulWidget {
  @override
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Home_Screen(
            onSelection: (int) {
              print(int);
            },
          ),
        );
      },
    ),
    Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Subscription_Details(
            ltrValue: '1',
            ltrOptions: ["2"],
            isMore: false,
          ),
        );
      },
    ),
    Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => My_Order_Screen(
            isMore: false,
          ),
        );
      },
    ),
    Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => CheckOut_Screen(onSelection: (int) {
            print(int);
          }),
        );
      },
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // ignore: deprecated_member_use
        home: WillPopScope(
            onWillPop: () async {
              if (_currentIndex != 0) {
                setState(() {
                  _currentIndex = 0;
                });
                return false;
              }
              return true;
            },
            child: Scaffold(
              body: _pages[_currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.white,
                selectedItemColor: Colors.green.shade900,
                unselectedItemColor: Colors.grey,
                selectedLabelStyle: TextStyle(color: Colors.green.shade900),
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.list_alt_outlined),
                    label: "Subscription",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_bag_sharp),
                    label: "My Orders",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    label: "Cart",
                  ),
                ],
                currentIndex: _currentIndex,
                onTap: _onItemTapped,
              ),
            )));
  }
}
