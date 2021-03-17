import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushNotificationsManager {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> init() async {
    // notification setting - permission
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    String token2 = await messaging.getToken();


    print("token2 $token2");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.notification}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

// PushNotificationsManager._();
//
// factory PushNotificationsManager() => _instance;
// static final PushNotificationsManager _instance =
//     PushNotificationsManager._();
// final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
// bool _initialized = false;
//
// // .................
//
// FirebaseMessaging messaging = FirebaseMessaging.instance;
//
//
//
//
// Future<void> init() async {
//   if (!_initialized) {
//     // For iOS request permission first.
//     _firebaseMessaging.requestNotificationPermissions();
//     _firebaseMessaging.configure();
//
//     // For testing purposes print the Firebase Messaging token
//     String token = await _firebaseMessaging.getToken();
//     print("FirebaseMessaging token: $token");
//     prefs.setString(AppConstant.firebaseToken, token);
//     // GetStorage getStorage = GetStorage();
//     // getStorage.write(AppConstant.userUID, token);
//     _initialized = true;
//   }
//
//   _firebaseMessaging.configure(
//     onMessage: (Map<String, dynamic> message) async {
//       Get.snackbar(message['notification']['title'],message['notification']['body'],
//           snackPosition: SnackPosition.TOP,
//           backgroundColor: Colors.green[400],
//           colorText: Colors.white);
//       print("onMessage: $message");
//     },
//     onLaunch: (Map<String, dynamic> message) async {
//       print("onLaunch: $message");
//     },
//     onResume: (Map<String, dynamic> message) async {
//       print("onResume: $message");
//     },
//   );
// }
}
