part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class GlobalInitial extends ChatState {}

class GlobalLoading extends ChatState {}

class GlobalError extends ChatState {}

class StartAppSuccess extends ChatState {
  final Locale locale;

  const StartAppSuccess({required this.locale});
}
