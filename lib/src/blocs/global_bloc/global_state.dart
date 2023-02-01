part of 'global_bloc.dart';

abstract class GlobalState extends Equatable {
  const GlobalState();

  @override
  List<Object> get props => [];
}

class GlobalInitial extends GlobalState {}

class GlobalLoading extends GlobalState {}

class GlobalError extends GlobalState {}

class StartAppSuccess extends GlobalState {
  final Locale locale;

  const StartAppSuccess({required this.locale});
}

// class CheckIsLoadingState extends GlobalState {}

// class CheckIsErrorStates extends GlobalState {
//   final String error;
//   CheckIsErrorStates(this.error);
// }

class CheckIsSuccessStates extends GlobalState {
  // final LoginModel loginModel;

  CheckIsSuccessStates();
}

class ChangeLangSuccess extends GlobalState {
  final Locale locale;

  const ChangeLangSuccess({required this.locale});

  @override
  List<Object> get props => [locale];
}
