import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

enum SocialMedia {
  linkedIn(FontAwesomeIcons.linkedin),
  twitter(FontAwesomeIcons.twitter),
  github(FontAwesomeIcons.github),
  instagram(FontAwesomeIcons.instagram);

  final IconData icon;
  const SocialMedia(this.icon);
}

enum TaskStatus {
  tarefas(Icons.assignment, Colors.pink),
  progresso(Icons.incomplete_circle, bluishClr),
  concluido(Icons.done, Colors.green),
  favoritos(Icons.favorite, Colors.red);

  final IconData icon;
  final Color color;
  const TaskStatus(this.icon, this.color);
}

TextStyle kTextStyleGrey(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle:
        TextStyle(fontSize: size, color: Get.isDarkMode ? white : Colors.grey),
  );
}

TextStyle kTextStyleWhite(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle: TextStyle(fontSize: size, color: Colors.white),
  );
}

TextStyle kTextStyleBlack(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle: TextStyle(
      fontSize: size,
      color: Get.isDarkMode ? white : Colors.black,
    ),
  );
}

TextStyle kTextStyleBoldGrey(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle: TextStyle(
      fontSize: size,
      color: Get.isDarkMode ? white : Colors.grey,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle kTextStyleBoldBlack(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle: TextStyle(
      fontSize: size,
      color: Get.isDarkMode ? white : Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle kTextStyleBoldAmber(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle: TextStyle(
      fontSize: size,
      color: Colors.amber,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle kTextStyleBoldWhite(double size) {
  return GoogleFonts.arimaMadurai(
    textStyle: TextStyle(
      fontSize: size,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget kVerticalSpace(double height) => SizedBox(height: height);

const List<Color> colors = [
  Color(0xFFFF5DCD),
  Color(0xFFFE6197),
  Color(0xFFff4667),
  Color(0xFF4e5ae8),
  Color(0xFF6448FE),
  Color(0xFFFFB746),
  Colors.teal,
  Colors.green,
  Colors.blue,
  Color(0xFF61A3FE),
  Color(0xFF2D2F41),
  Color(0xFF424242),
  Color(0xFF444974),
];

String showGreeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Bom dia';
  } else if (hour < 18) {
    return 'Boa tarde';
  } else if (hour > 18 && hour < 24) {
    return 'Boa noite';
  }
  return 'Boa noite';
}

String formattingTimeOfDay(TimeOfDay timeOfDay) {
  final now = DateTime.now();
  final date = DateTime(
    now.year,
    now.month,
    now.day,
    timeOfDay.hour,
    timeOfDay.minute,
  );
  final format = DateFormat.Hm();
  return format.format(date);
}

const primaryClr = Colors.amber;
const Color darkGreyClr = Color(0xFF121212);
Color darkHeaderClr = const Color(0xFF424242);
const Color bluishClr = Color(0xFF4e5ae8);
const Color bluishClr2 = Color.fromARGB(255, 153, 161, 248);
const Color yellowClr = Color(0xFFFFB746);

const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;

class Themes {
  static final light = ThemeData(
      backgroundColor: Colors.white,
      primaryColor: primaryClr,
      brightness: Brightness.light);

  static final dark = ThemeData(
      backgroundColor: darkGreyClr,
      primaryColor: darkGreyClr,
      brightness: Brightness.dark);
}
