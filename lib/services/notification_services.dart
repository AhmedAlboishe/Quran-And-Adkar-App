// import 'package:categori/model/schedule_model.dart';
// import 'package:categori/ui/screens/schedule_screen.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import 'package:timezone/data/latest_all.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// class NotifyHelper {
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   initializationNotification() async {
//     tz.initializeTimeZones();
//     // tz.setLocalLocation(tz.getLocation(timeZoneName));

//     AndroidInitializationSettings initializationSettingsAndroid =
//         const AndroidInitializationSettings('icon');
//     DarwinInitializationSettings initializationSettingsDarwin =
//         DarwinInitializationSettings(
//       requestSoundPermission: false,
//       requestBadgePermission: false,
//       requestAlertPermission: false,
//       onDidReceiveLocalNotification: onDidReceiveLocalNotification,
//     );

//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsDarwin,
//     );
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse:
//             (NotificationResponse notificationResponse) {
//       onDidReceiveNotificationResponse();
//     });
//   }

//   void onDidReceiveNotificationResponse() async {
//     // await Get.to(const HomeScreen());
//     await Get.to(
//       const ScheduleScreen(),
//       // transition: Transition.cupertino,
//     );
//   }

//   displayNotification({required String title, required String body}) async {
//     const AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails('your channel id', 'جدولي',
//             channelDescription: 'your channel description',
//             importance: Importance.max,
//             priority: Priority.high,
//             ticker: 'ticker');

//     const DarwinNotificationDetails iosNotificationDetails =
//         DarwinNotificationDetails();

//     const NotificationDetails notificationDetails = NotificationDetails(
//         android: androidNotificationDetails, iOS: iosNotificationDetails);

//     await flutterLocalNotificationsPlugin
//         .show(0, title, body, notificationDetails, payload: 'item x');
//   }

//   cancelNotification(Schedule schedule) async {
//     await flutterLocalNotificationsPlugin.cancel(schedule.id!);
//     // debugPrint(
//     // 'canceled Notification for task  ==> ${schedule.id} title --> ${schedule.subjectName}');
//   }

//   cancelAllNotification() async {
//     await flutterLocalNotificationsPlugin.cancelAll();
//     // log('canceled All Notification--> Done');
//   }

//   scheduledNotification({required Schedule schedule}) async {
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       schedule.id!,
//       'أقترب وقت المحاضرة',
//       'ستبدأ محاضرة ${schedule.subjectName} بعد ساعة في ${schedule.place}',
//       // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
//       _nextInstanceOfTenAM(
//           // hour, minutes,
//           schedule),

//       NotificationDetails(
//         android: AndroidNotificationDetails(
//           'your channel id',
//           'الجدول',
//           channelDescription: 'الجدول الدراسي',
//           importance: Importance.high,
//           priority: Priority.high,
//           styleInformation: BigTextStyleInformation(
//               'ستبدأ محاضرة ${schedule.subjectName} بعد ساعة في ${schedule.place}'),
//         ),
//       ),
//       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
//     );
//   }

//   tz.TZDateTime _nextInstanceOfTenAM(
//       // int hour, int minutes,
//       Schedule schedule) {
//     // final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
//     var libya = tz.getLocation('Libya');
//     var now = tz.TZDateTime.now(libya);
//     // debugPrint('$now is now');
//     int hour, minutes = 00;
//     if (schedule.classTime == 'الفترة الأولى') {
//       hour = 8;
//     } else if (schedule.classTime == 'الفترة الثانية') {
//       hour = 10;
//     } else if (schedule.classTime == 'الفترة الثالثة') {
//       hour = 12;
//     } else {
//       hour = 14;
//     }
//     // إذا كان يوم الدرس اليوم، فلا تحتاج لتأخير أسبوع
//     if (now.weekday == schedule.day! + 1 && now.hour < hour) {
//       tz.TZDateTime scheduledDate =
//           tz.TZDateTime(libya, now.year, now.month, now.day, hour, minutes);
//       // debugPrint('final scheduledDate = $scheduledDate\n$now <<- now  ++\n ');
//       return scheduledDate;
//     }

//     // إذا كان الدرس في الأيام اللاحقة من الأسبوع
//     tz.TZDateTime scheduledDate =
//         tz.TZDateTime(libya, now.year, now.month, now.day, hour, minutes);
//     while (scheduledDate.weekday != schedule.day! + 1) {
//       // log('schedule.day!.index+1 ${schedule.day! + 1}\nscheduledDate.weekday ${scheduledDate.weekday} ');
//       scheduledDate = scheduledDate.add(const Duration(days: 1));
//       // log('$scheduledDate <<<=${scheduledDate.weekday}');
//       // print('object');
//     }
//     if (scheduledDate.isBefore(now)) {
//       scheduledDate = tz.TZDateTime(
//           libya, now.year, now.month, (now.day) + 7, hour, minutes);
//     }
//     // log('$scheduledDate <<<=**');
//     return scheduledDate;
//   }

//   requestIOSPermissions() {
//     flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             IOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//           sound: true,
//           alert: true,
//           badge: true,
//           provisional: true,
//           critical: true,
//         );
//     flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.requestNotificationsPermission();
//   }

// //older ios
//   void onDidReceiveLocalNotification(
//       int id, String? title, String? body, String? payload) async {
//     // await Get.to(const HomeScreen());
//     await Get.to(
//       const ScheduleScreen(),
//       // transition: Transition.cupertino,
//     );
//   }
// }
