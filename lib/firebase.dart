import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'my_channel', // id
  'My Channel', // title
  description: 'Important notifications from my server.', // description
  importance: Importance.high,
);

class FireBaseProvider extends StatefulWidget {
  const FireBaseProvider({Key? key}) : super(key: key);

  @override
  State<FireBaseProvider> createState() => _FireBaseProviderState();
}

class _FireBaseProviderState extends State<FireBaseProvider> {
  late FirebaseMessaging _firebaseMessaging;
  @override
  void initState() {
    super.initState();
    _firebaseMessaging = FirebaseMessaging.instance;
    _firebaseMessaging.getToken().then((value) {
      if (kDebugMode) {
        print(value);
      }
    });

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      final RemoteNotification notification = event.notification!;

      // AppleNotification apple = event.notification!.apple!;
      final AndroidNotification androidNotification =
          event.notification!.android!;
      // if (notification != null && androidNotification != null) {
      //   ///Show local notification
      //   sendNotification(title: notification.title!, body: notification.body);
      // }

      if (notification != null && androidNotification != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                icon: 'some_icon_in_drawable_folder',
              ),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void sendNotification({required String title, String? body}) {}
}
