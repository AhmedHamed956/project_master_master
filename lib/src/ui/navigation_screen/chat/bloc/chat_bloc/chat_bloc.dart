import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:project/src/ui/navigation_screen/chat/repo/chat_provider.dart';

part 'chat_event.dart';

part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  // final ChatProvider chatRepo = ChatProvider();
  String tag = "ChatBloc";
  late FirebaseMessaging _firebaseMessaging;

  ChatBloc() : super(GlobalInitial())  {
    on<StartAppEvent>(_mapStartAppToState);
    _firebaseMessaging = FirebaseMessaging.instance;
    // await _firebaseMessaging.getToken().then((String? _deviceToken) {
    //   _user.deviceToken = _deviceToken;
    // }).catchError((e) {
    //   print("$tag $e");
    // });
  }

  void _mapStartAppToState(
      StartAppEvent event, Emitter<ChatState> emit) async {}
}
