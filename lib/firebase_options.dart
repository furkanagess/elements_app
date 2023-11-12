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
    apiKey: 'AIzaSyAyvwoymtL15D76-vzv7qJlPLfOHaHhaZo',
    appId: '1:825025547715:web:ee423f1b06538982854176',
    messagingSenderId: '825025547715',
    projectId: 'elements-bbe3f',
    authDomain: 'elements-bbe3f.firebaseapp.com',
    storageBucket: 'elements-bbe3f.appspot.com',
    measurementId: 'G-NPYCTX7EJ7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDFD5e5Bhwzuz92M0yT1lvhMIaKfyiqDko',
    appId: '1:825025547715:android:3d25fd0293c57b3a854176',
    messagingSenderId: '825025547715',
    projectId: 'elements-bbe3f',
    storageBucket: 'elements-bbe3f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDN_8vEbxB1ndnh-aknRGLLVgfSU8Lx6xw',
    appId: '1:825025547715:ios:70c728914ec44876854176',
    messagingSenderId: '825025547715',
    projectId: 'elements-bbe3f',
    storageBucket: 'elements-bbe3f.appspot.com',
    iosBundleId: 'com.example.elementsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDN_8vEbxB1ndnh-aknRGLLVgfSU8Lx6xw',
    appId: '1:825025547715:ios:4122e85852d45d03854176',
    messagingSenderId: '825025547715',
    projectId: 'elements-bbe3f',
    storageBucket: 'elements-bbe3f.appspot.com',
    iosBundleId: 'com.example.elementsApp.RunnerTests',
  );
}