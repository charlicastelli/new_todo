import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants.dart';
import '../../utils/routes.dart';

class DoNotHaveMonthTasks extends StatelessWidget {
   DoNotHaveMonthTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Você não tem tarefas para",
            style: kTextStyleBoldBlack(30),
          ),
          Row(
            children: [
              Text(
                "este mês ainda!",
                style: kTextStyleBoldBlack(30),
              ),
              Flexible(
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(MyRoutes.getCreateTaskRoute());
                  },
                  child: Text(
                    "Criar uma",
                    style: kTextStyleBoldAmber(20),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
