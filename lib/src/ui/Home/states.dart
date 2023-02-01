import 'package:project/Models/User_Model.dart';

abstract class HomeAppState {}

class HomecubitIntialStates extends HomeAppState {}

class HomeSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  HomeSuccessStates();
}

class HomeLoadingState extends HomeAppState {}

class HomeErrorStates extends HomeAppState {
  final String error;
  HomeErrorStates(this.error);
}

class CheckOtpSuccessStates extends HomeAppState {
  final UserModel userModel;

  CheckOtpSuccessStates(this.userModel);
}

class CheckOtpLoadingState extends HomeAppState {}

class CheckOtpErrorStates extends HomeAppState {
  final String error;
  CheckOtpErrorStates(this.error);
}

class ShopDetailsSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  ShopDetailsSuccessStates();
}

class ShopDetailsLoadingState extends HomeAppState {}

class ShopDetailsErrorStates extends HomeAppState {
  final String error;
  ShopDetailsErrorStates(this.error);
}

class GetCountresSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  GetCountresSuccessStates();
}

class GetCountresLoadingState extends HomeAppState {}

class GetCountresErrorStates extends HomeAppState {
  final String error;
  GetCountresErrorStates(this.error);
}

class OrderScreenSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  OrderScreenSuccessStates();
}

class OrderScreenLoadingState extends HomeAppState {}

class OrderScreenErrorStates extends HomeAppState {
  final String error;
  OrderScreenErrorStates(this.error);
}

class PostOrderSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  PostOrderSuccessStates();
}

class PostOrderLoadingState extends HomeAppState {}

class PostOrderErrorStates extends HomeAppState {
  final String error;
  PostOrderErrorStates(this.error);
}

class PostCartSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  PostCartSuccessStates();
}

class PostCartLoadingState extends HomeAppState {}

class PostCartErrorStates extends HomeAppState {
  final String error;
  PostCartErrorStates(this.error);
}

class PostDigitalOrderSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  PostDigitalOrderSuccessStates();
}

class PostDigitalOrderLoadingState extends HomeAppState {}

class PostDigitalOrderErrorStates extends HomeAppState {
  final String error;
  PostDigitalOrderErrorStates(this.error);
}

class PostGiftOrderSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  PostGiftOrderSuccessStates();
}

class PostGiftOrderLoadingState extends HomeAppState {}

class PostGiftOrderErrorStates extends HomeAppState {
  final String error;
  PostGiftOrderErrorStates(this.error);
}

class PostEditProfileSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  PostEditProfileSuccessStates();
}

class PostEditProfileLoadingState extends HomeAppState {}

class PostEditProfileErrorStates extends HomeAppState {
  final String error;
  PostEditProfileErrorStates(this.error);
}

class TabDetailsSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  TabDetailsSuccessStates();
}

class TabDetailsLoadingState extends HomeAppState {}

class TabDetailsErrorStates extends HomeAppState {
  final String error;
  TabDetailsErrorStates(this.error);
}

class GetCartSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  GetCartSuccessStates();
}

class GetCartLoadingState extends HomeAppState {}

class GetCartErrorStates extends HomeAppState {
  final String error;
  GetCartErrorStates(this.error);
}

class GetPerformaceSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  GetPerformaceSuccessStates();
}

class GetPerformaceLoadingState extends HomeAppState {}

class GetPerformaceErrorStates extends HomeAppState {
  final String error;
  GetPerformaceErrorStates(this.error);
}

class GetClientTrackingSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  GetClientTrackingSuccessStates();
}

class GetClientTrackingLoadingState extends HomeAppState {}

class GetClientTrackingErrorStates extends HomeAppState {
  final String error;
  GetClientTrackingErrorStates(this.error);
}

class AdsSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  AdsSuccessStates();
}

class AdsCartLoadingState extends HomeAppState {}

class AdsErrorStates extends HomeAppState {
  final String error;
  AdsErrorStates(this.error);
}

class GetDigitalOrderSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  GetDigitalOrderSuccessStates();
}

class GetDigitalOrderLoadingState extends HomeAppState {}

class GetDigitalOrderErrorStates extends HomeAppState {
  final String error;
  GetDigitalOrderErrorStates(this.error);
}

class GetQuickOrderSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  GetQuickOrderSuccessStates();
}

class GetQuickOrderLoadingState extends HomeAppState {}

class GetQuickOrderErrorStates extends HomeAppState {
  final String error;
  GetQuickOrderErrorStates(this.error);
}

class ProfileGiftSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  ProfileGiftSuccessStates();
}

class ProfileGiftLoadingState extends HomeAppState {}

class ProfileGiftErrorStates extends HomeAppState {
  final String error;
  ProfileGiftErrorStates(this.error);
}

class ProfileSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  ProfileSuccessStates();
}

class ProfileLoadingState extends HomeAppState {}

class ProfileErrorStates extends HomeAppState {
  final String error;
  ProfileErrorStates(this.error);
}

class OffersSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  OffersSuccessStates();
}

class OffersLoadingState extends HomeAppState {}

class OffersErrorStates extends HomeAppState {
  final String error;
  OffersErrorStates(this.error);
}

class OneOffersSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  OneOffersSuccessStates();
}

class OneOffersLoadingState extends HomeAppState {}

class OneOffersErrorStates extends HomeAppState {
  final String error;
  OneOffersErrorStates(this.error);
}

class DeleteCartSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  DeleteCartSuccessStates();
}

class DeleteCartLoadingState extends HomeAppState {}

class DeleteCartErrorStates extends HomeAppState {
  final String error;
  DeleteCartErrorStates(this.error);
}

class ConfirmOrderSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  ConfirmOrderSuccessStates();
}

class ConfirmOrderLoadingState extends HomeAppState {}

class ConfirmOrderErrorStates extends HomeAppState {
  final String error;
  ConfirmOrderErrorStates(this.error);
}

class ShopChangePasswordVisibilityState extends HomeAppState {}