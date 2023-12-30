import 'package:flutter/material.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';

class NavDrawer extends StatelessWidget {
  var menuTitle = [
    "",
    "Home",
    "My Order",
    "Topup Wallet",
    "Wallet History",
    "Subscription",
    "Language",
    "Refer & Earn",
    "Help & Support",
    "Terms & Condition",
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor:white1,
      child: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height - 130,
            child: ListView.builder(
                itemCount: menuTitle.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return DrawerHeader(
                      child: Text(
                        'Side menu',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('lib/assets/Sunset.jpeg'))),
                    );
                  } else {
                    return ListTile(
                        leading: const Icon(Icons.list),
                        title: Text(menuTitle[index]));
                  }
                }),
          ),
          Container(
            height: 70,
            child: Text(
              "Version 1.0",
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }
}
