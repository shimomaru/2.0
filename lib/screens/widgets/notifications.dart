import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class Notif {
  static Future init(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInit = new AndroidInitializationSettings('mipmap/ic_launcher');
    var initSettings = new InitializationSettings(android: androidInit);
    await flutterLocalNotificationsPlugin.initialize(initSettings);
  }

  static Future showBigTextNotification({
    var id = 0,
    required String title,
    required String body,
    var payload,
    required FlutterLocalNotificationsPlugin fln,
  }) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'channelId',
      'channelName',
      playSound: true,
      //sound: RawResourceAndroidNotificationSound('notification'),
      importance: Importance.max,
      priority: Priority.high,
    );

    var not = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await fln.show(0, title, body, not);
  }
}
