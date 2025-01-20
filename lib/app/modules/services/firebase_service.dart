import 'dart:developer';

import 'package:disable_battery_optimization/disable_battery_optimization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:socket_new/app/modules/services/firebase_options.dart';
import 'package:socket_new/app/modules/services/notification_service.dart';

// class FirebaseService {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

//   Future<void> initializeFCM() async {
//     // Request permission
//     NotificationSettings settings =
//         await _firebaseMessaging.requestPermission();
//     print('User granted permission: ${settings.authorizationStatus}');

//     //generate fcm toekn
//     String? token = await getDeviceToken();
//     log('FCM token: $token');

//     // Handle foreground messages
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print('Message received: ${message.notification?.title}');
//     });

//     // Handle background and terminated messages
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print('Notification clicked!');
//     });
//   }

//   Future<void> disableBattaryOptimization() async {
//     DisableBatteryOptimization.showDisableAllOptimizationsSettings(
//         "Enable Auto Start",
//         "Follow the steps and enable the auto start of this app",
//         "Your device has additional battery optimization",
//         "Follow the steps and disable the optimizations to allow smooth functioning of this app");
//   }

//   Future<String?> getDeviceToken() async {
//     log('Getting device token');
//     log('Firebase messaging: $_firebaseMessaging');
//     return await _firebaseMessaging.getToken();
//   }
// }

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  debugPrint("Handling a background message: ${message.messageId}");
}

class FirebaseService {
  NotificationService notificationService = NotificationService();
  static String firebaseToken = "";

  /// Initialize Firebase App
  Future<void> initializeSetup() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      await setupFirebaseMessaging();

      // initialize notification service
      await notificationService.initNotification();
    } catch (e) {
      debugPrint("Error initializing Firebase: $e");
    }
  }

  /// setup firebase messaging and get token
  Future<void> setupFirebaseMessaging() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    await requestPermission(messaging);
    await FirebaseMessaging.instance.subscribeToTopic('all_users');
    debugPrint("Subscribed to all_users topic");

    firebaseToken = await messaging.getToken() ?? "";

    debugPrint("Firebase Token: $firebaseToken");

    //handle background notification
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    // refreshToken
    FirebaseMessaging.instance.onTokenRefresh.listen((event) {
      event.toString();
    });

    //handle foreground notification
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint("Handling a foreground message: ${message.messageId}");
      notificationService.showNotification(id: 1, title: "222", body: "body");
    });
  }

  Future<void> requestPermission(FirebaseMessaging messaging) async {
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );

    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}
