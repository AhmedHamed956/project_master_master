import 'package:flutter/material.dart';
import 'package:project/src/common/route_argument.dart';
import 'package:project/src/ui/Auth/Login_Screen.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments as RouteArgument?;
    switch (settings.name) {
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
    return null;
  }
}
