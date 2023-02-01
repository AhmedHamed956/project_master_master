part of 'statistic_cubit.dart';

abstract class StatisticState extends Equatable {
  const StatisticState();

  @override
  List<Object> get props => [];
}

class StatisticInitialState extends StatisticState {}

class GlobalError extends StatisticState {
  GlobalError(String string);
}

class StatisticSuccess extends StatisticState {
  StatisticSuccess({required this.response});

  StatisticsResponse response;

  @override
  List<Object> get props => [response];
}
