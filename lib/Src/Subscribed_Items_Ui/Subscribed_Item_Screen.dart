import 'package:flutter/material.dart';
import 'package:vilfresh/Src/Subscribed_Items_Ui/Subscribed_Details_Screen.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class Subscribed_Item_Screen extends StatefulWidget {
  const Subscribed_Item_Screen({super.key});

  @override
  State<Subscribed_Item_Screen> createState() => _Subscribed_Item_ScreenState();
}

class _Subscribed_Item_ScreenState extends State<Subscribed_Item_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        toolbarHeight: 40,
        backgroundColor: Colors.green.shade100,
        centerTitle:true ,
        title: Text("Subscribed Items", style: subscribedapp),
      ),
      backgroundColor: backGround1,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 5,top: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black, width: 1),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                                image: AssetImage("lib/assets/Sunset.jpeg"))
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("A1 Milk - 500 ML",style: subscribedHT,),
                              const SizedBox(height: 5),
                              Text("26/07/2024 - 30/08/2024",style: subscribedHT,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Subscribed_Details_Screen()));
                                    },
                                    child: Container(
                                      color: green3,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 35, right: 35, top: 5, bottom: 5),
                                        child: Text("Edit",style: subscribedHT,),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.orangeAccent,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 35, right: 35, top: 5, bottom: 5),
                                      child: Text("Cancel",style: subscribedHT,),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
