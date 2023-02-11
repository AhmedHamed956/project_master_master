import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project/src/blocs/global_bloc/global_bloc.dart';
import 'package:project/src/common/global.dart';
import 'package:project/src/common/route_argument.dart';
import 'package:project/src/common/routes.dart';
import 'package:project/src/network/local/cache-helper.dart';
import 'package:project/src/network/remote/Dio_helper.dart';
import 'package:project/src/ui/Auth/Cubit/cubit.dart';
import 'package:project/src/ui/Auth/Login_Screen.dart';
import 'package:project/src/ui/Home/Cubit.dart';
import 'package:project/src/ui/Home/Home.dart';
import 'package:project/src/ui/Shared/constant.dart';
import 'package:project/src/ui/delivery_package/navigation_screens/delivery_cycle_screen.dart';
import 'package:project/src/ui/navigation_screen/chat/helper/firebase_options.dart';
import 'package:project/src/ui/navigation_screen/chat/helper/local_notification_service.dart';
import 'package:project/src/ui/navigation_screen/chat/ui/screens/chat_cycle.dart';

import 'generated/l10n.dart';
import 'src/ui/navigation_screen/chat/helper/navigation_service.dart';
import 'src/ui/navigation_screen/chat/helper/noti.dart';

final gloScaffMessKey = GlobalKey<ScaffoldMessengerState>();
FlutterLocalNotificationsPlugin flnp = FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: "biflora", options: DefaultFirebaseOptions.currentPlatform);
  DioHelper.init();
  await CacheHelper.init();
  Widget widget;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  _firebaseMessaging.requestPermission();

  FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  LocalNotificationService.initialize(flnp).then((_) {
    debugPrint('setupPlugin: setup success');
  }).catchError((Object error) {
    debugPrint('Error: $error');
  });

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    if (message.notification != null) {
      log("Message data payload: ${message.data}");

      flnp.show(
          message.hashCode,
          message.notification!.title,
          message.notification!.body,
          NotificationDetails(
              android:
                  LocalNotificationService.androidPlatformChannelSpecifics),
          payload: message.data.toString());
    }
  });
  FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

  // CacheHelper.getData(key: 'deliveryApp') == true
  //     ? deliveryApp = true
  //     : deliveryApp = false;
  print('DeliveryApp $deliveryApp');
  // token = '9|HBj6WP4WVflVkoK7Wf7CJjvRkR7pS9Fca5uWVqda';
  // token = '27|O8ubJ3Dgpp7yQaRoSrH9ItJIYuLZw37TUfTjCmPn';

  token = CacheHelper.getData(key: 'token');
  fcmToken = CacheHelper.getData(key: 'fcm_token');
  userId = CacheHelper.getData(key: 'userId');

  print("fcmToken $fcmToken");
  print("userId $userId");

  print(token);
  if (token != null) {
    widget = HomeScreen();
  } else {
    widget = const LoginScreen();
  }

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (BuildContext context) => LoginScreenCubit()),
    // BlocProvider(create: (context) => HomeCubit()..ordersScreen()),
    BlocProvider(create: (context) => HomeCubit()),
    BlocProvider(
        create: (context) => GlobalBloc()
          ..add(StartAppEvent())
          ..add(DeliveryAppEvent()))
  ], child: MyApp(startwidget: widget)));
}

class MyApp extends StatefulWidget {
  late Widget startwidget;

  MyApp({Key? key, required this.startwidget}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  @override
  Widget build(BuildContext context) {
    return BlocListener<GlobalBloc, GlobalState>(
        listener: (BuildContext context, state) {
          if (state is StartAppSuccess) {
            // if (state.locale != null) {
            // FlutterNativeSplash.remove();
            // }
            setState(() {
              _locale = state.locale;
            });
          }

          if (state is ChangeLangSuccess) {
            setState(() {
              _locale = state.locale;
            });
            // log("ChangeLangSuccess  = =  " + _locale!.languageCode.toString());
          }

          if (state is CheckIsSuccessStates) {
            setState(() {
              deliveryApp == 0
                  ? widget.startwidget = HomeScreen()
                  : widget.startwidget = DeliveryCycleScreen();
            });
          }
        },
        child: MaterialApp(
            title: 'BIFLORA',
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigationService.navigationKey,
            locale: _locale,
            theme: ThemeData(
                primarySwatch: Colors.blue,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                checkboxTheme: CheckboxThemeData(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => button1color)),
                fontFamily: 'Tajawal'),
            scaffoldMessengerKey: gloScaffMessKey,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            supportedLocales: S.delegate.supportedLocales,
            // home: const HomeScreen(),
            home: widget.startwidget,
            // home: ChatCycle(peerName: '', peerId: '60', fcmToken: ''),
            // home:ChatCycle(),
// home: GiftCardScreen(),
            // home: DeliveryCycleScreen(),
            onGenerateRoute: RouteGenerator.generateRoute));
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // flnp.show(
  //     message.hashCode,
  //     message.notification!.title,
  //     message.notification!.body,
  //     NotificationDetails(
  //         android:
  //         LocalNotificationService.androidPlatformChannelSpecifics),
  //     payload: message.data.toString());
  print("Handling a background message: ${message.messageId}");
}

void _handleMessage(RemoteMessage message) {
  List<String> data0 = [message.data['id'], "Support", ''];
  NavigationService.navigationKey.currentState!
      .pushNamed(ChatCycle.routeName, arguments: RouteArgument(param: data0));
}
