import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/Model/OrderHistoryModel.dart';
import 'package:vilfresh/Src/My_Order_Ui/OrderDetailsScreen.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';

class My_Order_Screen extends ConsumerStatefulWidget {
  final bool isMore;
  My_Order_Screen({super.key, required this.isMore});

  @override
  ConsumerState<My_Order_Screen> createState() => _My_Order_ScreenState();
}

class _My_Order_ScreenState extends ConsumerState<My_Order_Screen> {
  @override
  Widget build(BuildContext context) {
    final OrderHistoryData = ref.watch(OrderHistoryProvider);
    return Scaffold(
      backgroundColor: backGround1,
      appBar: Custom_AppBar(
        title: "My Order",
        actions: [],
        isNav: widget.isMore == true ? true : false,
        isGreen: false,
      ),
      body: OrderHistoryData.when(
        data: (OrderData) {
          return OrderData?.data == null
              ? Center(
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
                        Text('No Order!'),
                      ],
                    ),
                  ),
                ))
              : Padding(
                  padding: const EdgeInsets.only(bottom: 35),
                  child: _myOrderList(OrderData),
                );
        },
        error: (Object error, StackTrace stackTrace) {
          return Text(error.toString());
        },
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }

  //MY ORDER LIST
  Widget _myOrderList(OrderHistoryModel? orderData) {
    return ListView.builder(
      itemCount: orderData?.data?.length ?? 0,
      itemBuilder: (context, index) {
        final order = orderData!.data![index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: white1,
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildOrderDetailRow("Order_ID", order.orderID ?? ''),
                  SizedBox(height: 8),
                  buildOrderDetailRow("Ordered_Date", order.orderedDate ?? ''),
                  SizedBox(height: 8),
                  buildOrderDetailRow(
                      "Delivery_Date", order.deliveryDate ?? ''),
                  SizedBox(height: 8),
                  buildOrderDetailRow("Total_Items", order.totalItems ?? ''),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.yellow,
                            backgroundColor: green1, // foreground
                          ),
                          onPressed: () {
                            // Handle view item action
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrderDetailsScreen(
                                          headerID: order.headerID ?? '',
                                        )));
                          },
                          child: Text("View Item"),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.yellow,
                            backgroundColor: green1, // foreground
                          ),
                          onPressed: () {
                            // Handle rate action
                          },
                          child: Text("Rate"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    // ListView.builder(
    //     itemCount: orderData?.data?.length ?? 0,
    //     shrinkWrap: true,
    //     scrollDirection: Axis.vertical,
    //     physics: const NeverScrollableScrollPhysics(),
    //     itemBuilder: (BuildContext context, int index) {
    //       return InkWell(
    //         onTap: () {},
    //         child: Padding(
    //           padding: const EdgeInsets.only(bottom: 15),
    //           child: MyorderList(context,
    //               ProductImg: orderData?.data?[index].image ?? "",
    //               ProductName: orderData?.data?[index].itemName ?? "",
    //               Qnty: orderData?.data?[index].quantity ?? "",
    //               ProductRate: orderData?.data?[index].rate ?? "",
    //               DeliveredDate: orderData?.data?[index].date ?? ""),
    //         ),
    //       );
    //     });
  }
}

Widget buildOrderDetailRow(String label, String value) {
  return RichText(
    text: TextSpan(
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'Courier', // Using a monospaced font for alignment
      ),
      children: [
        TextSpan(
          text: label.padRight(15), // Adds consistent padding after the label
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextSpan(
          text: ": ", // Adds the colon with space for even separation
        ),
        TextSpan(
          text: value,
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
      ],
    ),
  );
}
