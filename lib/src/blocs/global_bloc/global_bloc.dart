import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../Models/check_is_represtative_Model.dart';
import '../../../generated/l10n.dart';
import '../../common/global.dart';
import '../../network/remote/Dio_helper.dart';
import '../../network/remote/endPoint.dart';
import '../../repo/global_repository.dart';
import '../../ui/Shared/constant.dart';

part 'global_event.dart';

part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  final GlobalRepository globalRepository = GlobalRepository();
  Locale? locale;

  bool _appLaunched = false;

  GlobalBloc() : super(GlobalInitial()) {
    on<StartAppEvent>(_mapStartAppToState);
    on<DeliveryAppEvent>(checkIsRepresnative);
    on<ChangeLangEvent>(_changeLang);
  }

  void _mapStartAppToState(
      StartAppEvent event, Emitter<GlobalState> emit) async {
    emit(GlobalLoading());

    locale = await globalRepository.getLang();

    if (locale != null) {
      emit(StartAppSuccess(locale: locale ?? const Locale('ar')));
      _appLaunched = true;
    }
  }

  CheckIsRepresentativeModel? checkIsRepresentativeModel;

  void checkIsRepresnative(
      DeliveryAppEvent event, Emitter<GlobalState> emit) async {
    // emit(CheckIsLoadingState());

    if (token != null) {
      await DioHelper.getdata(url: checkIsRep, token: token).then((value) {
        checkIsRepresentativeModel =
            CheckIsRepresentativeModel.fromJson(value.data);

        print(value.data);
      });

      if (checkIsRepresentativeModel?.data?.isRepresentative != null) {
        emit(CheckIsSuccessStates());
        // print(checkIsRepresentativeModel?.data?.isRepresentative.toString());

        deliveryApp = checkIsRepresentativeModel?.data?.isRepresentative;
        print(deliveryApp.toString());
      }
    }
  }

  void _changeLang(ChangeLangEvent event, Emitter<GlobalState> emit) async {
    langKey = await storage.read(key: "lang");
    if (langKey == "en") {
      locale = const Locale("ar");
      langKey = 'ar';
      print(langKey);
    } else if (langKey == "ar") {
      locale = const Locale("en");
      langKey = 'en';
      print(langKey);
    } else {
      locale = const Locale("ar");
    }

    await storage.write(key: "lang", value: locale!.languageCode);
    if (!S.delegate.supportedLocales.contains(locale)) return;
    emit(ChangeLangSuccess(locale: locale ?? const Locale("ar")));
  }
}
