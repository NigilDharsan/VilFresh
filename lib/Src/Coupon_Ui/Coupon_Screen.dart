import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Generic.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class Coupon_Screen extends ConsumerStatefulWidget {
  const Coupon_Screen({super.key});

  @override
  ConsumerState<Coupon_Screen> createState() => _Coupon_ScreenState();
}

class _Coupon_ScreenState extends ConsumerState<Coupon_Screen> {
  var formData = <String, dynamic>{};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DateTime now = DateTime.now();
    String formattedDate =
        "${now.year}/${now.month.toString().padLeft(2, '0')}/${now.day.toString().padLeft(2, '0')}";
    formData = <String, dynamic>{
      "Date": formattedDate,
    };
  }

  @override
  Widget build(BuildContext context) {
    final coupountsList = ref.watch(couponProvider(formData));
    return Scaffold(
        backgroundColor: backGround1,
        appBar: Custom_AppBar(
          title: 'Coupons',
          actions: null,
          isNav: true,
          isGreen: false,
        ),
        body: coupountsList.when(data: (data) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //COUPON LIST
                  ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      //physics: const NeverScrollableScrollPhysics(),
                      itemCount: data?.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: InkWell(
                            onTap: () {
                              storeCouponID(
                                  data?.data?[index].coupenID ?? "",
                                  data?.data?[index].coupenCode ?? "",
                                  data?.data?[index].rate ?? "");
                              Navigator.pop(
                                  context, data?.data?[index].coupenCode);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: white1),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, top: 20, bottom: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    //INSIDE COUPON
                                    Text(
                                      data?.data?[index].coupenCode ?? "",
                                      style: walletBalanceT,
                                    ),
                                    Text(
                                      data?.data?[index].rate ?? "",
                                      style: CouponT,
                                    ),
                                    Text(
                                      data?.data?[index].coupenDesc ?? "",
                                      style: CouponT,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      })
                ],
              ),
            ),
          );
        }, error: (error, _) {
          return const Text('ERROR');
        }, loading: () {
          return const Center(child: CircularProgressIndicator());
        }));
  }
}
