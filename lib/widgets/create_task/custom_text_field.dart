import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_todo/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.controller,
      required this.label,
      required this.hintText,
      this.onTap,
      this.readOnly = false})
      : super(key: key);

  final TextEditingController? controller;
  final String label;
  final String hintText;
  final VoidCallback? onTap;
  final bool? readOnly;

  Icon? _getRightIcon() {
    if (label == 'Horário') {
      return const Icon(
        Icons.access_time_rounded,
        color: Colors.grey,
      );
    }
    if (label == 'Data') {
      return const Icon(
        Icons.date_range,
        color: Colors.grey,
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: kTextStyleBlack(20)),
        TextField(
          textCapitalization: TextCapitalization.sentences,
          readOnly: readOnly as bool,
          maxLines: label == 'Descrição' ? 5 : 1,
          controller: controller,
          style: kTextStyleBoldBlack(18),
          onTap: onTap,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(14),
            hintText: hintText,
            hintStyle: kTextStyleBoldGrey(16),
            suffixIcon: _getRightIcon(),
            border: InputBorder.none,
            enabledBorder: _borders(),
            focusedBorder: _borders(),
            disabledBorder: _borders(),
          ),
        ),
        kVerticalSpace(20),
      ],
    );
  }

  _borders() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        width: 1,
        color: Get.isDarkMode
            ? Colors.amberAccent.withOpacity(0.3)
            : Colors.deepPurpleAccent.withOpacity(0.3),
      ),
    );
  }
}
