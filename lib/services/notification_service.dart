import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:new_todo/models/task_model.dart';
import 'package:new_todo/utils/routes.dart';

import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  initNotification() async {
    _configureLocalTimeZone();
    const IOSInitializationSettings initIOSSettings = IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      //onDidReceiveLocalNotification: _onDidReceiveLocalNotification,
    );

    const AndroidInitializationSettings initAndroidSettings =
        AndroidInitializationSettings('appicon');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      iOS: initIOSSettings,
      android: initAndroidSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: _onSelectNotification,
    );
  }

  Future _onSelectNotification(String? payload) async {
    Get.toNamed(MyRoutes.getAllTasksPageRoute());
  }

  Future scheduleNotification(TaskModel task, int id) async {
    try {
      await _flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        task.title,
        task.description,
        _convertTime(task.time, task.date),
        const NotificationDetails(
            android: AndroidNotificationDetails("channelId", "channelName",
                importance: Importance.max,
                priority: Priority.max,
                enableVibration: true)),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
        //matchDateTimeComponents: DateTimeComponents.time,
        // FIZ ESSA ALTERAÇÃO PARA NOTIFICAÇÃO NO DIA CERTO
        matchDateTimeComponents: DateTimeComponents.dateAndTime, 
        payload: '$id', 
      );
    } catch (error) {
      print(error.toString());
    }
  }

  void requestIOSPermission() {
    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, badge: true, sound: true);
  }

  tz.TZDateTime _convertTime(time, datetask) {
    DateTime date = DateFormat.Hm().parse(time);
    var myTime = DateFormat.Hm().format(date);
    final int hour = int.parse(myTime.split(':')[0]);
    final int min = int.parse(myTime.split(':')[1]);

    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);

    String n1 = datetask;
    print(n1);
    String n2 = n1.substring(6, 10);
    print(n2);
    int n3 = int.parse(n2);

    String n4 = n1.substring(3, 5);
    print(n4);
    int n6 = int.parse(n4);

    String n5 = n1.substring(0, 2);
    print(n5);
    int n7 = int.parse(n5);

    tz.TZDateTime scheduleDate = tz.TZDateTime(tz.local, n3, n6, n7, hour, min);



    print(scheduleDate);
    print(tz.local);


    if (scheduleDate.isBefore(now)) {
      scheduleDate = scheduleDate.add(const Duration(days: 1));
    }
    return scheduleDate;
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String timezone = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timezone));
    print(timezone);
  }
}
