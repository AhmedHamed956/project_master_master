import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/src/network/remote/Dio_helper.dart';
import 'package:project/src/ui/delivery_package/data/apis.dart';
import 'package:project/src/ui/delivery_package/data/model/accept_order_model.dart';
import 'package:project/src/ui/delivery_package/data/model/tracking/order_status_model.dart';
import 'package:project/src/ui/delivery_package/data/response/tracking/OrderStatusResponse.dart';
import 'package:project/src/ui/delivery_package/data/response/tracking/close_order_response.dart';
import 'package:project/src/ui/delivery_package/data/response/tracking/my_order_response.dart';
import 'package:project/src/ui/delivery_package/data/response/tracking/rate_order_response.dart';
import 'package:project/src/ui/delivery_package/data/response/tracking/track_order_response.dart';

part 'tracking_state.dart';

String deliveryToken = "1|XfCzHyPmwxyBlkHscHG14mFgPHQscAT4R9rcludE";

class TrackingCubit extends Cubit<TrackingState> {
  AcceptOrderModel? orderModel;
  OrderStatusModel? orderStatusModel;

  TrackingCubit() : super(TrackingInitialState());

  static TrackingCubit get(context) => BlocProvider.of(context);

  Future<void> getMyOrderStatus() async {
    await DioHelper.getdata(url: APIDATA.getMyOrder, token: deliveryToken)
        .then((value) {
      print("getMyOrder : ${value.data}");
      if (value.data != null) {
        orderStatusModel = MyOrderResponse.fromJson(value.data).data;
        emit(MyOrderSuccess(response: MyOrderResponse.fromJson(value.data)));
      }
    }).catchError((error, stack) {
      log("getMyOrder $error , $stack");
      // emit(GlobalError(error.toString()));
    });
  }

  Future<void> getTrackingOrder() async {
    await DioHelper.getdata(url: APIDATA.trackingOrder, token: deliveryToken)
        .then((value) {
      print("getTrackingOrder : ${value.data}");
      if (value.data != null) {
        orderModel = TrackOrderResponse.fromJson(value.data).data;
        emit(TrackingOrderSuccess(
            response: TrackOrderResponse.fromJson(value.data)));
      }
    }).catchError((error, stack) {
      log("getTrackingOrder $error , $stack");
      // emit(GlobalError(error.toString()));
    });
  }

  Future<void> goToMarket() async {
    print("goToMarket :");
    emit(GoToMarketSuccess());
  }

  Future<void> goToClient() async {
    print("goToClient :");
    emit(GoToClientSuccess());
  }

  Future<void> rateOrder({required int orderId, required double rate}) async {
    FormData formData = FormData.fromMap({"rating": rate});

    DioHelper.postdata(
            url: APIDATA.rateOrder + orderId.toString(),
            data: formData,
            token: deliveryToken)
        .then((value) {
      // print("rateOrder : ${value.data}");

      emit(RateOrderSuccess(response: RateOrderResponse.fromJson(value.data)));
    }).catchError((error) {
      emit(GlobalError(error.toString()));
    });
  }

  Future<void> saveSteps({required OrderStatusModel model}) async {
    Map<String, dynamic> map = {};
    model.toJson().forEach((key, value) {
      if (key != "order_id") {
        map[key] = value;
      }
    });
    print("saveSteps : $map");
    print("saveSteps : ${model.orderId}");
    // print("saveSteps : ${map.values}");
    try {
      FormData formData = FormData.fromMap(map);
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $deliveryToken";
      dio.options.headers["Accept"] = "application/json";

      Response response = await dio.post(
          "https://biflora.bluecode.sa/api/v1/Rep/save_steps/${model.orderId}",
          data: formData);
      emit(SaveStepsSuccess(
          response: OrderStatusResponse.fromJson(response.data)));
    } on DioError catch (e, s) {
      print(e.toString() + s.toString());
    }
  }

  Future<void> closeOrder(bool value) async {
    log("closeOrder : $value");
    orderModel = null;
    emit(CloseOrderSuccess(value: value));
  }
}
