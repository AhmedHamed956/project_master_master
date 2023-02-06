import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/Models/model/location_model.dart';
import 'package:project/Models/model/shop_model.dart';
import 'package:project/generated/l10n.dart';
import 'package:project/src/common/global.dart';
import 'package:project/src/ui/Shared/constant.dart';
import 'package:project/src/ui/ShopDetails/shopDateils.dart';
import 'package:project/src/ui/location/location_service.dart';

class ShopWidget extends StatefulWidget {
  ShopData model;
  LocationModel location;

  ShopWidget({required this.model, required this.location});

  @override
  State<ShopWidget> createState() => _ShopWidgetState();
}

class _ShopWidgetState extends State<ShopWidget> {
  late ShopData _model;
  int distance = 0;
  LocationService locationService = LocationService();

  @override
  void initState() {
    _model = widget.model;

    log("distance : $distance");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                            ShopDetails(id: _model.id.toString())));
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
                              domainlink + _model.background.toString(),
                              height: 140,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover))))),
          Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              width: MediaQuery.of(context).size.width,
              child: LayoutBuilder(builder: (_, BoxConstraints constraints) {
                return Row(children: [
                  Container(
                      height: constraints.maxWidth * 0.20,
                      width: constraints.maxWidth * 0.20,
                      clipBehavior: Clip.hardEdge,
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(
                                  domainlink + _model.logo.toString()),
                              fit: BoxFit.cover))),
                  const SizedBox(width: 0),
                  Flexible(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Text(_model.storeName.toString(),
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: textColor)),
                        Text(
                            langKey == 'ar'
                                ? _model.categoryData!.translations![0].name
                                    .toString()
                                : _model.categoryData!.translations![1].name
                                    .toString(),
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: textColor)),
                        RatingBarIndicator(
                            rating: double.tryParse(
                                    _model.commissionRate ?? '0.0') ??
                                0.0,
                            unratedColor: Colors.grey,
                            itemCount: 5,
                            itemSize: 14,
                            itemBuilder: (context, int index) {
                              return const Icon(Icons.star,
                                  color: Colors.amber);
                            }),
                      ])),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 8),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(children: [
                              SvgPicture.asset(
                                  'assets/icons/home/location_ic.svg',
                                  height: 16,
                                  width: 16),
                              const SizedBox(width: 6),
                              Text("$distance ${S.current.km}",
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
                              Text("${_model.deliveryTime} ${S.current.min}",
                                  style: const TextStyle(
                                      color: textColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700))
                            ])
                          ]))
                ]);
              }))
        ]));
  }
}
