import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_todo/utils/constants.dart';
import 'package:new_todo/utils/routes.dart';
import 'package:new_todo/widgets/custom_circle_container.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key, this.pressToOpenDrawer}) : super(key: key);

  final VoidCallback? pressToOpenDrawer;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCircleContainer(
          child: IconButton(
            onPressed: pressToOpenDrawer,
            icon: const Icon(Icons.menu_outlined),
          ),
        ),
        Text('Tarefas', style: kTextStyleBoldBlack(24)),
        CustomCircleContainer(
          child: IconButton(
            icon: Icon(
              Icons.add_task,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
            onPressed: () async {
              Get.toNamed(MyRoutes.getCreateTaskRoute());
            },
          ),
        ),
      ],
    );
  }
}
