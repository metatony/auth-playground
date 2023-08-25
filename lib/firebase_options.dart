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
    apiKey: 'AIzaSyC3a6GQeV7yS4zIxrrquev892a-SXUp1sY',
    appId: '1:790054934554:web:e644abbeb33d52cb2f59a3',
    messagingSenderId: '790054934554',
    projectId: 'auth-playboook',
    authDomain: 'auth-playboook.firebaseapp.com',
    storageBucket: 'auth-playboook.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZ5Xz1zDvMForztdMeiS2kYP64a1uyOb8',
    appId: '1:790054934554:android:44564aba0d9c59f02f59a3',
    messagingSenderId: '790054934554',
    projectId: 'auth-playboook',
    storageBucket: 'auth-playboook.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAUuKiNDwzJxp3MLs12QMxrU7yOWe30NJA',
    appId: '1:790054934554:ios:a9c4393a2a88b9cc2f59a3',
    messagingSenderId: '790054934554',
    projectId: 'auth-playboook',
    storageBucket: 'auth-playboook.appspot.com',
    iosClientId: '790054934554-jhr5rpkpucbvnqp8pk51iv1lipr5n7bh.apps.googleusercontent.com',
    iosBundleId: 'com.example.authPlayground',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAUuKiNDwzJxp3MLs12QMxrU7yOWe30NJA',
    appId: '1:790054934554:ios:b0c76780463c8fda2f59a3',
    messagingSenderId: '790054934554',
    projectId: 'auth-playboook',
    storageBucket: 'auth-playboook.appspot.com',
    iosClientId: '790054934554-bulcokn3q087nbnuk20i9vig1d03jt6c.apps.googleusercontent.com',
    iosBundleId: 'com.example.authPlayground.RunnerTests',
  );
}
