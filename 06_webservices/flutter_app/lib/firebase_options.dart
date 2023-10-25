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
    apiKey: 'AIzaSyDvN4YTSl48ZWqxFVmyMzTSRv_3RcnEn00',
    appId: '1:680358361752:web:4b6b36d478ad4c957c2eed',
    messagingSenderId: '680358361752',
    projectId: 'cs-442-demos',
    authDomain: 'cs-442-demos.firebaseapp.com',
    storageBucket: 'cs-442-demos.appspot.com',
    measurementId: 'G-3WS3PMZ867',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBePRmJHQqLhImR2o66ph-jUWC4WCYokUY',
    appId: '1:680358361752:android:4eb1e9055a7733777c2eed',
    messagingSenderId: '680358361752',
    projectId: 'cs-442-demos',
    storageBucket: 'cs-442-demos.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCA9RMiPXxoJlCDH4UKki_Z5zTGwXWNnZU',
    appId: '1:680358361752:ios:e6a7135632d5afc47c2eed',
    messagingSenderId: '680358361752',
    projectId: 'cs-442-demos',
    storageBucket: 'cs-442-demos.appspot.com',
    iosClientId: '680358361752-tv5i0pmnf9ju5eid81lh8pmut6pj3l3l.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCA9RMiPXxoJlCDH4UKki_Z5zTGwXWNnZU',
    appId: '1:680358361752:ios:55290422f5c42c2e7c2eed',
    messagingSenderId: '680358361752',
    projectId: 'cs-442-demos',
    storageBucket: 'cs-442-demos.appspot.com',
    iosClientId: '680358361752-bt85ts2cgatsc7opi9re03mkr1c6aqat.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1.RunnerTests',
  );
}
