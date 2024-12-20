import 'package:flutter/material.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class OrderSuccess extends StatelessWidget {
  String? screenType = "";
  OrderSuccess({super.key, required this.screenType});

  void _delayedFunction(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      // Call your function here after 3 seconds
      Navigator.pop(context);

      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text('Timer Completed!')));
    });
  }

  @override
  Widget build(BuildContext context) {
    _delayedFunction(context); // Call the function with a delay

    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 250, child: ImgPathPng('orderPlace.png')),
            Text(
              screenType == ""
                  ? "Order placed Successfully"
                  : "Subscription placed successfully.",
              textAlign: TextAlign.center,
              style: SubT5,
            )
          ],
        ),
      ),
    );
  }
}
