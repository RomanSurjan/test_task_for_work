import 'package:firebase_core/firebase_core.dart';
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
    apiKey: 'AIzaSyD43RMHhNsALP9uHCSVZEB1vhKliis40q8',
    appId: '1:1039948750177:web:f09359e4102bf6ea9c3920',
    messagingSenderId: '1039948750177',
    projectId: 'test-task-for-work',
    authDomain: 'test-task-for-work.firebaseapp.com',
    storageBucket: 'test-task-for-work.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCCsvChuAI3HBUmsoxolhsa7ltj9SitFvc',
    appId: '1:1039948750177:android:7e3d08a2b25f33dd9c3920',
    messagingSenderId: '1039948750177',
    projectId: 'test-task-for-work',
    storageBucket: 'test-task-for-work.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDsl9niuRG-yqYY1rQzBSw1he6VwGbRwBA',
    appId: '1:1039948750177:ios:de0729351ad245149c3920',
    messagingSenderId: '1039948750177',
    projectId: 'test-task-for-work',
    storageBucket: 'test-task-for-work.appspot.com',
    iosClientId: '1039948750177-kaudcun3a6t9pod5t644j6fuci44c168.apps.googleusercontent.com',
    iosBundleId: 'com.example.testTaskForWork',
  );
}
