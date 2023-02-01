import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Models/Ads_Model.dart';
import 'package:project/Models/ClientTrackingOrder_Model.dart';
import 'package:project/Models/Home_Model.dart';
import 'package:project/Models/OrderConfirm_Model.dart';
import 'package:project/Models/Tabs_Details_Model.dart';
import 'package:project/Models/User_Model.dart';
import 'package:project/Models/check_is_represtative_Model.dart';
import 'package:project/Models/countries_Model.dart';
import 'package:project/Models/offers_Model.dart';
import 'package:project/Models/one_offer_Model.dart';
import 'package:project/Models/orders_Model.dart';
import 'package:project/Models/shop_details_Model.dart';
import 'package:project/src/ui/Auth/Cubit/states.dart';
import 'package:project/src/ui/Home/states.dart';
import 'package:project/src/ui/Shared/constant.dart';
import 'package:http_parser/http_parser.dart';
import '../../../Models/GetCartData_Model.dart';
import '../../../Models/GetDigitalData_model.dart';
import '../../../Models/getProfile_Model.dart';
import '../../../Models/get_QuickProduct_model.dart';
import '../../../Models/performance_Model.dart';
import '../../../Models/profile_Gift_Model.dart';
import '../../common/global.dart';
import '../../network/local/cache-helper.dart';
import '../../network/remote/Dio_helper.dart';
import '../../network/remote/endPoint.dart';
import '../Cart_Shops/Add_To_Cart.dart';
import '../ShopDetails/shopDateils.dart';
import '../delivery_package/navigation_screens/delivery_cycle_screen.dart';
import '../navigation_screen/settings/profile/gift-card.dart';

class HomeCubit extends Cubit<HomeAppState> {
  HomeCubit() : super(HomecubitIntialStates());
  static HomeCubit get(context) => BlocProvider.of(context);
  HomeModel? homeModel;
  Future<void> getHomeProduct() async {
    DioHelper.getdata(url: home, token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print(value.data);
      emit(HomeSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(HomeErrorStates(error.toString()));
    });
  }

  CountriesModel? countriesModel;
  Future<void> getCountries() async {
    emit(GetCountresLoadingState());
    DioHelper.getdata(url: countres, token: token).then((value) {
      countriesModel = CountriesModel.fromJson(value.data);
      print(value.data);
      emit(GetCountresSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(GetCountresErrorStates(error.toString()));
    });
  }

  ShopDetailsModel? shopDetailsModel;
  Future<void> shopDetails({@required id}) async {
    emit(ShopDetailsLoadingState());
    DioHelper.getdata(url: 'shop/$id', token: token).then((value) {
      shopDetailsModel = ShopDetailsModel.fromJson(value.data);
      print(value.data);
      emit(ShopDetailsSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(ShopDetailsErrorStates(error.toString()));
    });
  }

  TabsDetailsModel? tabsDetailsModel;
  Future<void> tabdetails({@required id}) async {
    emit(TabDetailsLoadingState());
    DioHelper.getdata(url: 'ShopSubCategoryProducts/$id', token: token)
        .then((value) {
      tabsDetailsModel = TabsDetailsModel.fromJson(value.data);
      print(value.data);
      emit(TabDetailsSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(TabDetailsErrorStates(error.toString()));
    });
  }

  Future<void> postOrder(
      {@required productID, @required quantity, context, id}) async {
    FormData formData = FormData.fromMap(
        {"product_id": productID, "quantity": quantity, 'user_id': 56});
    emit(PostOrderLoadingState());
    print('done');
    DioHelper.postdata(url: addtoCart, data: formData, token: token)
        .then((value) {
      print(value.data);

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
      {@required productID, @required quantity, context, id}) async {
    FormData formData = FormData.fromMap(
        {"product_id": productID, "quantity": quantity, 'user_id': 56});
    emit(PostOrderLoadingState());
    print('done');
    DioHelper.postdata(url: addtoCart, data: formData, token: token)
        .then((value) {
      print(value.data);

      emit(PostOrderSuccessStates());
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => AddToCart(
      //               id: id,
      //             ))).then((value) => HomeCubit()
      //   ..getCartData(
      //     id: id,
      //   ));
    }).catchError((error) {
      emit(PostOrderErrorStates(error.toString()));
    });
  }

  Future<void> postcart(
      {@required productID, @required quantity, context, id}) async {
    FormData formData = FormData.fromMap(
        {"product_id": productID, "quantity": quantity, 'user_id': 56});
    emit(PostCartLoadingState());
    print('done');
    DioHelper.postdata(url: addtoCart, data: formData, token: token)
        .then((value) {
      print(value.data);

      emit(PostCartSuccessStates());
      HomeCubit().getCartData(
        id: 1,
      );
    }).catchError((error) {
      emit(PostCartErrorStates(error.toString()));
    });
  }

  GetCartModel? getCartModel;
  Future<void> getCartData({@required id}) async {
    emit(GetCartLoadingState());
    DioHelper.getdata(url: '${addtoCart}/1', token: token).then((value) {
      getCartModel = GetCartModel.fromJson(value.data);
      print(value.data);
      emit(GetCartSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(GetCartErrorStates(error.toString()));
    });
  }

  Future<void> deleteCartOrder({@required id, @required shopID}) async {
    FormData formData = FormData.fromMap({
      "_method": 'DELETE',
    });
    emit(DeleteCartLoadingState());

    DioHelper.postdata(url: '${addtoCart}/${id}', data: formData, token: token)
        .then((value) {
      print(value.data);

      emit(DeleteCartSuccessStates());
      getCartData(id: shopID);
    }).catchError((error) {
      emit(DeleteCartErrorStates(error.toString()));
    });
  }

  DigitalOrderModel? digitalOrderModel;
  Future<void> getDigitalGiftData() async {
    emit(GetDigitalOrderLoadingState());
    DioHelper.getdata(url: DigitalProducts, token: token).then((value) {
      digitalOrderModel = DigitalOrderModel.fromJson(value.data);
      print(value.data);
      emit(GetDigitalOrderSuccessStates());
    }).catchError((error) {
      print(error.toString());
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
      print(value.data);

      emit(PostDigitalOrderSuccessStates());
    }).catchError((error) {
      emit(PostDigitalOrderErrorStates(error.toString()));
    });
  }

  OrdersModel? ordersModel;
  Future<void> ordersScreen() async {
    emit(OrderScreenLoadingState());
    DioHelper.getdata(url: addtoCart, token: token).then((value) {
      ordersModel = OrdersModel.fromJson(value.data);
      print(value.data);
      emit(OrderScreenSuccessStates());
      print(ordersModel?.data?[1].progress?.first.id);
    }).catchError((error) {
      print(error.toString());
      emit(OrderScreenErrorStates(error.toString()));
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
    print('done');
    DioHelper.postdata(
            url: '${confirmorder}/${id}', data: formData, token: token)
        .then((value) {
      confirmModel = ConfirmModel.fromJson(value.data);
      print(value.data);

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
      print(value.data);
      emit(GetQuickOrderSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(GetQuickOrderErrorStates(error.toString()));
    });
  }

  ProfileGiftModel? profileGiftModel;
  Future<void> getProfieGiftData() async {
    emit(ProfileGiftLoadingState());
    DioHelper.getdata(url: DigitalOrder, token: token).then((value) {
      profileGiftModel = ProfileGiftModel.fromJson(value.data);
      print(value.data);
      emit(ProfileGiftSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(ProfileGiftErrorStates(error.toString()));
    });
  }

  Future<void> postGiftorder(
      {@required context, @required productID, @required amount}) async {
    FormData formData = FormData.fromMap({
      "amount": amount,
    });
    emit(PostGiftOrderLoadingState());
    DioHelper.postdata(
            url: "${postConfirmorder}${productID}",
            data: formData,
            token: token)
        .then((value) {
      print(value.data);

      emit(PostGiftOrderSuccessStates());
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const GiftCardScreen()));
    }).catchError((error) {
      emit(PostGiftOrderErrorStates(error.toString()));
    });
  }

  ProfileModel? profileModel;
  Future<void> getProfieData() async {
    emit(ProfileLoadingState());
    DioHelper.getdata(url: getProfileData, token: token).then((value) {
      profileModel = ProfileModel.fromJson(value.data);
      print(value.data);
      emit(ProfileSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(ProfileErrorStates(error.toString()));
    });
  }

  Future<void> editProfile(
      {@required avatar,
      @required id,
      @required latlong,
      @required name,
      @required email,
      @required phone}) async {
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
          : "",
    });
    emit(PostEditProfileLoadingState());
    await DioHelper.postdata(
            url: "${updateProfileData}/$id", data: formData, token: token)
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
      print(value.data);
      emit(OffersSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(OffersErrorStates(error.toString()));
    });
  }

  OneOffersModel? oneOffersModel;
  Future<void> oneOfferScreen({@required id, @required title}) async {
    emit(OneOffersLoadingState());
    DioHelper.getdata(url: '${oneoffers}/${id}', token: token).then((value) {
      oneOffersModel = OneOffersModel.fromJson(value.data);
      print(value.data);
      emit(OneOffersSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(OneOffersErrorStates(error.toString()));
    });
  }

  AdsModel? adsModel;
  Future<void> getAdsData() async {
    emit(AdsCartLoadingState());
    DioHelper.getdata(url: ads, token: token).then((value) {
      adsModel = AdsModel.fromJson(value.data);
      print(value.data);
      emit(AdsSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(AdsErrorStates(error.toString()));
    });
  }

  PerformanceModel? performanceModel;
  Future<void> getPerformanceData() async {
    emit(GetPerformaceLoadingState());
    DioHelper.getdata(url: getPerfomance, token: token).then((value) {
      performanceModel = PerformanceModel.fromJson(value.data);
      print(value.data);
      emit(GetPerformaceSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(GetPerformaceErrorStates(error.toString()));
    });
  }

  ClientTrakingOrderModel? clientTrakingOrderModel;
  Future<void> getclientTraking({@required id}) async {
    emit(GetClientTrackingLoadingState());
    DioHelper.getdata(url: '${clientTracking}/${id}', token: token)
        .then((value) {
      clientTrakingOrderModel = ClientTrakingOrderModel.fromJson(value.data);
      print(value.data);
      emit(GetClientTrackingSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(GetClientTrackingErrorStates(error.toString()));
    });
  }
  ////////////////////////////////////////

}