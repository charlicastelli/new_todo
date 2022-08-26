import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_todo/utils/constants.dart';
import 'package:new_todo/utils/routes.dart';
import 'package:new_todo/widgets/home/app_bar.dart';
import 'package:new_todo/widgets/home/do_not_have_month_tasks.dart';
import 'package:new_todo/widgets/home/drawer.dart';

import '../controllers/setting_controller.dart';
import '../controllers/task_controller.dart';
import '../widgets/home/display_today_tasks.dart';
//import '../widgets/home/search_tasks.dart';
import '../widgets/home/show_task_status.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TaskController _taskController = Get.put(TaskController());
  final SettingsController _settingController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: context.theme.backgroundColor,
      drawer: MyDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyAppBar(
                pressToOpenDrawer: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
              kVerticalSpace(40),
              Obx(
                () {
                  final name = _settingController.username.value;
                  final tasks = _taskController.tasksList;
                  final tasksLength = _taskController.tasksLength;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${showGreeting()}, ${name.capitalize}',
                        style: kTextStyleBoldGrey(22.0),
                      ),
                      tasks.isEmpty
                          ? DoNotHaveMonthTasks()
                          : Text(
                              'Você tem $tasksLength tarefas neste mês!',
                              style: kTextStyleBoldBlack(30),
                            ),
                    ],
                  );
                },
              ),
              //kVerticalSpace(30),
              //SearchTasks(), // Widget pesquisar tarefas
              kVerticalSpace(30),
              ShowTaskStatus(),
              kVerticalSpace(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tarefas de hoje', style: kTextStyleBoldBlack(30)),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(
                        MyRoutes.getAllTasksPageRoute(),
                      );
                    },
                    child: Text('Ver tudo', style: kTextStyleBoldGrey(18)),
                  )
                ],
              ),
              DisplayTodayTasks(),
            ],
          ),
        ),
      ),
    );
  }
}
