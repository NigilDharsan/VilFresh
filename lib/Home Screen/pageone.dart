import 'package:flutter/material.dart';

class pageone extends StatefulWidget {
  const pageone({super.key});

  @override
  State<pageone> createState() => _pageoneState();
}

class _pageoneState extends State<pageone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.green,
        ),
        title: Text(
          'Categories',
          style: TextStyle(color: Colors.green),
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.green,
          )
        ],
      ),
      body: Container(
        color: Colors.green.shade50,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    height: 35,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Colors.greenAccent.shade100,
                        boxShadow: []),
                    child: Center(
                        child: Text(
                          "VF Basket",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Farm2Home',
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],
              ),
            ),
            Text(
              'Delivery on 20-12-2023',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 21),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: (MediaQuery.sizeOf(context).height - 280),
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            boxShadow: [],
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15),
                                bottom: Radius.circular(15))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Organic Pineapple",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Container(
                                      height: 100,
                                      width: 150,
                                      child: Image.asset(
                                          "lib/assets/Sunset.jpeg")),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                          width: 60,
                                          color: Colors.grey.shade100,
                                          child: Text(
                                            "1 Kg ",
                                            textAlign: TextAlign.center,
                                          )),
                                      Text(
                                        "   Approx Price ",
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        "28 - 28",
                                        textAlign: TextAlign.center,
                                      ),
                                      Container(
                                          height: 30,
                                          width: 80,
                                          color: Colors.grey.shade100,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Icon(Icons.add_a_photo),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "Add ",
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ))
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
