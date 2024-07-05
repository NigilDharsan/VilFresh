import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Common_Widgets/Common_List.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Model/OrderHistoryModel.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';

class My_Order_Screen extends ConsumerStatefulWidget {
  const My_Order_Screen({super.key});

  @override
  ConsumerState<My_Order_Screen> createState() => _My_Order_ScreenState();
}

class _My_Order_ScreenState extends ConsumerState<My_Order_Screen> {
  @override
  Widget build(BuildContext context) {
    final OrderHistoryData = ref.watch(OrderHistoryProvider);
    return Scaffold(
      backgroundColor: backGround1,
      appBar: Custom_AppBar(title: "My Order", actions: [], isNav: true, isGreen: false,),
      body:OrderHistoryData.when(data: (OrderData){
        return  Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 35),
                  child: _myOrderList(OrderData),
                ),
              ],
            ),
          ),
        );
      },
        error: (Object error, StackTrace stackTrace) {
          return Text(error.toString());
        },
        loading: () =>
            Center(child: CircularProgressIndicator()),),

    );
  }
  //MY ORDER LIST
Widget _myOrderList(OrderHistoryModel? orderData){
  return ListView.builder(
      itemCount:  orderData?.data?.length ?? 0,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      // physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index){
        return InkWell(
          onTap:(){
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: MyorderList(
                context,
                ProductImg: orderData?.data?[index].image ?? "",
                ProductName: orderData?.data?[index].itemName ?? "",
                Qnty: orderData?.data?[index].variantName ?? "",
                ProductRate: orderData?.data?[index].rate ?? "",
                DeliveredDate: orderData?.data?[index].date ?? ""),
          ),
        );
      });
}
}
