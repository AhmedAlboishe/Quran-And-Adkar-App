import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:quran/ui/screens/home/home_screen.dart';
import 'package:quran/ui/screens/notifications/model/notification_model.dart';
import 'package:quran/ui/screens/quran/quran_screen.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotifyHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  initializationNotification() async {
    tz.initializeTimeZones();
    // tz.setLocalLocation(tz.getLocation(timeZoneName));

    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('icon');
    DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) {
      onDidReceiveNotificationResponse();
    });
  }

  void onDidReceiveNotificationResponse() async {
    // await Get.to(const HomeScreen());
    await Get.to(
      const HomeScreen(),
      // transition: Transition.cupertino,
    );
  }

  displayNotification({required String title, required String body}) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('your channel id', 'التنبيهات',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const DarwinNotificationDetails iosNotificationDetails =
        DarwinNotificationDetails();
    const NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);
    await flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails, payload: 'item x');
  }

  periodicallyShowNotification(
      {required String title, required String body}) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('your channel id', 'التنبيهات',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const DarwinNotificationDetails iosNotificationDetails =
        DarwinNotificationDetails();
    const NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);
    await flutterLocalNotificationsPlugin.periodicallyShow(
        0, title, body, RepeatInterval.hourly, notificationDetails,
       androidScheduleMode:AndroidScheduleMode.exactAllowWhileIdle  );
  }

  cancelNotification(NotifiModel notifi) async {
    await flutterLocalNotificationsPlugin.cancel(notifi.id!);
    // debugPrint(
    // 'canceled Notification for task  ==> ${schedule.id} title --> ${schedule.subjectName}');
  }

  Future<void> cancelAllNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
    // log('canceled All Notification--> Done');
  }

  scheduledNotification({required NotifiModel notifi}) async {
    // await flutterLocalNotificationsPlugin.zonedSchedule(
    //   10, // id
    //   'عنوان الإشعار', // العنوان
    //   'نص الإشعار', // النص
    //   tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)), // وقت العرض
    //   NotificationDetails(
    //     android: AndroidNotificationDetails(
    //       'id',
    //       'التنبيهات',
    //       channelDescription: 'التنبيهات',
    //       importance: Importance.high,
    //       priority: Priority.high,
    //       styleInformation: BigTextStyleInformation(notifi.body!),
    //     ),
    //   ),
    //   // السماح بالإشعارات في وضع الخمول
    //   uiLocalNotificationDateInterpretation:
    //       UILocalNotificationDateInterpretation.absoluteTime,
    // );
    // // await flutterLocalNotificationsPlugin.periodicallyShow(
    //   notifi.id!,
    //   notifi.title,
    //   notifi.body,
    //   RepeatInterval.everyMinute,
    //   NotificationDetails(
    //     android: AndroidNotificationDetails(
    //       'id',
    //       'التنبيهات',
    //       channelDescription: 'التنبيهات',
    //       importance: Importance.high,
    //       priority: Priority.high,
    //       styleInformation: BigTextStyleInformation(notifi.body!),
    //     ),
    //   ),
    //   payload: 'item x',
    // );
    //******** */
    // await flutterLocalNotificationsPlugin.zonedSchedule(
    //   notifi.id!,
    //   notifi.title,
    //   notifi.body,
    //   // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
    //   _nextInstanceOfTenAM(notifi),
    //   NotificationDetails(
    //     android: AndroidNotificationDetails(
    //       'id',
    //       'التنبيهات',
    //       channelDescription: 'التنبيهات',
    //       importance: Importance.high,
    //       priority: Priority.high,
    //       styleInformation: BigTextStyleInformation(notifi.body!),
    //     ),
    //   ),
    //   androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    //   uiLocalNotificationDateInterpretation:
    //       UILocalNotificationDateInterpretation.absoluteTime,
    //   // matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    //   matchDateTimeComponents: DateTimeComponents.time,
    // );
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            'repeating channel id', 'repeating channel name',
            channelDescription: 'repeating description');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.periodicallyShow(
      0,
      'repeating title',
      'repeating body',
      RepeatInterval.everyMinute,
      notificationDetails,
    );
    await flutterLocalNotificationsPlugin.zonedSchedule(
      notifi.id!,
      '${notifi.title}',
      '${notifi.body}',
      // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
      _nextInstanceOfTenAM(notifi),

      NotificationDetails(
        android: AndroidNotificationDetails(
          'your channel id',
          'الجدول',
          channelDescription: 'الجدول الدراسي',
          importance: Importance.high,
          priority: Priority.high,
          styleInformation: BigTextStyleInformation(
            '${notifi.body}',
          ),
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  tz.TZDateTime _nextInstanceOfTenAM(NotifiModel notifi) {
    // {final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    // var libya = tz.getLocation('Libya');
    // var now = tz.TZDateTime.now(libya);
    // debugPrint('$now is now');
    // int hour, minutes = 00;
    // hour = 14;
    // إذا كان يوم الدرس اليوم، فلا تحتاج لتأخير أسبوع
    // if (now.weekday == schedule.day! + 1 && now.hour < hour) {
    //   tz.TZDateTime scheduledDate =
    //       tz.TZDateTime(libya, now.year, now.month, now.day, hour, minutes);
    //   // debugPrint('final scheduledDate = $scheduledDate\n$now <<- now  ++\n ');
    //   return scheduledDate;
    // }
    // إذا كان الدرس في الأيام اللاحقة من الأسبوع
    // tz.TZDateTime scheduledDate =
    //     tz.TZDateTime(libya, now.year, now.month, now.day, now.hour, 13);
    // while (scheduledDate.weekday != schedule.day! + 1) {
    //   // log('schedule.day!.index+1 ${schedule.day! + 1}\nscheduledDate.weekday ${scheduledDate.weekday} ');
    //   scheduledDate = scheduledDate.add(const Duration(days: 1));
    //   // log('$scheduledDate <<<=${scheduledDate.weekday}');
    //   // print('object');
    // }
    // if (scheduledDate.isBefore(now)) {
    //   scheduledDate =
    //       tz.TZDateTime(libya, now.year, now.month, now.day, (now.hour), 11);
    // }
    var now = tz.TZDateTime.now(tz.local);
    print('${tz.local} + $now');
    var scheduledDate = tz.TZDateTime(
        tz.local, now.year, now.month, now.day, now.hour, (now.minute) + 1);
    if (scheduledDate.isBefore(now)) {
      log('is before now');
    }

    log('$scheduledDate <<<=**');
    return scheduledDate;
  }

  requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          sound: true,
          alert: true,
          badge: true,
          provisional: true,
          critical: true,
        );
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

//older ios
  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    // await Get.to(const HomeScreen());
    await Get.to(
      const HomeScreen(),
      // transition: Transition.cupertino,
    );
  }
}
