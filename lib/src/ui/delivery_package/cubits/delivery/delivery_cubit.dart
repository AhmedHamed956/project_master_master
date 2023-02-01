import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/src/network/remote/Dio_helper.dart';
import 'package:project/src/ui/delivery_package/data/apis.dart';
import 'package:project/src/ui/delivery_package/data/response/map/accept_order_response.dart';
import 'package:project/src/ui/delivery_package/data/response/map/check_new_order_response.dart';
import 'package:project/src/ui/delivery_package/data/response/map/initial_response.dart';
import 'package:project/src/ui/delivery_package/data/response/map/refuse_order_response.dart';
import 'package:project/src/ui/delivery_package/data/response/map/update_map_response.dart';
import 'package:project/src/ui/delivery_package/data/response/map/update_status_response.dart';

part 'delivery_state.dart';

String deliveryToken = "1|XfCzHyPmwxyBlkHscHG14mFgPHQscAT4R9rcludE";

class DeliveryCubit extends Cubit<DeliveryState> {
  DeliveryCubit() : super(DeliveryInitial());

  static DeliveryCubit get(context) => BlocProvider.of(context);

  Future<void> setInitial(
      {required int active,
      required int autoAccept,
      required String map}) async {
    FormData formData = FormData.fromMap(
        {"auto_accpet": autoAccept, "active": active, "map": map});

    DioHelper.postdata(
            url: APIDATA.setInitial, data: formData, token: deliveryToken)
        .then((value) {
      // print("setInitial : ${value.data}");

      emit(InitialDeliverySuccess(
          response: InitialResponse.fromJson(value.data)));
    }).catchError((error, stack) {
      log(error.toString() + stack.toString());
      emit(GlobalError(error.toString()));
    });
  }

  Future<void> updateMap({required String map}) async {
    FormData formData = FormData.fromMap({"map": map});

    DioHelper.postdata(
            url: APIDATA.updateMap, data: formData, token: deliveryToken)
        .then((value) {
      // print("updateMap : ${value.data}");

      emit(UpdateMapSuccess(response: UpdateMapResponse.fromJson(value.data)));
    }).catchError((error) {
      emit(GlobalError(error.toString()));
    });
  }

  Future<void> updateStatus(
      {required int autoAccept, required int active}) async {
    FormData formData =
        FormData.fromMap({"auto_accpet": autoAccept, "active": active});

    DioHelper.postdata(
            url: APIDATA.updateStatus, data: formData, token: deliveryToken)
        .then((value) {
      // print("updateStatus : ${value.data}");

      emit(UpdateStatusSuccess(
          response: UpdateStatusResponse.fromJson(value.data)));
    }).catchError((error, stack) {
      log(error.toString() + stack.toString());
      emit(GlobalError(error.toString()));
    });
  }

  Future<void> checkNewOrderAutoAccept({required String map}) async {
    DioHelper.getdata(url: APIDATA.checkOrderAutoAccept, token: deliveryToken)
        .then((value) {
      // print("checkNewOrderAutoAccept : ${value.data}");

      emit(CheckNewOrderAutoAcceptSuccess(
          response: CheckNewOrderResponse.fromJson(value.data)));
    }).catchError((error, stack) {
      log(error.toString() + stack.toString());
      emit(GlobalError(error.toString()));
    });
  }

  Future<void> acceptOrder(int id) async {
    FormData formData = FormData.fromMap({"accpet": 1});
    log("acceptOrder : $id");

    DioHelper.postdata(
            url: APIDATA.acceptOrder + id.toString(),
            data: formData,
            token: deliveryToken)
        .then((value) {
      log("acceptOrder : ${value.data}");

      emit(AcceptOrderSuccess(
          response: AcceptOrderResponse.fromJson(value.data)));
    }).catchError((error, stack) {
      log(error.toString() + stack.toString());
      emit(GlobalError(error.toString()));
    });
  }

  Future<void> refuseOrder(int id) async {
    FormData formData = FormData.fromMap({"accpet": 0});

    DioHelper.postdata(
            url: APIDATA.refuseOrder + id.toString(),
            data: formData,
            token: deliveryToken)
        .then((value) {
      log("refuseOrder : ${value.data}");

      emit(RefuseOrderSuccess(
          response: RefuseOrderResponse.fromJson(value.data)));
    }).catchError((error, stack) {
      log(error.toString() + stack.toString());
      emit(GlobalError(error.toString()));
    });
  }
}
