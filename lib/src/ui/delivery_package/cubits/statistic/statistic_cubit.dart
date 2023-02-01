import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/src/network/remote/Dio_helper.dart';
import 'package:project/src/ui/delivery_package/data/apis.dart';
import 'package:project/src/ui/delivery_package/data/response/statics/statistics_response.dart';

part 'statistic_state.dart';

String deliveryToken = "1|XfCzHyPmwxyBlkHscHG14mFgPHQscAT4R9rcludE";

class StatisticCubit extends Cubit<StatisticState> {
  StatisticCubit() : super(StatisticInitialState());

  static StatisticCubit get(context) => BlocProvider.of(context);

  Future<void> getStatistic() async {
    await DioHelper.getdata(url: APIDATA.myStatistics, token: deliveryToken)
        .then((value) {
      print("getStatistic : ${value.data}");
      if (value.data != null) {
        emit(StatisticSuccess(
            response: StatisticsResponse.fromJson(value.data)));
      }
    }).catchError((error, stack) {
      log("getStatisticOrder $error , $stack");
      // emit(GlobalError(error.toString()));
    });
  }
}
