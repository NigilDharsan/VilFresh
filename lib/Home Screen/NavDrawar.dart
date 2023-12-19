import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {

  var menuTitle = ["","Home","My Order","Topup Wallet","Wallet History","Subscription","Language","Refer & Earn","Help & Support","Terms & Condition",];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height - 100,
            child: ListView.builder(
                itemCount: menuTitle.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0)
                    {
                      return
                          DrawerHeader(
                            child: Text(
                              'Side menu',
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('assets/Test.JPG'))),
                          );
                    }
                  else
                    {
                      return ListTile(
                          leading: const Icon(Icons.list),

                          title: Text(menuTitle[index]));
                    }


                }),
          ),
          Container(height: 100,child: Text("Version 1.0",textAlign: TextAlign.left,),)
        ],
      ),


      // ListView(
      //   padding: EdgeInsets.zero,
      //   children: <Widget>[
      //     DrawerHeader(
      //       child: Text(
      //         'Side menu',
      //         style: TextStyle(color: Colors.white, fontSize: 25),
      //       ),
      //       decoration: BoxDecoration(
      //           color: Colors.green,
      //           image: DecorationImage(
      //               fit: BoxFit.fill,
      //               image: AssetImage('assets/images/cover.jpg'))),
      //     ),
      //     ListTile(
      //       leading: Icon(Icons.input),
      //       title: Text('Welcome'),
      //       onTap: () => {},
      //     ),
      //     ListTile(
      //       leading: Icon(Icons.verified_user),
      //       title: Text('Profile'),
      //       onTap: () => {Navigator.of(context).pop()},
      //     ),
      //     ListTile(
      //       leading: Icon(Icons.settings),
      //       title: Text('Settings'),
      //       onTap: () => {Navigator.of(context).pop()},
      //     ),
      //     ListTile(
      //       leading: Icon(Icons.border_color),
      //       title: Text('Feedback'),
      //       onTap: () => {Navigator.of(context).pop()},
      //     ),
      //     ListTile(
      //       leading: Icon(Icons.exit_to_app),
      //       title: Text('Logout'),
      //       onTap: () => {Navigator.of(context).pop()},
      //     ),
      //   ],
      // ),
    );
  }
}