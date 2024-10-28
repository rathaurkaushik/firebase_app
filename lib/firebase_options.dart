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
    apiKey: 'AIzaSyD4FNyMcdrZG_6CO15jxV47jpC7h28cJlI',
    appId: '1:646757744612:web:70eac15515c74baaad11f1',
    messagingSenderId: '646757744612',
    projectId: 'authentication-f633e',
    authDomain: 'authentication-f633e.firebaseapp.com',
    storageBucket: 'authentication-f633e.appspot.com',
    measurementId: 'G-64CP6RSE1R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCskowOXPhfOAvJGxKAEdBa0iJWraZxK1w',
    appId: '1:646757744612:android:187b8b29a8d32104ad11f1',
    messagingSenderId: '646757744612',
    projectId: 'authentication-f633e',
    storageBucket: 'authentication-f633e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCsiI1AlCdCU5VkZa9y4GnOzG_zW7dMMcE',
    appId: '1:646757744612:ios:72a6a18d7000b456ad11f1',
    messagingSenderId: '646757744612',
    projectId: 'authentication-f633e',
    storageBucket: 'authentication-f633e.appspot.com',
    iosBundleId: 'com.example.authenticate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCsiI1AlCdCU5VkZa9y4GnOzG_zW7dMMcE',
    appId: '1:646757744612:ios:72a6a18d7000b456ad11f1',
    messagingSenderId: '646757744612',
    projectId: 'authentication-f633e',
    storageBucket: 'authentication-f633e.appspot.com',
    iosBundleId: 'com.example.authenticate',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD4FNyMcdrZG_6CO15jxV47jpC7h28cJlI',
    appId: '1:646757744612:web:a37ad992436e6a3cad11f1',
    messagingSenderId: '646757744612',
    projectId: 'authentication-f633e',
    authDomain: 'authentication-f633e.firebaseapp.com',
    storageBucket: 'authentication-f633e.appspot.com',
    measurementId: 'G-XVNKVBWGEJ',
  );

}