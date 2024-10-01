import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/Src/Contact_Us_Ui/Add_Help_Support.dart';
import 'package:vilfresh/utilits/ApiService.dart';

class Help_SupportList extends ConsumerStatefulWidget {
  const Help_SupportList({super.key});

  @override
  ConsumerState<Help_SupportList> createState() => _Help_SupportListState();
}

class _Help_SupportListState extends ConsumerState<Help_SupportList> {
  @override
  Widget build(BuildContext context) {
    final hsList = ref.watch(getHSListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Help and Support"),
        centerTitle: true,
      ),
      body: hsList.when(
        data: (data) {
          if (data?.data?.length == 0) {
            return Center(
                child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 300,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImgPathPng('nopreview.png'),
                    Text('Nothing here!'),
                    Text('No Data Founds')
                  ],
                ),
              ),
            ));
          } else {
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListView.builder(
                      itemCount: data?.data?.length ?? 0,
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
                                      text: 'Invoice No',
                                      text2: '${data?.data?[index].invoiceNo}'),
                                  Details(context,
                                      text: 'Item Details',
                                      text2:
                                          '${data?.data?[index].itemDetails}'),
                                  Details(context,
                                      text: 'Issue',
                                      text2: '${data?.data?[index].issue}'),
                                  Details(context,
                                      text: 'Status',
                                      text2: '${data?.data?[index].status}'),
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
            );
          }
        },
        error: (Object error, StackTrace stackTrace) {
          return Center(
              child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 300,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImgPathPng('nopreview.png'),
                  Text('Nothing here!'),
                  Text('You dont have any selected date')
                ],
              ),
            ),
          ));
        },
        loading: () => Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[900],
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Add_Help_Support()))
              .then((onValue) {
            if (onValue == true) {
              ref.refresh(getHSListProvider);
            }
          });
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
