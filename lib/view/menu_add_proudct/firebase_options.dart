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
    apiKey: 'AIzaSyCD5UqxeeHIZHeNPIFi2wwQKvS_FsPNmh4',
    appId: '1:79877496219:web:1f1334d9ead52a55c9d53e',
    messagingSenderId: '79877496219',
    projectId: 'zero-22952',
    authDomain: 'zero-22952.firebaseapp.com',
    storageBucket: 'zero-22952.appspot.com',
    measurementId: 'G-7BKHSXZQB2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLL5I7OtSK9IcPo8OYgdiUg4n9LNDVLLY',
    appId: '1:79877496219:android:99bf822988ff1e30c9d53e',
    messagingSenderId: '79877496219',
    projectId: 'zero-22952',
    storageBucket: 'zero-22952.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC4UQ3V9SxhD0dRTFE85aNZNjncZr-cghk',
    appId: '1:79877496219:ios:325d62a2228b95cac9d53e',
    messagingSenderId: '79877496219',
    projectId: 'zero-22952',
    storageBucket: 'zero-22952.appspot.com',
    iosClientId: '79877496219-2p0mjmk71n4k0mlfv12slml1qe27l5b7.apps.googleusercontent.com',
    iosBundleId: 'com.example.zeroWaste',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC4UQ3V9SxhD0dRTFE85aNZNjncZr-cghk',
    appId: '1:79877496219:ios:325d62a2228b95cac9d53e',
    messagingSenderId: '79877496219',
    projectId: 'zero-22952',
    storageBucket: 'zero-22952.appspot.com',
    iosClientId: '79877496219-2p0mjmk71n4k0mlfv12slml1qe27l5b7.apps.googleusercontent.com',
    iosBundleId: 'com.example.zeroWaste',
  );
}