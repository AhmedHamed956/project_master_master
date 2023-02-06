import 'dart:convert';
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Models/Ads_Model.dart';
import 'package:project/src/common/global.dart';
import 'package:project/src/ui/Home/Cubit.dart';
import 'package:project/src/ui/Home/states.dart';
import 'package:project/src/ui/Shared/constant.dart';
import 'package:project/src/ui/navigation_screen/main-screens/quick-screen.dart';
import 'package:project/src/ui/navigation_screen/main-screens/widgets/shop_widget.dart';

import '../../../../Models/model/location_model.dart';
import '../../../../Models/model/shop_model.dart';
import '../../../../generated/l10n.dart';
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

    return BlocListener<HomeCubit, HomeAppState>(
        listener: (context, state) {
          if (state is HomeSuccessStates) {
            setState(() {
              _shops.clear();
              _shops.addAll(state.items ?? []);
            });
          }
          if (state is HomeShopFilterSuccessStates) {
            log("HomeShopFilterSuccessStates");
            setState(() {
              _savedLocation = state.model;
              _shops.clear();
              _shops.addAll(state.items ?? []);
            });
          }

          if (state is GetSavedLocationSuccessStates) {
            if (state.model != null) {
              setState(() {
                _shops.clear();
                _savedLocation = null;
                _savedLocation = state.model;
              });

              if (state.model?.id == 080900100) {
                _homeCubit.getHomeShops();
              } else {
                _homeCubit.getHomeFilterShops(state.model!);
              }
            }
          }

          if (state is AdsSuccessStates) {
            model = HomeCubit.get(context).adsModel;
          }
          if (state is GetCountresSuccessStates) {
            locations.addAll(state.items ?? []);
            if (_savedLocation != null) {
              for (var element in locations) {
                if (element.id == _savedLocation?.id) {
                  _locationModel = element;
                  _homeCubit.getHomeFilterShops(element);
                }
              }
            }
          }
        },
        child: Scaffold(
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
                      Image.asset('assets/icons/location.png',
                          color: textColor),
                      Flexible(
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
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
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                                    BorderRadius.circular(
                                                        10.0)),
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
                                                            color:
                                                                button1color))
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
                                                    BorderRadius.circular(
                                                        10.0)),
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
                                                    Text(
                                                        S.current.digital_gifts,
                                                        style: const TextStyle(
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                button1color))
                                                  ])
                                                ]))))
                              ])),
                    ),
                    Column(children: [
                      HomeCubit.get(context).adsModel?.data != null
                          ? adsScreen(HomeCubit.get(context).adsModel!)
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(10)),
                                  width: MediaQuery.of(context).size.width,
                                  height: 115,
                                  child: const Center(child: Text("No Ads ")))),
                      _shops.isEmpty
                          ? const CircularProgressIndicator()
                          : ListView.separated(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 80),
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => ShopWidget(
                                  model: _shops[index],
                                  location: _savedLocation ??
                                      LocationModel(
                                          latLong: "24.7136,46.6753")),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 12),
                              itemCount: _shops.length)
                    ]),
                  ]))
            ])));
  }

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
      _shops.clear();
      _savedLocation = null;
      _homeCubit.getHomeFilterShops(value);
    });
    String model = json.encode(value);
    await storage.write(key: "myLocation", value: model);
    // myAddress = value?.name;
    // await storage.write(key: "myAddress", value: value?.name);
  }
}
