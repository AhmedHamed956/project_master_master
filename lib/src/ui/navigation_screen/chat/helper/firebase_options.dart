
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

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

    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;

    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }


  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyApgqV5CrzP5uXzS70Y2GKo_NEWiWM6Ktc',
    appId: '1:910516599381:android:04423839fa50bb9f3c72dc',
    messagingSenderId: '910516599381',
    projectId: 'udemy-ac28e',
    storageBucket: 'udemy-ac28e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC_dbguB0bWDNuw3N8kF3ORkgidDDG2d6I',
    appId: '1:910516599381:ios:95dbeaa76045105a3c72dc',
    messagingSenderId: '910516599381',
    projectId: 'udemy-ac28e',
    storageBucket: 'udemy-ac28e.appspot.com',
    iosClientId: '910516599381-t765u6d36k1ejen9lt5gogckmcnpeuav.apps.googleusercontent.com',
    iosBundleId: 'com.example.fcmtest',
  );


}