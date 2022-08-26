import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:new_todo/controllers/task_controller.dart';
import 'package:new_todo/utils/constants.dart';
import 'package:new_todo/utils/routes.dart';
import 'package:new_todo/widgets/create_task/custom_text_field.dart';
import 'package:new_todo/widgets/custom_button.dart';

import '../widgets/create_task/colors_pallet.dart';
import '../widgets/create_task/create_task_header.dart';

class CreateTaskPage extends StatelessWidget {
  CreateTaskPage({Key? key}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TaskController _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CreateTaskHeader(
                onSaved: _validateTextTitleDescription,
              ),
              kVerticalSpace(30),
              CustomTextField(
                controller: _titleController,
                label: 'Tarefa',
                hintText: 'Tarefa',
              ),
              Obx(() {
                final selectedDate = _taskController.selectedDate.value;
                final selectedTime = _taskController.selectedTime.value;
                return Row(
                  children: [
                    Flexible(
                      child: CustomTextField(
                        readOnly: true,
                        label: ('Data'),
                        hintText: DateFormat('dd/MM/yyyy').format(selectedDate),
                        onTap: () => _chooseDate(context),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: CustomTextField(
                        readOnly: true,
                        label: ('Horário'),
                        hintText: formattingTimeOfDay(selectedTime),
                        onTap: () => _chooseTime(context),
                      ),
                    ),
                  ],
                );
              }),
              CustomTextField(
                controller: _descriptionController,
                label: ('Descrição'),
                hintText: 'Descrição ...',
              ),
              Text('Cor', style: kTextStyleBoldBlack(20)),
              ColorsPallet(),
            ],
          ),
        ),
      ),
    );
  }

  _validateTextTitleDescription() {
    if (_titleController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty) {
      _createTask();
    } else {
      Get.defaultDialog(
        title: 'Campo vazio',
        middleText: 'Titulo e descrição da tarefa \nnão podem estar vazios',
        titleStyle: kTextStyleBoldBlack(24),
        cancel: CustomButton(
          onTap: () => Get.back(),
          label: 'OK',
          color: Get.isDarkMode
              ? Colors.amberAccent.withOpacity(0.3)
              : Colors.deepPurpleAccent.withOpacity(0.3),
        ),
        backgroundColor: Get.isDarkMode ? darkHeaderClr : white,
      );
    }
  }

  _createTask() async {
    final String title = _titleController.text;
    final String description = _descriptionController.text;
    _taskController.addTask(title, description).then((value) {
      Get.snackbar(
        'Tarafa salva',
        'Tarefa salva com sucesso',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.offAllNamed(MyRoutes.getHomeRoute());
    });
  }

  _chooseTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialEntryMode: TimePickerEntryMode.input,
      initialTime: TimeOfDay.now(),
       
      //initialTime: _taskController.selectedTime.value,
    );
    if (pickedTime != null) {
      _taskController.selectedTime.value = pickedTime;
    }
  }

  _chooseDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.calendar,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2050),
    );

    if (pickedDate != null) {
      _taskController.selectedDate.value = pickedDate;
    }
  }
}
