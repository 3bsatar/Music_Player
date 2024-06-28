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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCCKCZv16JsW3gA9vO5Mt9gh8_Xo7MbR0I',
    appId: '1:922601439357:web:4261b165acb9c482113114',
    messagingSenderId: '922601439357',
    projectId: 'flutterproj-420dc',
    authDomain: 'flutterproj-420dc.firebaseapp.com',
    storageBucket: 'flutterproj-420dc.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBMmslyPbZP1pX1lYe4QL0OVgESKkY25CE',
    appId: '1:922601439357:android:cc6611a39b2025a2113114',
    messagingSenderId: '922601439357',
    projectId: 'flutterproj-420dc',
    storageBucket: 'flutterproj-420dc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCNhsYNE7kqAcl0NxdlNpITxSYm0V95MkU',
    appId: '1:922601439357:ios:7ef2541aa3f72125113114',
    messagingSenderId: '922601439357',
    projectId: 'flutterproj-420dc',
    storageBucket: 'flutterproj-420dc.appspot.com',
    iosBundleId: 'com.example.adhdProj',
  );
}