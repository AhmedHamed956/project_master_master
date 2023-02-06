import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/Models/Ads_Model.dart';
import 'package:project/Models/Home_Model.dart';
import 'package:project/src/common/global.dart';
import 'package:project/src/ui/Home/Cubit.dart';
import 'package:project/src/ui/Home/states.dart';

import 'package:project/src/ui/Shared/constant.dart';
import 'package:project/src/ui/navigation_screen/main-screens/quick-screen.dart';
import '../../../../Models/model/location_model.dart';
import '../../../../Models/model/shop_model.dart';
import '../../../../generated/l10n.dart';
import '../../ShopDetails/shopDateils.dart';
import '../../widgets/shopItem.dart';
import '../../widgets/slider-widget.dart';
import 'digital-Screens/digital-Screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _sliderPosition = 0;
  var model;
  List? list;
  LocationModel? _locationModel;
  LocationModel? _savedLocation;

  String start = "aaaaaaa";
  late HomeCubit _homeCubit;
  List<ShopData> _shops = [];
  List<LocationModel> locations = [];

  @override
  @override
  void initState() {
    _homeCubit = BlocProvider.of<HomeCubit>(context);
    _homeCubit
      ..getHomeShops()
      ..getAdsData()
      ..getCountries()
      ..getSavedLocation();
    super.initState();
  }

  Widget build(BuildContext context) {
    // /  HomeModel? model;

    return BlocConsumer<HomeCubit, HomeAppState>(listener: (context, state) {
      if (state is HomeSuccessStates) {
        _shops.clear();
        _shops.addAll(state.items ?? []);
      }
      if (state is HomeShopFilterSuccessStates) {
        _shops.clear();
        _shops.addAll(state.items ?? []);
      }

      if (state is GetSavedLocationSuccessStates) {
        _savedLocation = state.model;
        if (state.model?.name != null) {
          myAddress = state.model?.name ?? "";
        }
      }

      if (state is AdsSuccessStates) {
        model = HomeCubit.get(context).adsModel;
      }
      if (state is GetCountresSuccessStates) {
        locations.addAll(state.items ?? []);
        if (_savedLocation != null) {
          _homeCubit.getHomeFilterProduct(_savedLocation!.id.toString());
          for (var element in locations) {
            if (element.id == _savedLocation?.id) {
              _locationModel = element;
            }
          }
        }
      }
    }, builder: (context, state) {
      return Scaffold(
          body: ListView(
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
            Container(
                height: 55,
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                color: appbarcolor,
                child: Row(children: [
                  Flexible(
                      child: Row(children: [
                    Image.asset('assets/icons/location.png', color: textColor),
                    Flexible(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: DropdownButtonHideUnderline(
                                child: DropdownButton<LocationModel>(
                                    value: _locationModel,
                                    // selectedItemBuilder: _selectedItemBuilder,
                                    icon: const Icon(
                                        Icons.arrow_drop_down_outlined),
                                    elevation: 16,
                                    onChanged: _onDropDownChange,
                                    isExpanded: true,
                                    items: locations
                                        .map<DropdownMenuItem<LocationModel>>(
                                            (value) {
                                      return DropdownMenuItem<LocationModel>(
                                          value: value,
                                          child: Text(value.name.toString(),
                                              maxLines: 1,
                                              style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                color: Colors.deepPurple,
                                                // color: textColor
                                              )));
                                    }).toList()))))
                  ])),
                  // const Spacer(),
                  Image.asset('assets/icons/bell-ring.png'),
                ])),
            Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: shadowColor.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 8,
                          offset: const Offset(0, -4))
                    ],
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 16, left: 16, top: 15),
                    child: SizedBox(
                        height: 130,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const QuickScreen()));
                                      },
                                      child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 16),
                                          decoration: BoxDecoration(
                                              color: quickcolor,
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                    child: Image.asset(
                                                        'assets/icons/quickCar.png')),
                                                const SizedBox(height: 8),
                                                Row(children: [
                                                  Text(S.current.quick_orders,
                                                      style: const TextStyle(
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: button1color))
                                                ])
                                              ])))),
                              const SizedBox(width: 16),
                              Expanded(
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const DigtalScreen()));
                                      },
                                      child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 16),
                                          decoration: BoxDecoration(
                                              color: buttonLightcolor,
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                    child: Image.asset(
                                                        'assets/icons/gift.png')),
                                                const SizedBox(height: 8),
                                                Row(children: [
                                                  Text(S.current.digital_gifts,
                                                      style: const TextStyle(
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: button1color))
                                                ])
                                              ]))))
                            ])),
                  ),
                  ConditionalBuilder(
                      condition: HomeCubit.get(context).adsModel != null &&
                          _shops.isNotEmpty,
                      builder: (context) => Column(children: [
                            HomeCubit.get(context).adsModel?.data != null
                                ? adsScreen(HomeCubit.get(context).adsModel!)
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 115,
                                        child: const Center(
                                            child: Text("No Ads ")))),
                            ListView.separated(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 0, 16, 80),
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemBuilder: (context, index) =>
                                    ShopItem(_shops[index], index),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 12),
                                itemCount: _shops.length)
                          ]),
                      fallback: (context) => const Center(
                          child:
                              CircularProgressIndicator(color: button2color)))
                ]))
          ]));
    });
  }

  Widget ShopItem(ShopData model, int index) => Container(
      decoration: BoxDecoration(
          border: Border.all(color: buttonLightcolor),
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ShopDetails(id: model.id.toString())));
            },
            child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Center(
                    child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: Image.network(
                            domainlink + model.background.toString(),
                            height: 140,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover))))),
        Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: Row(children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Center(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                              height: 57,
                              width: 55,
                              // height: 50,
                              // width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                              domainlink + model.logo.toString())))),
              const SizedBox(width: 9),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(model.brandName.toString(),
                        maxLines: 1,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: textColor)),
                    Text(
                        langKey == 'ar'
                            ? model.categoryData!.translations![0].name
                                .toString()
                            : model.categoryData!.translations![1].name
                                .toString(),
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: textColor)),
                    RatingBarIndicator(
                        rating:
                            double.tryParse(model.commissionRate ?? '0.0') ??
                                0.0,
                        unratedColor: Colors.grey,
                        itemCount: 5,
                        itemSize: 14,
                        itemBuilder: (BuildContext context, int index) {
                          return const Icon(Icons.star, color: Colors.amber);
                        }),
                  ]),
              Spacer(),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(children: [
                          SvgPicture.asset('assets/icons/home/location_ic.svg',
                              height: 16, width: 16),
                          const SizedBox(width: 6),
                          Text("1.2 ${S.current.km}",
                              style: const TextStyle(
                                  color: textColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700))
                        ]),
                        const SizedBox(height: 4),
                        Row(children: [
                          SvgPicture.asset('assets/icons/home/Vector-9.svg',
                              height: 14, width: 14),
                          const SizedBox(width: 6),
                          Text("${model.deliveryTime} ${S.current.min}",
                              style: const TextStyle(
                                  color: textColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700))
                        ])
                      ]))
            ]))
      ]));

  Widget adsScreen(AdsModel model) => Stack(children: [
        SizedBox(
            height: 125,
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider.builder(
                itemCount: model.data!.length,
                itemBuilder: (BuildContext context, int index, int idx) {
                  return SliderWidget(model: model.data![index]);
                },
                options: CarouselOptions(
                    viewportFraction: 1,
                    initialPage: 0,
                    // enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    autoPlay: true,
                    enableInfiniteScroll: true,
                    autoPlayInterval: const Duration(milliseconds: 4000),
                    autoPlayCurve: Curves.easeOutSine,
                    onPageChanged: (index, reason) {
                      setState(() => _sliderPosition = index);
                    }))),
        Positioned(
            bottom: 16,
            right: 0,
            left: 0,
            child: DotsIndicator(
                dotsCount: model.data!.length,
                position: _sliderPosition.toDouble(),
                decorator: DotsDecorator(
                    color: buttonLightcolor,
                    activeColor: button1color,
                    size: const Size(5, 5),
                    activeSize: const Size(5, 5),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)))))
      ]);

  void _onDropDownChange(LocationModel? value) async {
    setState(() {
      _locationModel = value!;
      _homeCubit.getHomeFilterProduct(value.id.toString());
    });
    String model = json.encode(value);
    await storage.write(key: "myLocation", value: model);
    myAddress = value?.name;
    await storage.write(key: "myAddress", value: value?.name);
  }
}
