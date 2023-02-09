import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:intl/intl.dart' as intl;

class FireHelper {
  static FirebaseMessaging fMessaging = FirebaseMessaging.instance;

  // for getting firebase messaging token
  static String myPushToken = '';

  static Future<String?> getFirebaseMessagingToken() async {
    await fMessaging.requestPermission();

    return await fMessaging.getToken();
  }

  // for handling foreground messages
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   log('Got a message whilst in the foreground!');
  //   log('Message data: ${message.data}');

  //   if (message.notification != null) {
  //     log('Message also contained a notification: ${message.notification}');
  //   }
  // });
  static bool isRTL(String text) {
    return intl.Bidi.detectRtlDirectionality(text);
  }
}
