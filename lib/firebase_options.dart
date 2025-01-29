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
    apiKey: 'AIzaSyCwKrVVi26YB1mfUUIylZy6DXX_lobIjKM',
    appId: '1:958194956494:web:2045afedf99925fa37389f',
    messagingSenderId: '958194956494',
    projectId: 'todo-7034d',
    authDomain: 'todo-7034d.firebaseapp.com',
    storageBucket: 'todo-7034d.firebasestorage.app',
    measurementId: 'G-TKDZP3GZ0X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAtzn0nDp4BUdTYb0oEwMC99YllCEkxsuA',
    appId: '1:958194956494:android:1cb5a1f934396d6f37389f',
    messagingSenderId: '958194956494',
    projectId: 'todo-7034d',
    storageBucket: 'todo-7034d.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwm_9sQTduJPhuOjM7e8afnRlI7yMOoec',
    appId: '1:958194956494:ios:ecea998cb623ff1a37389f',
    messagingSenderId: '958194956494',
    projectId: 'todo-7034d',
    storageBucket: 'todo-7034d.firebasestorage.app',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBwm_9sQTduJPhuOjM7e8afnRlI7yMOoec',
    appId: '1:958194956494:ios:ecea998cb623ff1a37389f',
    messagingSenderId: '958194956494',
    projectId: 'todo-7034d',
    storageBucket: 'todo-7034d.firebasestorage.app',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCwKrVVi26YB1mfUUIylZy6DXX_lobIjKM',
    appId: '1:958194956494:web:c8e0000a8915b31237389f',
    messagingSenderId: '958194956494',
    projectId: 'todo-7034d',
    authDomain: 'todo-7034d.firebaseapp.com',
    storageBucket: 'todo-7034d.firebasestorage.app',
    measurementId: 'G-1XJ3W6R1M7',
  );
}
