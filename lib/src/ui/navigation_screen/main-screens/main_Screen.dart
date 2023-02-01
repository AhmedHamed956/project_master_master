import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/Models/Ads_Model.dart';
import 'package:project/Models/Home_Model.dart';
import 'package:project/src/common/global.dart';
import 'package:project/src/ui/Home/Cubit.dart';
import 'package:project/src/ui/Home/states.dart';

import 'package:project/src/ui/Shared/constant.dart';
import 'package:project/src/ui/navigation_screen/main-screens/quick-screen.dart';
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
  String dropdownValue = "";
  String start = "aaaaaaa";
  @override
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    // /  HomeModel? model;

    return BlocConsumer<HomeCubit, HomeAppState>(
      listener: (context, state) {
        if (state is HomeSuccessStates) {
          // /  model = HomeCubit.get(context).homeModel;
        }
        if (state is AdsSuccessStates) {
          model = HomeCubit.get(context).adsModel;
        }
        if (state is GetCountresSuccessStates) {
          // dropdownValue =
          //     HomeCubit.get(context).countriesModel?.data?.first.name;
          // for (int i = 0;
          //     i < HomeCubit.get(context).countriesModel!.data!.length;
          //     i++) {
          //   list?.add(HomeCubit.get(context).countriesModel?.data?[i].name);
          // }
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: ListView(
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 55,
                  color: appbarcolor,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icons/location.png',
                        color: textColor,
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value:
                              dropdownValue.isNotEmpty ? dropdownValue : null,

                          icon: const Icon(Icons.arrow_drop_down_outlined),
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          //       underline: Container(
                          //         height: 2,
                          //         color: Colors.deepPurpleAccent,
                          //       ),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                          items: HomeCubit.get(context)
                              .countriesModel
                              ?.data
                              ?.map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              value: value.id.toString(),
                              child: ConstrainedBox(
                                  constraints: BoxConstraints(maxWidth: 70),
                                  child: Text(
                                    value.name.toString(),
                                    style: TextStyle(color: textColor),
                                  )),
                            );
                          }).toList(),
                        ),
                      ),
                      Spacer(),
                      Image.asset('assets/icons/bell-ring.png'),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor.withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 8,
                        offset: Offset(0, -4), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 15, left: 15, top: 15),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => QuickScreen()));
                                },
                                child: Container(
                                    height:
                                        MediaQuery.of(context).orientation ==
                                                Orientation.landscape
                                            ? 200
                                            : 135,
                                    width: MediaQuery.of(context).orientation ==
                                            Orientation.landscape
                                        ? 320
                                        : 175,
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
                                                    fontWeight: FontWeight.w500,
                                                    color: button1color))

                                            // const SizedBox(
                                            //   height: 10,
                                            // )
                                          ])
                                        ]))),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DigtalScreen()));
                              },
                              child: Container(
                                  height: MediaQuery.of(context).orientation ==
                                          Orientation.landscape
                                      ? 200
                                      : 135,
                                  width: MediaQuery.of(context).orientation ==
                                          Orientation.landscape
                                      ? 320
                                      : 175,
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
                                                  fontWeight: FontWeight.w500,
                                                  color: button1color))
                                        ])
                                      ])),
                            ),
                          ]),
                    ),
                    ConditionalBuilder(
                        condition: HomeCubit.get(context).adsModel != null &&
                            HomeCubit.get(context).homeModel != null,
                        builder: (context) => Column(
                              children: [
                                HomeCubit.get(context).adsModel?.data != null
                                    ? adsScreen(
                                        HomeCubit.get(context).adsModel!)
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
                                          child: Center(child: Text("No Ads ")),
                                        ),
                                      ),
                                ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => ShopItem(
                                        HomeCubit.get(context)
                                            .homeModel!
                                            .data![index],
                                        index),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 12),
                                    // here u can customize the space.
                                    itemCount: HomeCubit.get(context)
                                        .homeModel!
                                        .data!
                                        .length)
                              ],
                            ),
                        fallback: (context) => Center(
                              child: CircularProgressIndicator(
                                color: button2color,
                              ),
                            )),
                  ],
                ),
              )
            ],
          ),
        );
        // body: ClipRRect(
        //     borderRadius: BorderRadius.only(
        //         topLeft: Radius.circular(10),
        //         topRight: Radius.circular(10)),
        //     child: ListView(children: [
        //       Container(
        //         height: 50,
        //         color: appbarcolor,
        //         child: Row(
        //           children: [
        //             Image.asset('assets/icons/bell-ring.png'),
        //           ],
        //         ),
        //       ),

        //       Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 15),
        //         child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               InkWell(
        //                   onTap: () {
        //                     Navigator.push(
        //                         context,
        //                         MaterialPageRoute(
        //                             builder: (context) => QuickScreen()));
        //                   },
        //                   child: Container(
        //                       height:
        //                           MediaQuery.of(context).orientation ==
        //                                   Orientation.landscape
        //                               ? 200
        //                               : 135,
        //                       width: MediaQuery.of(context).orientation ==
        //                               Orientation.landscape
        //                           ? 320
        //                           : 175,
        //                       padding: const EdgeInsets.symmetric(
        //                           horizontal: 16, vertical: 16),
        //                       decoration: BoxDecoration(
        //                           color: quickcolor,
        //                           borderRadius:
        //                               BorderRadius.circular(10.0)),
        //                       child: Column(
        //                           mainAxisAlignment:
        //                               MainAxisAlignment.center,
        //                           crossAxisAlignment:
        //                               CrossAxisAlignment.center,
        //                           children: [
        //                             Expanded(
        //                                 child: Image.asset(
        //                                     'assets/icons/quickCar.png')),
        //                             const SizedBox(height: 8),
        //                             Row(children: [
        //                               Text(S.current.quick_orders,
        //                                   style: const TextStyle(
        //                                       fontSize: 14.0,
        //                                       fontWeight: FontWeight.w500,
        //                                       color: button1color))

        //                               // const SizedBox(
        //                               //   height: 10,
        //                               // )
        //                             ])
        //                           ]))),
        //               InkWell(
        //                 onTap: () {
        //                   Navigator.push(
        //                       context,
        //                       MaterialPageRoute(
        //                           builder: (context) => DigtalScreen()));
        //                 },
        //                 child: Container(
        //                     height: MediaQuery.of(context).orientation ==
        //                             Orientation.landscape
        //                         ? 200
        //                         : 135,
        //                     width: MediaQuery.of(context).orientation ==
        //                             Orientation.landscape
        //                         ? 320
        //                         : 175,
        //                     padding: const EdgeInsets.symmetric(
        //                         horizontal: 16, vertical: 16),
        //                     decoration: BoxDecoration(
        //                         color: buttonLightcolor,
        //                         borderRadius:
        //                             BorderRadius.circular(10.0)),
        //                     child: Column(
        //                         mainAxisAlignment:
        //                             MainAxisAlignment.center,
        //                         crossAxisAlignment:
        //                             CrossAxisAlignment.center,
        //                         children: [
        //                           Expanded(
        //                               child: Image.asset(
        //                                   'assets/icons/gift.png')),
        //                           const SizedBox(height: 8),
        //                           Row(children: [
        //                             Text(S.current.digital_gifts,
        //                                 style: const TextStyle(
        //                                     fontSize: 14.0,
        //                                     fontWeight: FontWeight.w500,
        //                                     color: button1color))
        //                           ])
        //                         ])),
        //               ),
        //             ]),
        //       ),

        //       ConditionalBuilder(
        //           condition:
        //               // HomeCubit.get(context).adsModel != null &&
        //               HomeCubit.get(context).homeModel != null,
        //           builder: (context) => Column(
        //                 children: [
        //                   // adsScreen(HomeCubit.get(context).adsModel!),
        //                   ListView.separated(
        //                       physics:
        //                           const NeverScrollableScrollPhysics(),
        //                       scrollDirection: Axis.vertical,
        //                       shrinkWrap: true,
        //                       itemBuilder: (context, index) => ShopItem(
        //                           HomeCubit.get(context)
        //                               .homeModel!
        //                               .data![index],
        //                           index),
        //                       separatorBuilder: (context, index) =>
        //                           const SizedBox(height: 12),
        //                       // here u can customize the space.
        //                       itemCount: HomeCubit.get(context)
        //                           .homeModel!
        //                           .data!
        //                           .length)
        //                 ],
        //               ),
        //           fallback: (context) => Center(
        //                 child: CircularProgressIndicator(
        //                   color: button2color,
        //                 ),
        //               )),

        //       // ConditionalBuilder(
        //       //     condition: HomeCubit.get(context).homeModel != null,
        //       //     builder: ((context) => ListView.separated(
        //       //         physics: const NeverScrollableScrollPhysics(),
        //       //         scrollDirection: Axis.vertical,
        //       //         shrinkWrap: true,
        //       //         itemBuilder: (context, index) => ShopItem(
        //       //             HomeCubit.get(context).homeModel!.data![index],
        //       //             index),
        //       //         separatorBuilder: (context, index) =>
        //       //             const SizedBox(height: 12),
        //       //         // here u can customize the space.
        //       //         itemCount: HomeCubit.get(context)
        //       //             .homeModel!
        //       //             .data!
        //       //             .length)),
        //       //     fallback: (context) => Center(
        //       //           child: CircularProgressIndicator(),
        //       //         ))
        //       // ConditionalBuilder(
        //       //   condition: state is! HomeLoadingState,
        //       //   builder: (context) {
        //       //     return ListView.separated(
        //       //         physics: const NeverScrollableScrollPhysics(),
        //       //         scrollDirection: Axis.vertical,
        //       //         shrinkWrap: true,
        //       //         itemBuilder: (context, index) => ShopItem(
        //       //             HomeCubit.get(context)
        //       //                 .homeModel!
        //       //                 .data![index]),
        //       //         separatorBuilder: (context, index) =>
        //       //             const SizedBox(height: 12),
        //       //         // here u can customize the space.
        //       //         itemCount: 10);
        //       //   },
        //       //   fallback: (context) => Center(
        //       //     child: CircularProgressIndicator(),
        //       //   ),
        //       // )
        //     ])));
      },
    );
  }

  Widget ShopItem(HomeData model, int index) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: buttonLightcolor),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShopDetails(
                                id: model.id.toString(),
                              )));
                },
                child: Container(
                  decoration: const BoxDecoration(
                      // color: Colors.red,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Center(
                      child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image.network(
                      '${domainlink + model.background.toString()}',
                      height: 140,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  )),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Container(
                              // height: 57,
                              // width: 55,
                              child: Center(
                                  child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                                height: 57,
                                width: 55,
                                // height: 50,
                                // width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                                '${domainlink + model.logo.toString()}'),
                          ))),
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 200),
                              child: Text(
                                model.storeName.toString(),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: textColor),
                              ),
                            ),
                            Text(
                              langKey == 'ar'
                                  ? model.categoryData!.translations![0].name
                                      .toString()
                                  : model.categoryData!.translations![1].name
                                      .toString(),
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: textColor),
                            ),
                            Row(
                              children: [
                                Text(
                                  "${'(4.8)'}",
                                  style: TextStyle(
                                      color: textColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                Container(
                                  height: 11,
                                  width: 14.25,
                                  child: SvgPicture.asset(
                                    'assets/icons/home/Vector-3.svg',
                                  ),
                                ),
                                Container(
                                  height: 11,
                                  width: 14.25,
                                  child: SvgPicture.asset(
                                    'assets/icons/home/Vector-2.svg',
                                  ),
                                ),
                                Container(
                                  height: 11,
                                  width: 14.25,
                                  child: SvgPicture.asset(
                                    'assets/icons/home/Vector-2.svg',
                                  ),
                                ),
                                Container(
                                  height: 11,
                                  width: 14.25,
                                  child: SvgPicture.asset(
                                    'assets/icons/home/Vector-2.svg',
                                  ),
                                ),
                                Container(
                                  height: 11,
                                  width: 14.25,
                                  child: SvgPicture.asset(
                                    'assets/icons/home/Vector-2.svg',
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 22,
                                width: 21,
                                child: SvgPicture.asset(
                                    'assets/icons/home/location_ic.svg'),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Container(
                                child: Text(
                                  "1.2 ${S.current.km}",
                                  style: TextStyle(
                                      color: textColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 17,
                                width: 18,
                                child: SvgPicture.asset(
                                    'assets/icons/home/Vector-9.svg'),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Container(
                                // height: 19,
                                // width: 45,
                                child: Text(
                                  "${model.deliveryTime} ${S.current.min}",
                                  style: TextStyle(
                                      color: textColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    ///////////////////////////////////

                    /////////////////////////////////////////////////////////
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget adsScreen(AdsModel model) => Align(
        alignment: Alignment.topCenter,
        child: Stack(
          children: [
            Container(
              height: 115,
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
                    autoPlayInterval: Duration(milliseconds: 4000),
                    autoPlayCurve: Curves.easeOutSine,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _sliderPosition = index;
                      });
                    }),
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: DotsIndicator(
                    dotsCount: model.data!.length,
                    position: _sliderPosition.toDouble(),
                    decorator: DotsDecorator(
                        color: buttonLightcolor,
                        activeColor: button1color,
                        size: const Size(6.37, 4.07),
                        activeSize: const Size(6.0, 4.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0))))),
          ],
        ),
      );
}
