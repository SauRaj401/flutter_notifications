// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDpD9z4Q-Oy0yqpVU7P5xKfOD_8bsI92Ac',
    appId: '1:360263730002:android:248e23032430654198f08b',
    messagingSenderId: '269498193756',
    projectId: 'restaurantapp-50a04',
    authDomain: 'dharmakarma-kn.firebaseapp.com',
    storageBucket: 'dharmakarma-kn.appspot.com',
    measurementId: 'G-YMSBK42TPJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBtD52KNlrkIclCtd6g3xVfNwQdORWvP88',
    appId: '1:360263730002:android:248e23032430654198f08b',
    messagingSenderId: '360263730002',
    projectId: 'restaurantapp-50a04',
    storageBucket: 'restaurantapp-50a04.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB7DdEKN_BxER8vFW4w2MWNGZZAnrrAeYA',
    appId: '1:269498193756:ios:b65373bbd77f39c73ad399',
    messagingSenderId: '269498193756',
    projectId: 'dharmakarma-kn',
    storageBucket: 'dharmakarma-kn.appspot.com',
    iosBundleId: 'org.dharmakarman.dharmakarma',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB7DdEKN_BxER8vFW4w2MWNGZZAnrrAeYA',
    appId: '1:269498193756:ios:b65373bbd77f39c73ad399',
    messagingSenderId: '269498193756',
    projectId: 'dharmakarma-kn',
    storageBucket: 'dharmakarma-kn.appspot.com',
    iosBundleId: 'org.dharmakarman.dharmakarma',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDpD9z4Q-Oy0yqpVU7P5xKfOD_8bsI92Ac',
    appId: '1:269498193756:web:16b675c8966939c93ad399',
    messagingSenderId: '269498193756',
    projectId: 'dharmakarma-kn',
    authDomain: 'dharmakarma-kn.firebaseapp.com',
    storageBucket: 'dharmakarma-kn.appspot.com',
    measurementId: 'G-Q7QK97JGBJ',
  );
}
