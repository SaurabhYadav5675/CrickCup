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
    apiKey: 'AIzaSyBTO_LlhgButvdJdcxBFIsBYOHjg2PWI5M',
    appId: '1:938555820626:web:670fbda4f78cb71b51ad8b',
    messagingSenderId: '938555820626',
    projectId: 'crick-cup',
    authDomain: 'crick-cup.firebaseapp.com',
    storageBucket: 'crick-cup.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBx-ygEAr0btI84vBvo8Sjuiboj9qhrtAE',
    appId: '1:938555820626:android:ee77e6a65f50522851ad8b',
    messagingSenderId: '938555820626',
    projectId: 'crick-cup',
    storageBucket: 'crick-cup.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCSisw9JVWBgVvtEhWVb4Nb9ullw7DbaqA',
    appId: '1:938555820626:ios:b2c91c91b75eb30151ad8b',
    messagingSenderId: '938555820626',
    projectId: 'crick-cup',
    storageBucket: 'crick-cup.appspot.com',
    iosBundleId: 'com.example.crickcup',
  );
}