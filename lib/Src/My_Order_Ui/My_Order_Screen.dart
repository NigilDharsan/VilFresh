import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Common_Widgets/Common_Pop_Up.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/Model/OrderHistoryModel.dart';
import 'package:vilfresh/Src/Contact_Us_Ui/Help_Support_List.dart';
import 'package:vilfresh/Src/My_Order_Ui/OrderDetailsScreen.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Generic.dart';

class My_Order_Screen extends ConsumerStatefulWidget {
  final bool isMore;
  const My_Order_Screen({super.key, required this.isMore});

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
        actions: const [],
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
                        const Text('No Order!'),
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
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  //MY ORDER LIST
  Widget _myOrderList(OrderHistoryModel? orderData) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
      child: ListView.builder(
        itemCount: orderData?.data?.length ?? 0,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
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
                        text: 'Order ID',
                        text2: orderData?.data?[index].orderID ?? ''),
                    Details(context,
                        text: 'Ordered Date',
                        text2: orderData?.data?[index].orderedDate ?? ''),
                    Details(context,
                        text: 'Delivery Date',
                        text2: orderData?.data?[index].deliveryDate ?? ''),
                    Details(context,
                        text: 'Total Items',
                        text2: orderData?.data?[index].totalItems ?? ''),
                    const SizedBox(height: 10),
                    Row(
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
                                            headerID: orderData
                                                    ?.data?[index].headerID ??
                                                '',
                                          )));
                            },
                            child: const Text("View Item"),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  orderData?.data?[index].Rating == ""
                                      ? Colors.yellow
                                      : black1,
                              backgroundColor:
                                  orderData?.data?[index].Rating == ""
                                      ? green1
                                      : white6, // foreground
                            ),
                            onPressed: () {
                              orderData?.data?[index].Rating == ""
                                  ? showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Rateuspop(context,
                                            submitRate: (rate, remarks) async {
                                          final userRegisterApiService =
                                              ApiService(ref.read(dioProvider));

                                          Map<String, dynamic> formData = {
                                            "Header_ID": orderData
                                                    ?.data?[index].headerID ??
                                                '',
                                            "Rating": "$rate",
                                            "Remarks": remarks,
                                            "User_ID": SingleTon().user_id
                                          };

                                          final userRegisterResponse =
                                              await userRegisterApiService
                                                  .ratingSubmitApiService(
                                                      formData: formData);
                                          if (userRegisterResponse.status ==
                                              "true") {
                                            ShowToastMessage(
                                                userRegisterResponse.message ??
                                                    "");
                                            Navigator.pop(context, true);
                                            ref.refresh(OrderHistoryProvider);
                                          } else {
                                            ShowToastMessage(
                                                userRegisterResponse.message ??
                                                    "");
                                          }
                                        });
                                      },
                                    )
                                  : "";
                            },
                            child: orderData?.data?[index].Rating == ""
                                ? Text("Rate")
                                : Column(
                                    children: [
                                      Text(orderData?.data?[index].Rating ??
                                          "0.0"),
                                      AnimatedRatingStars(
                                        initialRating: double.parse(
                                            orderData?.data?[index].Rating ??
                                                "0.0"),
                                        minRating: 0,
                                        maxRating: 5,
                                        filledColor: Colors.amber,
                                        emptyColor: Colors.grey,
                                        filledIcon: Icons.star,
                                        emptyIcon: Icons.star_border,
                                        displayRatingValue: true,
                                        interactiveTooltips: true,
                                        customFilledIcon: Icons.star,
                                        customHalfFilledIcon: Icons.star,
                                        customEmptyIcon: Icons.star_border,
                                        starSize: 10.0,
                                        readOnly: true,
                                        onChanged: (double val) {},
                                      ),
                                    ],
                                  ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
    //   ListView.builder(
    //   itemCount: orderData?.data?.length ?? 0,
    //   itemBuilder: (context, index) {
    //     final order = orderData!.data![index];
    //     return Padding(
    //       padding: const EdgeInsets.all(10.0),
    //       child: Card(
    //         elevation: 3,
    //         child: Container(
    //           color: white1,
    //           child: Padding(
    //             padding: const EdgeInsets.all(16.0),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 buildOrderDetailRow("Order ID", order.orderID ?? ''),
    //                 SizedBox(height: 8),
    //                 buildOrderDetailRow("Ordered Date", order.orderedDate ?? ''),
    //                 SizedBox(height: 8),
    //                 buildOrderDetailRow(
    //                     "Delivery Date", order.deliveryDate ?? ''),
    //                 SizedBox(height: 8),
    //                 buildOrderDetailRow("Total Items", order.totalItems ?? ''),
    //                 SizedBox(height: 16),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   children: [
    //                     Expanded(
    //                       child: ElevatedButton(
    //                         style: ElevatedButton.styleFrom(
    //                           foregroundColor: Colors.yellow,
    //                           backgroundColor: green1, // foreground
    //                         ),
    //                         onPressed: () {
    //                           // Handle view item action
    //                           Navigator.push(
    //                               context,
    //                               MaterialPageRoute(
    //                                   builder: (context) => OrderDetailsScreen(
    //                                         headerID: order.headerID ?? '',
    //                                       )));
    //                         },
    //                         child: Text("View Item"),
    //                       ),
    //                     ),
    //                     SizedBox(width: 16),
    //                     Expanded(
    //                       child: ElevatedButton(
    //                         style: ElevatedButton.styleFrom(
    //                           foregroundColor: Colors.yellow,
    //                           backgroundColor: green1, // foreground
    //                         ),
    //                         onPressed: () {
    //                           showDialog(
    //                             context: context,
    //                             builder: (BuildContext context) {
    //                               return Rateuspop(context);
    //                             },
    //                           );
    //                         },
    //                         child: Text("Rate"),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     );
    //   },
    // );

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
      style: const TextStyle(
        color: Colors.black,
        fontFamily: 'Montserrat',
      ),
      children: [
        TextSpan(
          text: label, // Adds consistent padding after the label
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const TextSpan(
          text: " : ", // Adds the colon with space for even separation
        ),
        TextSpan(
          text: value,
          style: const TextStyle(fontWeight: FontWeight.normal),
        ),
      ],
    ),
  );
}
