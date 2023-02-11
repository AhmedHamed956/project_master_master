import 'dart:convert';
import 'dart:developer';

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

  UserResponse? userResponse;

  // UserModel userModel;
  Future<void> checkOtp(
      {@required code, context, required String fcmToken}) async {
    FormData formData = FormData.fromMap({"otp": code, 'fcm_token': fcmToken});
    emit(CheckOtpLoadingState());

    DioHelper.postdata(url: check_otp, data: formData).then((value) {
      log("checkOtp ${jsonEncode(value.data)}");

      userResponse = UserResponse.fromJson(value.data);
      DioHelper.getdata(url: checkIsRep, token: userResponse!.token)
          .then((check) {
        log("checkIsRepresentative ${jsonEncode(check.data)}");

        CheckIsRepresentativeModel checkRepresentative =
            CheckIsRepresentativeModel.fromJson(check.data);

        emit(CheckOtpSuccessStates(
            user: userResponse!,
            type: checkRepresentative.data?.isRepresentative));
        CacheHelper.saveData(key: 'fcm_token', value: fcmToken);
        CacheHelper.saveData(
            key: 'userId', value: userResponse?.user?.id.toString());
        CacheHelper.saveData(key: 'token', value: userResponse?.token)
            .then((value) => token = CacheHelper.getData(key: 'token'));
      }).catchError((error, s) {
        log("checkOtp $error $s");
        emit(CheckOtpErrorStates(error.toString()));
      });
    }).catchError((error, s) {
      log("checkOtp $error $s");
      emit(CheckOtpErrorStates(error.toString()));
    });
  }
}
