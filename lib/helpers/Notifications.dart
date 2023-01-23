import 'package:daily5/models/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';





FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
const AndroidInitializationSettings initializationSettingsAndroid =
AndroidInitializationSettings('mipmap/launcher_icon');
const InitializationSettings initializationSettings = InitializationSettings(
  android: initializationSettingsAndroid,
);

class Notifications {


  Future<void>initialize(BuildContext context) async {
    void selectNotification(NotificationResponse notificationResponse) async {
      final String? payload = notificationResponse.payload;
      if (notificationResponse.payload != null) {
        debugPrint('notification payload: $payload');
      }
      await Navigator.push(
        context,
        MaterialPageRoute<void>(builder: (context) => bottomnavbar()),
      );
    }

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: selectNotification);
  }

  Future<void>setNotification({required DateTime time ,required  int id,required String wkto, required String? azan}) async {
    tz.initializeTimeZones();
    Duration duration = time.difference(DateTime.now());
    if(!duration.isNegative) {
      await flutterLocalNotificationsPlugin.zonedSchedule(
          id,
          'Waktu Solat $wkto telah masuk ',
          'Ayuh Tunaikan Solat Sekarang',
          tz.TZDateTime.now(tz.local).add(duration),
          const NotificationDetails(
              android: AndroidNotificationDetails(
            'App',
            'Poket Solat App',
            channelDescription: 'Azan untuk Solat',
                priority: Priority.max,
                importance: Importance.high,
            playSound: true,

          )),
          androidAllowWhileIdle: true,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime);
    }
  }

  cancelNotification(){
    flutterLocalNotificationsPlugin.cancelAll();
  }
}

class PrayerTimeWrapper {
  final String name;
  final bool reminderAble;

  PrayerTimeWrapper({required this.name, required this.reminderAble});
}

class NotificationPage extends StatelessWidget {
  final String payload;
  NotificationPage({Key? key, required this.payload}) : super(key: key);
  final Notifications notificationManager = Notifications();
  @override
  Widget build(BuildContext context) {
    notificationManager.initialize(context);
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text("$payload Time . Mari Solat")),
          ],
        ));
  }
}