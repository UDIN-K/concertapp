import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  // TODO: Replace with actual values from Firebase Console
  // Go to: Firebase Console > Project Settings > Your Apps
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'YOUR_ANDROID_API_KEY',
    appId: '1:468745474276:android:YOUR_APP_ID',
    messagingSenderId: '468745474276',
    projectId: 'concertapp-adb78',
    storageBucket: 'concertapp-adb78.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'YOUR_IOS_API_KEY',
    appId: '1:468745474276:ios:YOUR_APP_ID',
    messagingSenderId: '468745474276',
    projectId: 'concertapp-adb78',
    storageBucket: 'concertapp-adb78.firebasestorage.app',
    iosBundleId: 'com.example.concert',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'YOUR_WEB_API_KEY',
    appId: '1:468745474276:web:YOUR_APP_ID',
    messagingSenderId: '468745474276',
    projectId: 'concertapp-adb78',
    storageBucket: 'concertapp-adb78.firebasestorage.app',
    authDomain: 'concertapp-adb78.firebaseapp.com',
  );
}
