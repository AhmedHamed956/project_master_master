import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Models/Home_Model.dart';
import '../../../../Models/model/shop_model.dart';
import '../../../../generated/l10n.dart';
import '../../../common/global.dart';
import '../../Home/Cubit.dart';
import '../../Home/Home.dart';
import '../../Home/states.dart';
import '../../Shared/constant.dart';
import '../../ShopDetails/shopDateils.dart';

class ShopsOffers extends StatefulWidget {
  final String? title;
  const ShopsOffers({super.key, this.title});

  @override
  State<ShopsOffers> createState() => _ShopsOffersState();
}

class _ShopsOffersState extends State<ShopsOffers> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeProduct(),
      child: BlocConsumer<HomeCubit, HomeAppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
              condition: HomeCubit.get(context).homeModel != null,
              builder: (context) {
                return shopOfferScreen(
                  HomeCubit.get(context).homeModel!,
                );
              },
              fallback: ((context) => Container(
                  color: Colors.white,
                  child: Center(
                      child: CircularProgressIndicator(
                    color: button2color,
                  )))));
        },
      ),
    );
  }

  Widget shopOfferScreen(
    HomeModel model,
  ) =>
      Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: appbarcolor,
            leading: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreen(
                              index: 1,
                            )));
              },
              child: Container(
                height: 40,
                width: 40,
                child: Image.asset('assets/icons/arrowBack.png'),
              ),
            ),
            title: Text(
              '${widget.title}',
              style: TextStyle(
                color: textColor,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            centerTitle: true,
          ),
          backgroundColor: mainBackgourndColor,
          body: ListView.separated(
              // physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  shopOfferItem(model.data![index], context),
              separatorBuilder: (context, index) => const SizedBox(height: 21),
              itemCount: model.data!.length));
}

Widget shopOfferItem(ShopData model, context) => Padding(
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
                    width: 405,
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
              width: 405,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                            height: 57,
                            width: 55,
                            child: Center(
                                child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
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
                          Text(
                            model.storeName.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: textColor),
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
                              Container(
                                height: 18.3,
                                width: 29,
                                child: Text(
                                  "${'(4.8)'}",
                                  style: TextStyle(
                                      color: textColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
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
                              height: 19,
                              width: 45,
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
                              height: 19,
                              width: 45,
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
