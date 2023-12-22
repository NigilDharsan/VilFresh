import 'package:flutter/material.dart';
class Daily_Subscription_Screen extends StatefulWidget {
  const Daily_Subscription_Screen({super.key});

  @override
  State<Daily_Subscription_Screen> createState() => _Daily_Subscription_ScreenState();
}

class _Daily_Subscription_ScreenState extends State<Daily_Subscription_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.green.shade900,),
        title: Text("Daily Subscription",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 22,color: Colors.green.shade900),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [
                Row(
                  children: [
                    Image.asset("lib/assets/onion1.png",height: 150,width: 150,),
                    Spacer(),
                    Column(
                      children: [
                        Text("Onion",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color: Colors.green.shade900),),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.green.shade100
                          ),
                          child: Text("      Buy Once     ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.green.shade500),),
                        )
                      ],
                    )
                  ],
                ),
              Container(
                decoration: BoxDecoration(borderRadius:BorderRadius.circular(5),color: Colors.green.shade100),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Daily Subscription",style:TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.green.shade700),),
                      Divider(
                        thickness: 2,
                        color: Colors.green.shade400,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text("Morning",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.green.shade500),),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:Colors.grey.shade400
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "  -    1 Kg    +  "
                                  ),
                                ),
                              )
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("Evening",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.green.shade500),),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:Colors.grey.shade400
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      "  -    1 Kg    +  "
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green.shade100
                ),
                child: Center(child: Text("Custom Subscription",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.green.shade700),)),
              ),
              SizedBox(height: 10,),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green.shade100
                ),
                child: Center(child: Text("Save",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.green.shade900),)),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Image.asset("lib/assets/onion1.png",height: 150,width: 150,),
                  Spacer(),
                  Column(
                    children: [
                      Text("Onion",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color: Colors.green.shade900),),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.green.shade100
                        ),
                        child: Text("      Buy Once     ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.green.shade500),),
                      )
                    ],
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(borderRadius:BorderRadius.circular(5),color: Colors.green.shade100),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Daily Subscription",style:TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.green.shade700),),
                      Divider(
                        thickness: 2,
                        color: Colors.green.shade400,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text("Morning",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.green.shade500),),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:Colors.grey.shade400
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      "  -    1 Kg    +  "
                                  ),
                                ),
                              )
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("Evening",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.green.shade500),),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:Colors.grey.shade400
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      "  -    1 Kg    +  "
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green.shade100
                ),
                child: Center(child: Text("Custom Subscription",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.green.shade700),)),
              ),
              SizedBox(height: 10,),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green.shade100
                ),
                child: Center(child: Text("Save",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.green.shade900),)),
              ),
              SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}
