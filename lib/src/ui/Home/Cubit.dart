import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:project/Models/Ads_Model.dart';

// import 'package:project/Models/ClientTrackingOrder_Model.dart';
import 'package:project/Models/Home_Model.dart';
import 'package:project/Models/OrderConfirm_Model.dart';
import 'package:project/Models/Tabs_Details_Model.dart';
import 'package:project/Models/digitalShopRating_model.dart';
import 'package:project/Models/location_response.dart';
import 'package:project/Models/offers_Model.dart';
import 'package:project/Models/one_offer_Model.dart';
import 'package:project/Models/orders_response.dart';
import 'package:project/Models/response/HomeShopFilter.dart';
import 'package:project/Models/response/confirm_digetal_gift_response.dart';
import 'package:project/Models/shop_details_Model.dart';
import 'package:project/Models/suggest_search_response.dart';
import 'package:project/src/ui/Home/Home.dart';
import 'package:project/src/ui/Home/states.dart';
import 'package:project/src/ui/Shared/constant.dart';
import 'package:project/src/ui/navigation_screen/main-screens/Quick-Screens/Quick-Tracking.dart';
import 'package:project/src/ui/navigation_screen/settings/profile/gift-card-rating.dart';
import 'package:project/src/ui/widgets/card-widget.dart';
import 'package:project/src/ui/widgets/widgets.dart';

import '../../../Models/GetCartData_response.dart';
import '../../../Models/GetDigitalData_model.dart';
import '../../../Models/getNonReadyQuick.dart';
import '../../../Models/getProfile_Model.dart';
import '../../../Models/get_QuickProduct_model.dart';
import '../../../Models/home_shops_filter_response.dart';
import '../../../Models/model/location_model.dart';
import '../../../Models/model/quick_suggestion_model.dart';
import '../../../Models/performance_Model.dart';
import '../../../Models/profile_Gift_Model.dart';
import '../../../Models/response/ClientTrackingOrderResponse.dart';
import '../../../Models/suggestionHomeProduct.dart';
import '../../common/global.dart';
import '../../network/remote/Dio_helper.dart';
import '../../network/remote/endPoint.dart';
import '../Cart_Shops/Add_To_Cart.dart';
import '../navigation_screen/settings/profile/gift-card.dart';

class HomeCubit extends Cubit<HomeAppState> {
  HomeCubit() : super(HomecubitIntialStates());

  static HomeCubit get(context) => BlocProvider.of(context);
  HomeModel? homeModel;

  Future<void> getHomeShops() async {
    DioHelper.getdata(url: home, token: token).then((value) {
      HomeModel homeModel = HomeModel.fromJson(value.data);
      // log("getHomeProduct ${jsonEncode(value.data)}");
      emit(HomeSuccessStates(items: homeModel.data));
    }).catchError((error, s) {
      log("getHomeProduct $error $s");
      emit(HomeErrorStates(error.toString()));
    });
  }

  // Future<void> getHomeFilterProduct(String cityId) async {
  //   DioHelper.getdata(url: homeFilterProduct + cityId, token: token)
  //       .then((value) {
  //     HomeShopsFilterResponse homeShopsFilterResponse =
  //         HomeShopsFilterResponse.fromJson(value.data);
  //     log("getHomeFilterProduct ${jsonEncode(value.data)}");
  //     emit(HomeShopFilterSuccessStates(
  //         items: homeShopsFilterResponse.data?.shops));
  //   }).catchError((error, s) {
  //     log("getHomeFilterProduct $error $s");
  //     emit(HomeErrorStates(error.toString()));
  //   });
  // }

  Future<void> getHomeFilterShops(LocationModel model) async {
    DioHelper.getdata(
            url: homeFilterProduct + model.id.toString(), token: token)
        .then((value) {
      log("getHomeFilterProduct ${jsonEncode(value.data)}");
      HomeShopFilter homeShopsFilterResponse =
          HomeShopFilter.fromJson(value.data);
      emit(HomeShopFilterSuccessStates(
          items: homeShopsFilterResponse.data?[0].shops, model: model));
    }).catchError((error, s) {
      log("getHomeFilterProduct $error $s");
      emit(HomeErrorStates(error.toString()));
    });
  }

  Future<void> getSavedLocation() async {
    LocationModel? locationModel;
    String? sName;
    sName = await storage.read(key: "myLocation");
    if (sName != null) {
      locationModel = LocationModel.fromJson(json.decode(sName));
      print("currentLocation = ${locationModel.toJson()}");
    } else {
      locationModel = null;
    }
    emit(GetSavedLocationSuccessStates(model: locationModel));
  }

  Future<void> getCountries() async {
    emit(GetCountresLoadingState());
    DioHelper.getdata(url: countres, token: token).then((value) {
      // log("getCountries ${jsonEncode(value.data)}");
      LocationResponse? locationsResponse =
          LocationResponse.fromJson(value.data);
      emit(GetCountresSuccessStates(items: locationsResponse.data));
    }).catchError((error) {
      log(error.toString());
      emit(GetCountresErrorStates(error.toString()));
    });
  }

  Future<void> getLocations() async {
    DioHelper.getdata(url: countres, token: token).then((value) {
      LocationResponse? locationsResponse;
      locationsResponse = LocationResponse.fromJson(value.data);
      emit(GetLocationsSuccessStates(locationsResponse.data ?? []));
    }).catchError((error) {
      log("getLocations $error");
      emit(GetCountresErrorStates(error.toString()));
    });
  }

  Future<List<String>> suggestSearch(String search) async {
    SuggestSearchResponse? searchResponse;
    await DioHelper.getdata(url: countres, token: token).then((value) {
      searchResponse = SuggestSearchResponse.fromJson(value.data);

      // log(value.data);
    }).catchError((error) {
      log(error.toString());
      // emit(GetCountresErrorStates(error.toString()));
    });
    return searchResponse?.data ?? [];
  }

  ShopDetailsModel? shopDetailsModel;

  Future<void> shopDetails({@required id}) async {
    emit(ShopDetailsLoadingState());
    DioHelper.getdata(url: 'shop/$id', token: token).then((value) {
      shopDetailsModel = ShopDetailsModel.fromJson(value.data);
      // log("shopDetails ${jsonEncode(value.data)}");
      emit(ShopDetailsSuccessStates());
    }).catchError((error, s) {
      log("shopDetails $error $s");
      emit(ShopDetailsErrorStates(error.toString()));
    });
  }

  SuggestionHomeProductModel? suggestionHomeProductModel;

  Future<void> getSuggestionHomeShop({@required id}) async {
    DioHelper.getdata(url: '$suggestionHome/$id', token: token).then((value) {
      suggestionHomeProductModel =
          SuggestionHomeProductModel.fromJson(value.data);

      emit(ShopSuggestionSuccessStates());
    }).catchError((error, s) {
      log("shopDetails $error $s");
      emit(ShopSuggestionErrorStates(error.toString()));
    });
  }

  TabsDetailsModel? tabsDetailsModel;

  Future<void> tabdetails({@required id}) async {
    emit(TabDetailsLoadingState());
    DioHelper.getdata(url: 'ShopSubCategoryProducts/$id', token: token)
        .then((value) {
      tabsDetailsModel = TabsDetailsModel.fromJson(value.data);
      // log("tabdetails ${jsonEncode(value.data)}");
      emit(TabDetailsSuccessStates());
    }).catchError((error, s) {
      log("tabdetails $error $s");
      emit(TabDetailsErrorStates(error.toString()));
    });
  }

  QuickSuggestionModel? suggestionModel;

  Future<void> quickSuggestion({@required id}) async {
    emit(QuickSuggestionLoadingState());
    DioHelper.getdata(url: '$quicksuggestion/$id', token: token).then((value) {
      suggestionModel = QuickSuggestionModel.fromJson(value.data);
      print(value.data);
      emit(QuickSuggestionSuccessStates());
    }).catchError((error, s) {
      emit(QuickSuggestionErrorStates(error.toString()));
    });
  }

  Future<void> postOrder(
      {@required productID,
      @required quantity,
      @required scheduler,
      @required time,
      context,
      id}) async {
    FormData formData = FormData.fromMap({
      "product_id": productID,
      "quantity": quantity,
      'scheduler': scheduler,
      "time": time
    });
    emit(PostOrderLoadingState());
    log('done');
    DioHelper.postdata(url: addtoCart, data: formData, token: token)
        .then((value) {
      log(value.data);

      emit(PostOrderSuccessStates());
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AddToCart(
                    id: id,
                  ))).then((value) => HomeCubit()
        ..getCartData(
          id: id,
        ));
    }).catchError((error) {
      emit(PostOrderErrorStates(error.toString()));
    });
  }

  Future<void> postQuickOrder(
      {@required productID, @required quantity, isQiuck, quickid}) async {
    FormData formData = FormData.fromMap({
      "product_id": productID,
      "quantity": quantity,
      'is_quick': isQiuck,
      'quick_id': quickid
    });
    emit(PosQuickOrderLoadingState());
    // log('done');
    DioHelper.postdata(url: addtoCart, data: formData, token: token)
        .then((value) {
      print(value.data);

      emit(PosQuickOrderSuccessStates());
    }).catchError((error) {
      emit(PosQuickOrderErrorStates(error.toString()));
    });
  }

  Future<void> giveDigitalOrderrating(
      {@required id, @required rating, note}) async {
    FormData formData =
        FormData.fromMap({"product_id": id, "rating": rating, 'note': note});
    emit(PosRatLoadingState());

    DioHelper.postdata(
            url: '$digitalOrderrating/$id', data: formData, token: token)
        .then((value) {
      print(value.data);

      emit(PosRatSuccessStates());
    }).catchError((error) {
      emit(PosRatErrorStates(error.toString()));
    });
  }

  Future<void> postnonReadyQuickOrder(
      {@required productID, @required quantity, context}) async {
    FormData formData = FormData.fromMap({
      "product_id": productID,
      "quantity": quantity,
    });
    emit(ReadyQuickPostOrderLoadingState());

    DioHelper.postdata(url: readyQuick, data: formData, token: token)
        .then((value) {
      print(value.data);

      emit(ReadyQuickPostOrderSuccessStates());
    }).catchError((error) {
      emit(ReadyQuickPostOrderErrorStates(error.toString()));
    });
  }

  GetnonReadyQuickModel? getnonReadyQuickModel;

  Future<void> getNonReadyQuickData() async {
    emit(GetNonReadyQuickLoadingState());
    DioHelper.getdata(
      url: readyQuick,
      token: token,
    ).then((value) {
      getnonReadyQuickModel = GetnonReadyQuickModel.fromJson(value.data);
      int? stepper = getnonReadyQuickModel?.data?.first.step;

      print(value.data);
      emit(GetNonReadyQuickSuccessStates(stepper: stepper ?? 1));
    }).catchError((error) {
      print(error.toString());
      emit(GetNonReadyQuickErrorStates(error.toString()));
    });
  }

  Future<void> postcart(
      {@required productID,
      @required quantity,
      @required scheduler,
      @required time,
      context,
      id}) async {
    FormData formData = FormData.fromMap({
      "product_id": productID,
      "quantity": quantity,
      'scheduler': scheduler,
      'time': time
    });
    emit(PostCartLoadingState());
    log('done');
    DioHelper.postdata(url: addtoCart, data: formData, token: token)
        .then((value) {
      log(value.data);

      emit(PostCartSuccessStates());
      HomeCubit().getCartData(
        id: id,
      );
    }).catchError((error) {
      emit(PostCartErrorStates(error.toString()));
    });
  }

  Future<void> updateCart(
      {required productID, required quantity, scheduler, time, context,id}) async {
    FormData formData = FormData.fromMap({
      "product_id": productID,
      "quantity": quantity,
      'scheduler': scheduler,
      'time': time
    });
    log('done');
    DioHelper.postdata(url: addtoCart, data: formData, token: token)
        .then((value) {
      log("updateCart ${value.data}");
      HomeCubit().getCartData(id: id);
      emit(UpdateCartSuccessStates(quantity: quantity));
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>
          // AddToCart(id: model.data!.id)
          CardWidget(shopId: id!)
      ));
    }).catchError((error) {
      emit(PostCartErrorStates(error.toString()));
    });
  }

  GetCartResponse? getCartModel;

  Future<void> getCartData({required id}) async {
    emit(GetCartLoadingState());
    DioHelper.getdata(url: '$addtoCart/$id', token: token).then((value) {
      getCartModel = GetCartResponse.fromJson(value.data);
      log("getCartData ${jsonEncode(value.data)}");
      emit(GetCartSuccessStates(getCartModel?.data?.first));
    }).catchError((error, s) {
      log("getCartData $error $s");
      emit(GetCartErrorStates(error.toString()));
    });
  }

  Future<void> deleteCartOrder({@required id, @required shopID}) async {
    FormData formData = FormData.fromMap({
      "_method": 'DELETE',
    });
    emit(DeleteCartLoadingState());

    DioHelper.postdata(url: '$addtoCart/$id', data: formData, token: token)
        .then((value) {
      log(value.data);

      emit(DeleteCartSuccessStates());
      getCartData(id: shopID);
    }).catchError((error) {
      emit(DeleteCartErrorStates(error.toString()));
    });
  }

  Future<void> giveShopAndDeliveryRating(
      {@required id,
      @required shopRate,
      @required noteRate,
      @required ratingdelivery,
      @required notedelivery,
      context}) async {
    FormData formData = FormData.fromMap({
      "order_id": id,
      "rating_shop": shopRate,
      "note_shop": noteRate,
      "rating_delivery": ratingdelivery,
      "note_delivery": notedelivery,
    });
    emit(GiveRatingLoadingState());

    await DioHelper.postdata(url: giverating, data: formData, token: token)
        .then((value) {
      print(value.data);

      emit(GiveRatingSuccessStates());
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(
                    index: 3,
                  )));
    }).catchError((error) {
      emit(DGiveRatingErrorStates(error.toString()));
    });
  }

  DigitalOrderModel? digitalOrderModel;

  Future<void> getDigitalGiftData() async {
    emit(GetDigitalOrderLoadingState());
    DioHelper.getdata(url: DigitalProducts, token: token).then((value) {
      digitalOrderModel = DigitalOrderModel.fromJson(value.data);
      log(value.data);
      emit(GetDigitalOrderSuccessStates());
    }).catchError((error) {
      log(error.toString());
      emit(GetDigitalOrderErrorStates(error.toString()));
    });
  }

  Future<void> postdigitalorder(
      {@required productID,
      @required price,
      @required name,
      @required phone}) async {
    FormData formData = FormData.fromMap({
      "digital_product_id": productID,
      "price": price,
      'name': name,
      'phone': phone
    });
    emit(PostDigitalOrderLoadingState());
    DioHelper.postdata(url: DigitalOrder, data: formData, token: token)
        .then((value) {
      log("postdigitalorder ${jsonEncode(value.data)}");

      ConfirmDigitalGiftResponse confirmDigitalGiftResponse =
          ConfirmDigitalGiftResponse.fromJson(value.data);
      showSnackBar(
          title:
              langKey == 'ar' ? "تم ارسال الهدية" : "The gift has been sent");

      // showSnackBar(title: confirmDigitalGiftResponse.message ?? "");
      emit(PostDigitalOrderSuccessStates());
    }).catchError((error, s) {
      log("postdigitalorder $error $s");
      emit(PostDigitalOrderErrorStates(error.toString()));
    });
  }

  Future<void> updateScaduale(
      {@required id, @required schedule, context}) async {
    FormData formData = FormData.fromMap({
      "scheduler": schedule,
      "_method": 'PUT',
    });
    emit(UpdateScadualeLoadingState());
    DioHelper.postdata(url: '$addtoCart/$id', data: formData, token: token)
        .then((value) {
      emit(UpdateScadualeSuccessStates());
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(index: 3, schadular: true)));
      showSnackBar(
          title: langKey == 'ar'
              ? "تم جدولة الطلب"
              : "the order has been scheduled");
      // Navigator.pop(
      //   context,
      // );
    }).catchError((error, s) {
      log("postdigitalorder $error $s");
      emit(UpdateScadualeErrorStates(error.toString()));
    });
  }

  // OrdersModel? ordersModel;

  // Future<void> ordersScreen() async {
  //   emit(OrderScreenLoadingState());
  //   DioHelper.getdata(url: addtoCart, token: token).then((value) {
  //     ordersModel = OrdersModel.fromJson(value.data);
  //     log("ordersScreen${jsonEncode(value.data)}");
  //     emit(OrderScreenSuccessStates());
  //     log("${ordersModel?.data?[1].progress?.first.id}");
  //   }).catchError((error, s) {
  //     log("ordersScreenError : $error  $s");
  //     emit(OrderScreenErrorStates(error.toString()));
  //   });
  // }

  OrdersResponse? ordersModel;

  Future<void> ordersScreen() async {
    emit(OrderScreenLoadingState());
    await DioHelper.getdata(url: addtoCart, token: token).then((value) {
      ordersModel = OrdersResponse.fromJson(value.data);
      log("ordersScreen${jsonEncode(value.data)}");
      emit(OrderScreenSuccessStates());
      // log("${ordersModel?.data?[1].progress?.first.id}");
    }).catchError((error, s) {
      log("ordersScreenError : $error  $s");
      emit(OrderScreenErrorStates(error.toString()));
    });
  }

  Future<void> cancelOrder({
    @required id,
  }) async {
    FormData formData = FormData.fromMap({});
    emit(CancelOrderLoadingState());

    DioHelper.postdata(url: '$cancelorder/$id', data: formData, token: token)
        .then((value) {
      confirmModel = ConfirmModel.fromJson(value.data);
      print(value.data);

      emit(CancelOrderSuccessStates());
      showSnackBar(
          title: langKey == 'ar'
              ? "تم إلغاء الطلب"
              : "the request has been canceled");
    }).catchError((error) {
      emit(CancelOrderErrorStates(error.toString()));
    });
  }

  ConfirmModel? confirmModel;

  Future<void> confirmOrder(
      {context,
      @required id,
      @required typesend,
      @required name,
      @required phone,
      @required map,
      @required typepay}) async {
    FormData formData = FormData.fromMap({
      "type_send": typesend,
      "name": name,
      'phone': phone,
      'map': map,
      'type_pay': typepay
    });
    emit(ConfirmOrderLoadingState());
    log('done');
    DioHelper.postdata(url: '$confirmorder/$id', data: formData, token: token)
        .then((value) {
      confirmModel = ConfirmModel.fromJson(value.data);
      log(value.data);

      emit(ConfirmOrderSuccessStates());

      // Navigator.pushReplacement<void, void>(
      //   context,
      //   MaterialPageRoute<void>(
      //     builder: (BuildContext context) => ShopDetails(
      //       id: id.toString(),
      //     ),
      //   ),
      // );
    }).catchError((error) {
      emit(ConfirmOrderErrorStates(error.toString()));
    });
  }

  GetQuickModel? getQuickModel;

  Future<void> getQuickData() async {
    emit(GetQuickOrderLoadingState());
    DioHelper.getdata(url: quickProducts, token: token).then((value) {
      getQuickModel = GetQuickModel.fromJson(value.data);
      log(value.data);
      emit(GetQuickOrderSuccessStates());
    }).catchError((error) {
      log(error.toString());
      emit(GetQuickOrderErrorStates(error.toString()));
    });
  }

  ProfileGiftModel? profileGiftModel;

  Future<void> getProfieGiftData() async {
    emit(ProfileGiftLoadingState());
    DioHelper.getdata(url: DigitalOrder, token: token).then((value) {
      profileGiftModel = ProfileGiftModel.fromJson(value.data);
      log(value.data);
      emit(ProfileGiftSuccessStates());
    }).catchError((error) {
      log(error.toString());
      emit(ProfileGiftErrorStates(error.toString()));
    });
  }

  Future<void> postGiftorder(
      {@required context, @required productID, @required amount}) async {
    FormData formData = FormData.fromMap({"amount": amount});
    emit(PostGiftOrderLoadingState());
    DioHelper.postdata(
            url: "$postConfirmorder$productID", data: formData, token: token)
        .then((value) {
      log("postGiftorder ${jsonEncode(value.data)}");

      ConfirmDigitalGiftResponse response =
          ConfirmDigitalGiftResponse.fromJson(value.data);
      emit(PostGiftOrderSuccessStates(message: response.message ?? ""));

      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            content: Container(
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.check_circle_rounded,
                    color: button2color,
                    size: 20,
                  ),
                  // Container(
                  //   margin: const EdgeInsets.all(100.0),
                  //   decoration: const BoxDecoration(
                  //       gradient: LinearGradient(
                  //           begin: Alignment.topRight,
                  //           end: Alignment.bottomLeft,
                  //           colors: [button2color, button1color]),
                  //       shape: BoxShape.circle),
                  //       child: Center(child: Icon(Icons.check_circle_rounded)),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    langKey == 'ar'
                        ? "تم الدفع من خلال القسيمة بنجاح!"
                        : "Payment is Confirmed",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: button2color),
                  ),
                ],
              ),
            ),
          );
        },
      ).then((value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    GiftCardRating(productID: productID.toString())));
      });
    }).catchError((error, s) {
      log("postGiftorder $error $s");
      emit(PostGiftOrderErrorStates(error.toString()));
    });
  }

  ProfileModel? profileModel;

  Future<void> getProfieData() async {
    emit(ProfileLoadingState());
    DioHelper.getdata(url: getProfileData, token: token).then((value) {
      profileModel = ProfileModel.fromJson(value.data);
      // log(value.data);
      emit(ProfileSuccessStates());
    }).catchError((error, s) {
      log("getProfieData $error $s");
      emit(ProfileErrorStates(error.toString()));
    });
  }

  Future<void> editProfile({
    @required avatar,
    @required id,
    @required latlong,
    @required name,
    @required email,
    @required phone,
    @required nonchange,
  }) async {
    emit(PostEditProfileLoadingState());
    // FormData formData = FormData.fromMap({
    //   "avatar": avatar,
    //   // "map": latlong
    // });

    FormData formData = FormData.fromMap({
      "name": name,
      "phone": phone,
      "email": email,
      "map": '$latlong',
      "avatar": avatar != null
          ? await MultipartFile.fromFile(
              avatar,
              filename: '/image',
              contentType: MediaType("image", "png"),
            )
          : "${nonchange}",
    });

    await DioHelper.postdata(
            url: "$updateProfileData/4", data: formData, token: token)
        .then((value) {
      print(value.data);
      emit(PostEditProfileSuccessStates());
    }).catchError((error) {
      emit(PostEditProfileErrorStates(error.toString()));
    });
  }

  OffersModel? offersModel;

  Future<void> offerScreen() async {
    emit(OffersLoadingState());
    DioHelper.getdata(url: offers, token: token).then((value) {
      offersModel = OffersModel.fromJson(value.data);
      log(value.data);
      emit(OffersSuccessStates());
    }).catchError((error) {
      log(error.toString());
      emit(OffersErrorStates(error.toString()));
    });
  }

  OneOffersModel? oneOffersModel;

  Future<void> oneOfferScreen({@required id, @required title}) async {
    emit(OneOffersLoadingState());
    DioHelper.getdata(url: '$oneoffers/$id', token: token).then((value) {
      oneOffersModel = OneOffersModel.fromJson(value.data);
      log(value.data);
      emit(OneOffersSuccessStates());
    }).catchError((error) {
      log(error.toString());
      emit(OneOffersErrorStates(error.toString()));
    });
  }

  AdsModel? adsModel;

  Future<void> getAdsData() async {
    emit(AdsCartLoadingState());
    DioHelper.getdata(url: ads, token: token).then((value) {
      adsModel = AdsModel.fromJson(value.data);
      log(value.data);
      emit(AdsSuccessStates());
    }).catchError((error) {
      log(error.toString());
      emit(AdsErrorStates(error.toString()));
    });
  }

  PerformanceModel? performanceModel;

  Future<void> getPerformanceData() async {
    emit(GetPerformaceLoadingState());
    DioHelper.getdata(url: getPerfomance, token: token).then((value) {
      performanceModel = PerformanceModel.fromJson(value.data);
      log(value.data);
      emit(GetPerformaceSuccessStates());
    }).catchError((error) {
      log(error.toString());
      emit(GetPerformaceErrorStates(error.toString()));
    });
  }

  // ClientTrakingOrderModel? clientTrakingOrderModel;

  // Future<void> getclientTraking({@required id}) async {
  //   emit(GetClientTrackingLoadingState());
  //   DioHelper.getdata(url: '$clientTracking/$id', token: token).then((value) {
  //     clientTrakingOrderModel = ClientTrakingOrderModel.fromJson(value.data);
  //     log("getclientTraking ${jsonEncode(value.data)}");

  //     emit(GetClientTrackingSuccessStates());
  //   }).catchError((error) {
  //     log(error.toString());
  //     emit(GetClientTrackingErrorStates(error.toString()));
  //   });
  // }

  ClientTrackingOrderResponse? clientTrackingOrderResponse;

  Future<void> getclientTraking({required id}) async {
    emit(GetClientTrackingLoadingState());
    DioHelper.getdata(url: '$clientTracking/$id', token: token).then((value) {
      clientTrackingOrderResponse =
          ClientTrackingOrderResponse.fromJson(value.data);
      log("getclientTraking ${jsonEncode(value.data)}");

      emit(GetClientTrackingSuccessStates());
    }).catchError((error, t) {
      log("getclientTraking $error , $t");
      emit(GetClientTrackingErrorStates(error.toString()));
    });
  }

  DigitalShopRatingModel? digitalShopRatingModel;

  Future<void> digitalShopRating({@required productID}) async {
    emit(GetdigitalShopRatingLoadingState());
    DioHelper.getdata(url: '$digitalshoprating/$productID', token: token)
        .then((value) {
      digitalShopRatingModel = DigitalShopRatingModel.fromJson(value.data);
      print(value.data);
      emit(GetdigitalShopRatingsuccessStates());
    }).catchError((error) {
      log(error.toString());
      emit(GetdigitalShopRatingErrorStates(error.toString()));
    });
  }
////////////////////////////////////////
}
