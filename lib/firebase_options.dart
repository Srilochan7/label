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
    apiKey: 'AIzaSyDSO8MCVp1ExKo1UQh7_oivzJR8Xl4V-DE',
    appId: '1:282745903009:web:fcb1051592eef8aa93dde0',
    messagingSenderId: '282745903009',
    projectId: 'label-1-389ac',
    authDomain: 'label-1-389ac.firebaseapp.com',
    storageBucket: 'label-1-389ac.firebasestorage.app',
    measurementId: 'G-N28VV5XN7Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDpHFZmmaCOb99ClflNVxPGCTxK6PeQoWI',
    appId: '1:282745903009:android:51d92e42c1cbcb9393dde0',
    messagingSenderId: '282745903009',
    projectId: 'label-1-389ac',
    storageBucket: 'label-1-389ac.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBFhM6GbfxhdrtzitKvTP1d3T51t_vrE58',
    appId: '1:282745903009:ios:67f0686e2eb5fd4093dde0',
    messagingSenderId: '282745903009',
    projectId: 'label-1-389ac',
    storageBucket: 'label-1-389ac.firebasestorage.app',
    iosBundleId: 'com.example.label',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBFhM6GbfxhdrtzitKvTP1d3T51t_vrE58',
    appId: '1:282745903009:ios:67f0686e2eb5fd4093dde0',
    messagingSenderId: '282745903009',
    projectId: 'label-1-389ac',
    storageBucket: 'label-1-389ac.firebasestorage.app',
    iosBundleId: 'com.example.label',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDSO8MCVp1ExKo1UQh7_oivzJR8Xl4V-DE',
    appId: '1:282745903009:web:1729dc16dfc8feeb93dde0',
    messagingSenderId: '282745903009',
    projectId: 'label-1-389ac',
    authDomain: 'label-1-389ac.firebaseapp.com',
    storageBucket: 'label-1-389ac.firebasestorage.app',
    measurementId: 'G-WJSQ34SRX6',
  );

}