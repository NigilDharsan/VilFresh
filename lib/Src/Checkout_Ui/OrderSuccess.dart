import 'package:flutter/material.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class OrderSuccess extends StatelessWidget {
  final Function(int) onSelection;

  OrderSuccess({super.key, required this.onSelection});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelection(2);
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height: 250, child: ImgPathPng('orderPlace.png')),
            Text(
              "Order placed Successfully",
              textAlign: TextAlign.center,
              style: SubT5,
            )
          ],
        ),
      ),
    );
  }
}
