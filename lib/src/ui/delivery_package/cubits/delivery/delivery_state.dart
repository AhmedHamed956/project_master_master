part of 'delivery_cubit.dart';

abstract class DeliveryState extends Equatable {
  const DeliveryState();

  @override
  List<Object> get props => [];
}

class DeliveryInitial extends DeliveryState {}

class GlobalError extends DeliveryState {
  const GlobalError(String string);
}

class InitialDeliverySuccess extends DeliveryState {
  InitialResponse response;

  InitialDeliverySuccess({required this.response});

  @override
  List<Object> get props => [response];
}

class UpdateMapSuccess extends DeliveryState {
  UpdateMapResponse response;

  UpdateMapSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

class UpdateStatusSuccess extends DeliveryState {
  UpdateStatusResponse response;

  UpdateStatusSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

class CheckNewOrderAutoAcceptSuccess extends DeliveryState {
  CheckNewOrderResponse response;

  CheckNewOrderAutoAcceptSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

class AcceptOrderSuccess extends DeliveryState {
  AcceptOrderResponse response;

  AcceptOrderSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

class RefuseOrderSuccess extends DeliveryState {
  RefuseOrderResponse response;

  RefuseOrderSuccess({required this.response});

  @override
  List<Object> get props => [response];
}
