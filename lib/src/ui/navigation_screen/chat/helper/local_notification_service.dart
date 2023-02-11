import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:project/src/common/route_argument.dart';
import 'package:project/src/ui/navigation_screen/chat/helper/navigation_service.dart';
import 'package:project/src/ui/navigation_screen/chat/ui/screens/chat_cycle.dart';

class LocalNotificationService {
  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize = const AndroidInitializationSettings('logo_bi');
    var initializationsSettings =
        InitializationSettings(android: androidInitialize);
    await flutterLocalNotificationsPlugin.initialize(initializationsSettings,
        onDidReceiveNotificationResponse: handelNotificationPress,
        onDidReceiveBackgroundNotificationResponse: handelNotificationPress);
  }

  static AndroidNotificationDetails androidPlatformChannelSpecifics =
      const AndroidNotificationDetails(
    'com.blue_code.biflora', // id
    'High Importance Notifications', // title
    playSound: true,
    importance: Importance.max,
    priority: Priority.max,
  );

  static void handelNotificationPress(NotificationResponse details) {
    final Map data = convertPayload(details.payload!);

    print('handelNotificationPress: ${data['id']}');

    List<String> data0 = [data['id'].toString(), "Support", ''];
    NavigationService.navigationKey.currentState!
        .pushNamed(ChatCycle.routeName, arguments: RouteArgument(param: data0));
  }

  static Map convertPayload(String payload) {
    final String payload0 = payload.substring(1, payload.length - 1);
    List<String> split = [];
    payload0.split(",").forEach((String s) => split.addAll(s.split(":")));
    Map mapped = {};
    for (int i = 0; i < split.length + 1; i++) {
      if (i % 2 == 1) {
        mapped.addAll({split[i - 1].trim().toString(): split[i].trim()});
      }
    }
    return mapped;
  }
}
