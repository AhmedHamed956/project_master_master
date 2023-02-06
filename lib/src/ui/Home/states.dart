import 'package:equatable/equatable.dart';
import 'package:project/Models/User_response.dart';
import 'package:project/Models/model/location_model.dart';

import '../../../Models/model/shop_model.dart';

abstract class HomeAppState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomecubitIntialStates extends HomeAppState {}

class HomeSuccessStates extends HomeAppState {
  List<ShopData>? items;

  HomeSuccessStates({this.items});
}

class HomeShopFilterSuccessStates extends HomeAppState {
  List<ShopData>? items;

  HomeShopFilterSuccessStates({this.items});
}

class GetSavedLocationSuccessStates extends HomeAppState {
  LocationModel? model;

  GetSavedLocationSuccessStates({this.model});
}

class HomeLoadingState extends HomeAppState {}

class HomeErrorStates extends HomeAppState {
  final String error;

  HomeErrorStates(this.error);
}

class CheckOtpSuccessStates extends HomeAppState {
  final UserResponse userModel;

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
  List<LocationModel>? items;

  GetCountresSuccessStates({required this.items});
}

class GetLocationsSuccessStates extends HomeAppState {
  List<LocationModel> items;

  GetLocationsSuccessStates(this.items);
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

class PosQuickOrderSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  PosQuickOrderSuccessStates();
}

class PosQuickOrderLoadingState extends HomeAppState {}

class PosQuickOrderErrorStates extends HomeAppState {
  final String error;

  PosQuickOrderErrorStates(this.error);
}

class ReadyQuickPostOrderSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  ReadyQuickPostOrderSuccessStates();
}

class ReadyQuickPostOrderLoadingState extends HomeAppState {}

class ReadyQuickPostOrderErrorStates extends HomeAppState {
  final String error;

  ReadyQuickPostOrderErrorStates(this.error);
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
  String? message;

  PostGiftOrderSuccessStates({this.message});

  @override
  List<Object?> get props => [message];
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

class QuickSuggestionSuccessStates extends HomeAppState {
  QuickSuggestionSuccessStates();
}

class QuickSuggestionLoadingState extends HomeAppState {}

class QuickSuggestionErrorStates extends HomeAppState {
  final String error;

  QuickSuggestionErrorStates(this.error);
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

class GetNonReadyQuickSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  GetNonReadyQuickSuccessStates();
}

class GetNonReadyQuickLoadingState extends HomeAppState {}

class GetNonReadyQuickErrorStates extends HomeAppState {
  final String error;

  GetNonReadyQuickErrorStates(this.error);
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

class CancelOrderSuccessStates extends HomeAppState {
  // final LoginModel loginModel;

  CancelOrderSuccessStates();
}

class CancelOrderLoadingState extends HomeAppState {}

class CancelOrderErrorStates extends HomeAppState {
  final String error;

  CancelOrderErrorStates(this.error);
}

class ShopChangePasswordVisibilityState extends HomeAppState {}
