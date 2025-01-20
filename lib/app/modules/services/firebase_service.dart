import 'package:disable_battery_optimization/disable_battery_optimization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initializeFCM() async {
    // Request permission
    NotificationSettings settings =
        await _firebaseMessaging.requestPermission();
    print('User granted permission: ${settings.authorizationStatus}');

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Message received: ${message.notification?.title}');
    });

    // Handle background and terminated messages
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Notification clicked!');
    });
  }

  Future<void> disableBattaryOptimization() async {
    DisableBatteryOptimization.showDisableAllOptimizationsSettings(
        "Enable Auto Start",
        "Follow the steps and enable the auto start of this app",
        "Your device has additional battery optimization",
        "Follow the steps and disable the optimizations to allow smooth functioning of this app");
  }

  Future<String?> getDeviceToken() async {
    return await _firebaseMessaging.getToken();
  }
}
