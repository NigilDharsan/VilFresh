import 'package:flutter/material.dart';
import 'package:vilfresh/Src/Contact_Us_Ui/Add_Help_Support.dart';

class Help_SupportList extends StatefulWidget {
  const Help_SupportList({super.key});

  @override
  State<Help_SupportList> createState() => _Help_SupportListState();
}

class _Help_SupportListState extends State<Help_SupportList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help and Support"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListView.builder(
                itemCount: 7,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black45),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 10, bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Details(context,
                                text: 'Invoice No', text2: 'VF-563763578637'),
                            Details(context,
                                text: 'Item Details',
                                text2: 'Tomato - 1 kg - Rs.30\n21/09/2024'),
                            Details(context,
                                text: 'Issue',
                                text2: 'Didn\'t get the delivery yet.'),
                            Details(context,
                                text: 'Status', text2: 'Completed'),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[900],
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Add_Help_Support()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white60,
        ),
      ),
    );
  }
}

Widget Details(context, {required String text, required String text2}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: MediaQuery.sizeOf(context).width / 3.5,
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        Container(
            width: MediaQuery.sizeOf(context).width / 2, child: Text(text2)),
      ],
    ),
  );
}
