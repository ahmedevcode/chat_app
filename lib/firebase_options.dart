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
    apiKey: 'AIzaSyD40iomNKzoCJsFmiWIwykynhKCVDDKmVI',
    appId: '1:526787315268:web:49c507d0bc6e2c555fde11',
    messagingSenderId: '526787315268',
    projectId: 'chataps',
    authDomain: 'chataps.firebaseapp.com',
    storageBucket: 'chataps.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCoSAD7luHbNzfw1sR7o-pd4Tpvde8l_LY',
    appId: '1:526787315268:android:7714fe0a5dcd307d5fde11',
    messagingSenderId: '526787315268',
    projectId: 'chataps',
    storageBucket: 'chataps.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDexNGnJ9nOVwcNQhpQ6QjvuEVAasxDC9o',
    appId: '1:526787315268:ios:738209bfc11ee6f15fde11',
    messagingSenderId: '526787315268',
    projectId: 'chataps',
    storageBucket: 'chataps.appspot.com',
    iosBundleId: 'com.example.chatAps',
  );
}
