// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyB5BdgAdOdcE09ooVhsT6CegL0shTCDKas',
    appId: '1:1097119011829:web:012f19d1b77b2502b4c6bc',
    messagingSenderId: '1097119011829',
    projectId: 'taskproject-8a487',
    authDomain: 'taskproject-8a487.firebaseapp.com',
    storageBucket: 'taskproject-8a487.appspot.com',
    measurementId: 'G-9MHY9WKNH6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDETGmofFaWRuAHpsuflkFkrUgD_lbgf0c',
    appId: '1:1097119011829:android:4fda62175a2d4ee9b4c6bc',
    messagingSenderId: '1097119011829',
    projectId: 'taskproject-8a487',
    storageBucket: 'taskproject-8a487.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCLHXVvmroZLyjtaa0Gi87CPyKATugrjH0',
    appId: '1:1097119011829:ios:4a05c66a3c0cd9f1b4c6bc',
    messagingSenderId: '1097119011829',
    projectId: 'taskproject-8a487',
    storageBucket: 'taskproject-8a487.appspot.com',
    iosBundleId: 'com.example.taskproject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCLHXVvmroZLyjtaa0Gi87CPyKATugrjH0',
    appId: '1:1097119011829:ios:4099a0c750aa5014b4c6bc',
    messagingSenderId: '1097119011829',
    projectId: 'taskproject-8a487',
    storageBucket: 'taskproject-8a487.appspot.com',
    iosBundleId: 'com.example.taskproject.RunnerTests',
  );
}
