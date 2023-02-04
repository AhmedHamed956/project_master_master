import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:project/Models/User_response.dart';
import 'package:project/src/ui/Auth/Cubit/states.dart';

import '../../../../Models/check_is_represtative_Model.dart';
import '../../../../Models/login_model.dart';
import '../../../common/global.dart';
import '../../../network/local/cache-helper.dart';
import '../../../network/remote/Dio_helper.dart';
import '../../../network/remote/endPoint.dart';
import '../../Shared/constant.dart';
import '../../delivery_package/navigation_screens/delivery_cycle_screen.dart';
import '../../location/location_permission_screen.dart';
import '../otp_Screen.dart';

class LoginScreenCubit extends Cubit<LoginAppStates> {
  LoginScreenCubit() : super(LogincubitIntialStates());

  static LoginScreenCubit get(context) => BlocProvider.of(context);

  // LoginModel loginModel;

  Future<void> userlogin({@required phone, context}) async {
    FormData formData = FormData.fromMap({
      "phone": phone,

      // "device_token": user.deviceToken
    });
    emit(ShopLoginLoadingState());

    DioHelper.postdata(url: Login, data: formData).then((value) {
      print(value.data);
      // loginModel = LoginModel.fromjason(value.data);

      emit(ShopLoginSuccessStates());
    }).catchError((error) {
      emit(ShopLoginErrorStates(error.toString()));
    });
  }

  UserResponse? userModel;

  // UserModel userModel;
  Future<void> checkotp({@required code, context}) async {
    FormData formData = FormData.fromMap({
      "otp": code,

      // "device_token": user.deviceToken
    });
    emit(CheckOtpLoadingState());

    DioHelper.postdata(url: check_otp, data: formData).then((value) {
      print(value.data);

      userModel = UserResponse.fromJson(value.data);

      emit(CheckOtpSuccessStates(userModel!));
      CacheHelper.saveData(key: 'token', value: userModel?.token)
          .then((value) => token = CacheHelper.getData(key: 'token'))
          .then((value) => Navigator.push(context,
              MaterialPageRoute(builder: (context) => LocationPermissionScreen())));
    }).catchError((error) {
      emit(CheckOtpErrorStates(error.toString()));
    });
  }
}
