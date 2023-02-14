// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
            'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDz5V-AU434f4bm1DUwE2I1Yy4B_o2R-g0',
    appId: '1:458757187364:android:290e62abf82d9465b4f5b1',
    messagingSenderId: '458757187364',
    projectId: 'spe-data-3fd17',
    databaseURL: 'https://spe-data-3fd17-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'spe-data-3fd17.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDedzSFO1CL3QiGXphdgPwEJmdPtxfXcak',
    appId: '1:458757187364:ios:e7686090c752e1b5b4f5b1',
    messagingSenderId: '458757187364',
    projectId: 'spe-data-3fd17',
    databaseURL: 'https://spe-data-3fd17-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'spe-data-3fd17.appspot.com',
    iosClientId: '458757187364-gnk3ijtuc85jkcigqp78lgnjslhgldvq.apps.googleusercontent.com',
    iosBundleId: 'com.example.RewardProcessing',
  );
}