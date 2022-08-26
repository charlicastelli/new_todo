import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_todo/services/theme_services.dart';
import 'package:new_todo/utils/routes.dart';

import '../custom_button.dart';

class AllTaskHeader extends StatelessWidget {
  AllTaskHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Get.isDarkMode
                ? Colors.amberAccent.withOpacity(0.3)
                : Colors.deepPurpleAccent.withOpacity(0.3),
            borderRadius: BorderRadius.circular(25),
          ),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              size: 28,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Get.isDarkMode
                ? Colors.amberAccent.withOpacity(0.3)
                : Colors.deepPurpleAccent.withOpacity(0.3),
            borderRadius: BorderRadius.circular(25),
          ),
          child: IconButton(
            onPressed: () {
              ThemeService().switchThemeMode();
            },
            icon: Icon(
                Get.isDarkMode
                    ? Icons.wb_sunny_outlined
                    : Icons.nights_stay_rounded,
                size: 28,
                color: Get.isDarkMode ? Colors.white : Colors.black),
          ),
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Get.isDarkMode
                ? Colors.amberAccent.withOpacity(0.3)
                : Colors.deepPurpleAccent.withOpacity(0.3),
            borderRadius: BorderRadius.circular(25),
          ),
          child: IconButton(
            onPressed: () {
              Get.toNamed(
                MyRoutes.getCreateTaskRoute(),
              );
            },
            icon: Icon(
              Icons.add_task,
              size: 28,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
