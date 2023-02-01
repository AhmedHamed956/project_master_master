part of 'global_bloc.dart';

abstract class GlobalEvent extends Equatable {
  const GlobalEvent();

  @override
  List<Object?> get props => [];
}

class StartAppEvent extends GlobalEvent {}

class DeliveryAppEvent extends GlobalEvent {}

class ChangeLangEvent extends GlobalEvent {
  const ChangeLangEvent();
}
