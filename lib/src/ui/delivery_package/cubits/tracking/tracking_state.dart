part of 'tracking_cubit.dart';

abstract class TrackingState extends Equatable {
  const TrackingState();

  @override
  List<Object> get props => [];
}

class TrackingInitialState extends TrackingState {}

class GlobalError extends TrackingState {
  GlobalError(String string);
}

class MyOrderSuccess extends TrackingState {
  MyOrderSuccess({required this.response});

  MyOrderResponse response;

  @override
  List<Object> get props => [response];
}

class TrackingOrderSuccess extends TrackingState {
  TrackOrderResponse response;

  TrackingOrderSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

class GoToMarketSuccess extends TrackingState {
  const GoToMarketSuccess();

  @override
  List<Object> get props => [true];
}

class GoToClientSuccess extends TrackingState {
  const GoToClientSuccess();

  @override
  List<Object> get props => [true];
}

class RateOrderSuccess extends TrackingState {
  RateOrderResponse response;

  RateOrderSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

class SaveStepsSuccess extends TrackingState {
  OrderStatusResponse response;

  SaveStepsSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

class CloseOrderSuccess extends TrackingState {
  bool value;

  CloseOrderSuccess({required this.value});

  @override
  List<Object> get props => [value];
}
