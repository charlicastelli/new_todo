import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/setting_controller.dart';
import '../../utils/constants.dart';
import '../create_task/custom_text_field.dart';
import '../custom_button.dart';

class DisplayName extends StatelessWidget {
  DisplayName({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final SettingsController _settingController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    _nameController.text = _settingController.username.value;
    return Row(
      children: [
        Obx(() {
          return Text(
            _settingController.username.value,
            style: kTextStyleBoldBlack(24),
            maxLines: 1,
          );
        }),
        IconButton(
          onPressed: () => _showDialog(context),
          icon: const Icon(Icons.edit),
        ),
      ],
    );
  }

  _showDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          //backgroundColor: context.theme.backgroundColor,
          actionsAlignment: MainAxisAlignment.center,
          content: SizedBox(
            height: Get.height * 0.25,
            child: Column(
              children: [
                Text('Entre com seu nome', style: kTextStyleBoldBlack(20)),
                CustomTextField(
                  controller: _nameController,
                  label: '',
                  hintText: 'Escreva seu nome aqui...',
                ),
                CustomButton(
                  onTap: _saveNameToStorage,
                  label: 'Salvar',
                  color: Get.isDarkMode
                      ? Colors.amberAccent.withOpacity(0.3)
                      : Colors.deepPurpleAccent.withOpacity(0.3),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _saveNameToStorage() {
    if (_nameController.text.trim().isNotEmpty) {
      final name = _nameController.text.trim();
      _settingController.saveName(name);
      Get.back();
    } else {
      Get.snackbar(
        'O nome está vazio',
        "O nome não pode ficar vazio!",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
