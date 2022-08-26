import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_todo/controllers/task_controller.dart';
import 'package:new_todo/services/theme_services.dart';

import '../../utils/constants.dart';
import '../../utils/routes.dart';

class MyDrawer extends StatelessWidget {
  // CONVERTER PARA STATEFULL
  MyDrawer({Key? key}) : super(key: key);

  final TaskController _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.theme.backgroundColor,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  //bottomRight: Radius.circular(20),
                  //bottomLeft: Radius.circular(20)),),
                  ),
              color: Get.isDarkMode
                  ? Colors.amberAccent.withOpacity(0.3)
                  : bluishClr2,
            ),
            child: Center(
              child: Text(
                'By C.R.C',
                style: kTextStyleBoldBlack(24),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DrawerItem(
                  icon: Icons.home,
                  label: 'Home',
                  onPressed: () => Get.back(),
                ),
                kVerticalSpace(16),
                DrawerItem(
                  icon: Icons.favorite,
                  label: 'Favoritos',
                  onPressed: () {
                    _taskController.getTaskByStatus(TaskStatus.favoritos);
                    Get.toNamed(
                      MyRoutes.getTasksByStatusRoute(),
                      arguments: {"status": TaskStatus.favoritos},
                    );
                  },
                ),
                kVerticalSpace(16),
                DrawerItem(
                  icon: Icons.create,
                  label: 'Criar tarefa',
                  onPressed: () {
                    Get.toNamed(MyRoutes.getCreateTaskRoute());
                  },
                ),
                kVerticalSpace(16),
                DrawerItem(
                  icon: Icons.settings,
                  label: 'Configurações',
                  onPressed: () {
                    Get.toNamed(MyRoutes.getSettingsPageRoute());
                  },
                ),
                kVerticalSpace(16),
                DrawerItem(
                  icon: Get.isDarkMode
                      ? Icons.wb_sunny_outlined
                      : Icons.nights_stay_rounded,
                  label: Get.isDarkMode ? 'Tema claro' : 'Tema escuro',
                  onPressed: () {
                    ThemeService().switchThemeMode();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.icon,
    required this.label,
    this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Get.isDarkMode ? Colors.amberAccent : bluishClr2,
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: kTextStyleBlack(20),
          ),
        ],
      ),
    );
  }
}
