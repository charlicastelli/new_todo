import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_todo/utils/constants.dart';

class CustomCircleContainer extends StatelessWidget {
  CustomCircleContainer({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? Colors.amberAccent.withOpacity(0.3)
            : Colors.deepPurpleAccent.withOpacity(0.3),
        borderRadius: BorderRadius.circular(25),
      ),
      child: child,
    );
  }
}
