import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_todo/db/db_helper.dart';
import 'package:new_todo/services/theme_services.dart';
import 'package:new_todo/utils/constants.dart';
import 'package:new_todo/utils/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDatabase();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale("pt", "BR")],
      debugShowCheckedModeBanner: false,
      title: 'To Do App',
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      initialRoute: MyRoutes.getHomeRoute(),
      getPages: MyRoutes.routes,
    );
  }
}
