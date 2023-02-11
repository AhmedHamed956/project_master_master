import 'package:project/Models/User_response.dart';

abstract class LoginAppStates {}

class LogincubitIntialStates extends LoginAppStates {}

class ShopLoginSuccessStates extends LoginAppStates {
  // final LoginModel loginModel;

  ShopLoginSuccessStates();
}

class ShopLoginLoadingState extends LoginAppStates {}

class ShopLoginErrorStates extends LoginAppStates {
  final String error;

  ShopLoginErrorStates(this.error);
}

class CheckOtpSuccessStates extends LoginAppStates {
  final UserResponse user;
  int? type;

  CheckOtpSuccessStates({required this.user, required this.type});
}

class CheckOtpLoadingState extends LoginAppStates {}

class CheckOtpErrorStates extends LoginAppStates {
  final String error;

  CheckOtpErrorStates(this.error);
}

class ShopChangePasswordVisibilityState extends LoginAppStates {}
