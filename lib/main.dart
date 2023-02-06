import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/src/blocs/global_bloc/global_bloc.dart';
import 'package:project/src/common/global.dart';
import 'package:project/src/common/routes.dart';
import 'package:project/src/network/local/cache-helper.dart';
import 'package:project/src/network/remote/Dio_helper.dart';
import 'package:project/src/ui/Auth/Cubit/cubit.dart';
import 'package:project/src/ui/Auth/Login_Screen.dart';
import 'package:project/src/ui/Home/Cubit.dart';
import 'package:project/src/ui/Home/Home.dart';
import 'package:project/src/ui/Shared/constant.dart';
import 'package:project/src/ui/delivery_package/navigation_screens/delivery_cycle_screen.dart';
import 'package:project/src/ui/location/location_permission_screen.dart';
import 'package:project/src/ui/location/mapping_set.dart';
import 'package:project/src/ui/navigation_screen/main-screens/quick-screen.dart';

import 'generated/l10n.dart';

final gloScaffMessKey = GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Widget widget;

  // CacheHelper.getData(key: 'deliveryApp') == true
  //     ? deliveryApp = true
  //     : deliveryApp = false;
  print('DeliveryApp $deliveryApp');
  // token = '9|HBj6WP4WVflVkoK7Wf7CJjvRkR7pS9Fca5uWVqda';
  // token = '27|O8ubJ3Dgpp7yQaRoSrH9ItJIYuLZw37TUfTjCmPn';

  token = CacheHelper.getData(key: 'token');
  // mylocation = CacheHelper.getData(key: 'mylocation');
  myAddress = await storage.read(key: "myAddress");
  myLat_long = await storage.read(key: "myLatLong");
  mycity = CacheHelper.getData(key: 'mycity');
  mystreet = CacheHelper.getData(key: 'mystreet');

  print(token);
  if (token != null) {
    widget = HomeScreen();
  } else {
    widget = const LoginScreen();
  }

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (BuildContext context) => LoginScreenCubit()),
    BlocProvider(create: (context) => HomeCubit()..ordersScreen()),
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
            // home: LocationPermissionScreen(),
            // home: QuickScreen(),
            // home: MappingSet(mappingset: 'startlocation'),
            // home: DeliveryCycleScreen(),
            onGenerateRoute: RouteGenerator.generateRoute));
  }
}
