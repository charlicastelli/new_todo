import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_todo/utils/constants.dart';
import '../custom_button.dart';

class CreateTaskHeader extends StatelessWidget {
  const CreateTaskHeader({Key? key, this.onSaved}) : super(key: key);

  final VoidCallback? onSaved;

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
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              size: 28,
              color: Get.isDarkMode ? white : Colors.black,
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
            onPressed: onSaved,
            icon: Icon(
              Icons.save_outlined,
              size: 28,
              color: Get.isDarkMode ? white : Colors.black,
            ),
          ),
        ),

        // CustomButton(
        //   onTap: onSaved,
        //   label: 'Salvar tarefa',
        // ),
      ],
    );
  }
}
