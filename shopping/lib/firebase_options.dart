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
    apiKey: 'AIzaSyAqfo1DLmdPG6R_b9QcOTKMDR0sosxSFNM',
    appId: '1:955113780352:web:035e689b29a2c7d742e265',
    messagingSenderId: '955113780352',
    projectId: 'shopping-68358',
    authDomain: 'shopping-68358.firebaseapp.com',
    storageBucket: 'shopping-68358.appspot.com',
    measurementId: 'G-B0PNY4PH87',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCjuYZq6L-nr88DZwkGQl92dKI87TPglmc',
    appId: '1:955113780352:android:664a73a6b4e7e81d42e265',
    messagingSenderId: '955113780352',
    projectId: 'shopping-68358',
    storageBucket: 'shopping-68358.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDqak12SfUbQsdu4WwD4MlDKFmWdcPu6VI',
    appId: '1:955113780352:ios:c8c1c56599126b9c42e265',
    messagingSenderId: '955113780352',
    projectId: 'shopping-68358',
    storageBucket: 'shopping-68358.appspot.com',
    iosBundleId: 'com.example.shopping',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDqak12SfUbQsdu4WwD4MlDKFmWdcPu6VI',
    appId: '1:955113780352:ios:5ed00b11c8a84e8942e265',
    messagingSenderId: '955113780352',
    projectId: 'shopping-68358',
    storageBucket: 'shopping-68358.appspot.com',
    iosBundleId: 'com.example.shopping.RunnerTests',
  );
}
