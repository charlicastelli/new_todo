import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_todo/utils/constants.dart';
import 'package:new_todo/widgets/all_tasks/all_task_header.dart';

import '../widgets/all_tasks/date_bar.dart';
import '../widgets/all_tasks/display_tasks.dart';

class AllTasksPage extends StatelessWidget {
  const AllTasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AllTaskHeader(),
              kVerticalSpace(30),
              DateBar(),
              kVerticalSpace(20),
              DisplayTasks(),
            ],
          ),
        ),
      ),
    );
  }
}
