// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core_dart/firebase_core_dart.dart' show FirebaseOptions;
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDjdxrkFvtBVfFEms7TauPxpdK2_1yhBSM',
    appId: '1:799426423100:android:f5cabc78973814afdad639',
    messagingSenderId: '799426423100',
    projectId: 'nmausvpn',
    storageBucket: 'nmausvpn.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDLtq1wBeS-OFk-wE06EJEcvF_WX2-p5ww',
    appId: '1:799426423100:ios:b0c0fa6e9c3a5877dad639',
    messagingSenderId: '799426423100',
    projectId: 'nmausvpn',
    storageBucket: 'nmausvpn.appspot.com',
    iosBundleId: 'net.appdevs.suppervpn',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCID6o87YKREM1SIL1ixgQ29NRmBrZfM3E',
    appId: '1:799426423100:web:4115215d2e7c0c1edad639',
    messagingSenderId: '799426423100',
    projectId: 'nmausvpn',
    authDomain: 'nmausvpn.firebaseapp.com',
    storageBucket: 'nmausvpn.appspot.com',
    measurementId: 'G-2PSHGRQZ0K',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDLtq1wBeS-OFk-wE06EJEcvF_WX2-p5ww',
    appId: '1:799426423100:ios:101fc836bad4b82edad639',
    messagingSenderId: '799426423100',
    projectId: 'nmausvpn',
    storageBucket: 'nmausvpn.appspot.com',
    iosBundleId: 'com.nagakaburos.mausvpn',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCID6o87YKREM1SIL1ixgQ29NRmBrZfM3E',
    appId: '1:799426423100:web:c124ff73effb3756dad639',
    messagingSenderId: '799426423100',
    projectId: 'nmausvpn',
    authDomain: 'nmausvpn.firebaseapp.com',
    storageBucket: 'nmausvpn.appspot.com',
    measurementId: 'G-50XPXWTZEZ',
  );

}