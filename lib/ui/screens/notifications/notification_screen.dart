// // import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/material.dart';

// import 'package:quran/ui/screens/notifications/model/notification_model.dart';
// import 'package:quran/ui/size_config.dart';

// import '../../../services/notification_services.dart';
// import '../settings/widgets/list_tile.dart';

// class NotificationScreen extends StatefulWidget {
//   const NotificationScreen({super.key});

//   @override
//   State<NotificationScreen> createState() => _NotificationScreenState();
// }

// NotifiModel notifiModel = NotifiModel();
// // NotifyHelper notifyHelper = NotifyHelper();

// class _NotificationScreenState extends State<NotificationScreen> {
//   // void scheduleHourlyNotification(int id, String? title, String? body) async {
//   //   int interval = 3600; // تكرار الإشعار كل 3600 ثانية أي كل 60 دقيقة
//   //   String timeZone = await AwesomeNotifications().getLocalTimeZoneIdentifier();
//   //   print(timeZone);
//   //   AwesomeNotifications().createNotification(
//   //     content: NotificationContent(
//   //       id: id,
//   //       channelKey: 'basic_channel',
//   //       title: title,
//   //       body: body,
//   //     ),
//   //     schedule: NotificationInterval(
//   //       interval: interval,
//   //       timeZone: timeZone,
//   //       repeats: true,
//   //     ),
//   //   );
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'التنبيهات',
//           style: TextStyle(
//               fontSize: getProportionateScreenWidth(15),
//               fontWeight: FontWeight.w700),
//         ),
//       ),
//       body: Column(
//         children: [
//           CusListTile(
//             title: 'الإستغفـار',
//             onTap: () async {
//               notifiModel
//                 ..id = 15
//                 ..title = 'مُنبه الُاستْغًفَار'
//                 ..body =
//                     'أستغفِرُ اللهَ، الذي لا إله إلا هو، الحَيَّ القيومَ، وأتوبُ إليه';
//               // await AwesomeNotifications().dismissAllNotifications();
//               await NotifyHelper().cancelAllNotification();
//               // NotifyHelper().scheduledNotification(notifi: notifiModel);
//               NotifyHelper().periodicallyShowNotification(
//                   title: notifiModel.title!, body: notifiModel.body!);
//               // Future.delayed(const Duration(seconds: 5), () {
//               //   NotifyHelper().displayNotification(
//               //       title: 'show ${notifiModel.title}',
//               //       body: '${notifiModel.body}');
//               // });
//               // notifyHelper.scheduledNotification(notifi: notifiModel);
//               // AwesomeNotifications().createNotification(
//               //     // schedule: NotificationAndroidCrontab.hourly(
//               //     //   referenceDateTime: DateTime.now()
//               //     //       .copyWith(minute: 00, second: 00, millisecond: 00),
//               //     //   allowWhileIdle: true,
//               //     // ),
//               //     schedule: NotificationInterval(
//               //       interval: 60,
//               //       repeats: true,
//               //       timeZone: 'Libya',
//               //       allowWhileIdle: true,
//               //     ),
//               //     content: NotificationContent(
//               //       id: 1,
//               //       channelKey: 'basic_channel',
//               //       actionType: ActionType.Default,
//               //       title: notifiModel.title,
//               //       body: notifiModel.body,
//               //       fullScreenIntent: true,
//               //       wakeUpScreen: true,
//               //       // roundedLargeIcon: true,
//               //     ));
//               // scheduleHourlyNotification(
//               //     5, notifiModel.title, notifiModel.body);
//               print('${notifiModel
//                 ..id
//                 ..title} done  ${DateTime.now().copyWith(hour: 17, minute: 05, millisecond: 00)}');
//             },
//             trailing: Switch(
//               value: true,
//               onChanged: (value) {},
//             ),
//             icon: Icons.mosque_outlined,
//           ),
//           // CusListTile(onTap: () {}, title: 'التنبيهات', icon: Icons.alarm),
//         ],
//       ),
//     );
//   }
// }
