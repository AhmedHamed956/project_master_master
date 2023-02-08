import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project/src/ui/Home/Cubit.dart';
import 'package:project/src/ui/Home/states.dart';
import 'package:project/src/ui/components/component.dart';
import 'package:project/src/ui/navigation_screen/settings/profile/gift-card.dart';

import '../../../../../generated/l10n.dart';
import '../../../Shared/constant.dart';
import '../../../components/appar.dart';

class GiftCardRating extends StatefulWidget {
  final String? productID;
  const GiftCardRating({this.productID});

  @override
  State<GiftCardRating> createState() => _GiftCardRatingState();
}

class _GiftCardRatingState extends State<GiftCardRating> {
  TextEditingController noteController = TextEditingController();
  double? rating;
  double? getrating;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            HomeCubit()..digitalShopRating(productID: widget.productID),
        child: BlocConsumer<HomeCubit, HomeAppState>(
          listener: (context, state) {
            if (state is PosRatSuccessStates) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => GiftCardScreen()));
            }
          },
          builder: (context, state) {
            return ConditionalBuilder(
              condition: HomeCubit.get(context).digitalShopRatingModel != null,
              builder: (context) {
                getrating =
                    HomeCubit.get(context).digitalShopRatingModel?.data?.rating;
                return Scaffold(
                  body: ListView(children: [
                    AppBarWidget(
                        label: S.current.gift_cards, type: 'gift_card'),
                    const SizedBox(height: 35),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: shadowColor.withOpacity(0.1),
                                spreadRadius: 0,
                                blurRadius: 8,
                                offset: const Offset(0, -4))
                          ],
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              // height: 280,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: buttonLightcolor)),
                              child: Column(children: [
                                Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 133,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            topLeft: Radius.circular(10)),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "${domainlink}${HomeCubit.get(context).digitalShopRatingModel?.data?.image}"),
                                            fit: BoxFit.fill))),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            '${HomeCubit.get(context).digitalShopRatingModel?.data?.shopName}',
                                            style: TextStyle(
                                              color: textColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '${HomeCubit.get(context).digitalShopRatingModel?.data?.activity}',
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          // Text('(4.8)'),
                                          RatingBarIndicator(
                                              rating: getrating!.toDouble(),
                                              unratedColor: Colors.white,
                                              itemCount: 5,
                                              itemSize: 14,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return const Icon(Icons.star,
                                                    color: Colors.amber);
                                              }),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'قيم المتجر',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset('assets/icons/Rectangle 7863.png',
                                    height: 71, width: 110, fit: BoxFit.fill),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '${HomeCubit.get(context).digitalShopRatingModel?.data?.shopName}',
                                          style: TextStyle(
                                            color: textColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        RatingBar(
                                          itemSize: 20,
                                          initialRating: 0,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          ratingWidget: RatingWidget(
                                              full: Icon(
                                                Icons.star,
                                                color: rateColor,
                                              ),
                                              half: Icon(
                                                Icons.star_half,
                                                color: rateColor,
                                              ),
                                              empty: Icon(
                                                Icons.star_border,
                                                color: rateColor,
                                              )),
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 1.0),
                                          onRatingUpdate: (rating) {
                                            rating = rating;
                                            print(rating);
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      height: 37,
                                      width: MediaQuery.of(context).size.width -
                                          180,
                                      child: defaulttextfield(
                                          controller: noteController,
                                          type: TextInputType.text,
                                          hinttext: 'أضف ملاحظة',
                                          fontsize: 14.0),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ConditionalBuilder(
                            condition: state is! PosRatLoadingState,
                            builder: (context) => Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ingridentbutton(
                                width: 360,
                                height: 56,
                                function: () {
                                  HomeCubit.get(context).giveDigitalOrderrating(
                                      id: widget.productID,
                                      rating: rating,
                                      note: noteController.text);
                                },
                                text: 'معدل الإرسال',
                                color1: Color(0xff59b81e),
                                color2: Color(0xffb0c81f),
                              ),
                            ),
                            fallback: (context) => Container(
                                child: Center(
                                    child: CircularProgressIndicator(
                              color: button2color,
                            ))),
                          )
                        ],
                      ),
                    )
                  ]),
                );
              },
              fallback: (context) => Container(
                color: Colors.white,
                child: Center(
                  child: CircularProgressIndicator(
                    color: button2color,
                  ),
                ),
              ),
            );
          },
        ));
  }
}
