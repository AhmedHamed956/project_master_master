import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/src/ui/Home/Cubit.dart';
import 'package:project/src/ui/Home/states.dart';

import '../../../../generated/l10n.dart';
import '../../Shared/constant.dart';
import '../../components/appar.dart';
import '../../components/component.dart';

class RatingOrderScreen extends StatefulWidget {
  final model;

  const RatingOrderScreen({super.key, this.model});

  @override
  State<RatingOrderScreen> createState() => _RatingOrderScreenState();
}

class _RatingOrderScreenState extends State<RatingOrderScreen> {
  TextEditingController clientNoteController = TextEditingController();
  TextEditingController deliveryNoteController = TextEditingController();
  double? deliveryRating;
  double? shopRating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgourndColor,
      appBar: AppBarWidget(label: S.current.rate_order),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 20,
            ),
            Container(
                height: MediaQuery.of(context).size.height,
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
                // width: 360,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(right: 12, left: 11, top: 19),
                          child: Container(
                            height: 146,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: buttonLightcolor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding:
                                  EdgeInsets.only(right: 18, left: 22, top: 7),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(25)),
                                              child: Image.network(
                                                '${domainlink}${widget.model?.shopDatta?.background}',
                                                // color: Colors.transparent,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 13,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 8),
                                            child: Text(
                                              "${widget.model?.shopDatta?.brandName}",
                                              style: TextStyle(
                                                color: textColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '#${widget.model?.id}',
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        S.current.totalAmount,
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            S.current.cash,
                                            style: TextStyle(
                                              color: button1color,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 29,
                                          ),
                                          Text(
                                            '${widget.model?.totalPrice} ${S.current.rs}',
                                            style: TextStyle(
                                              color: textColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        S.current.delivery_date,
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        '${widget.model?.createdAt?.split('T').first}',
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 25, left: 34),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                      child: Image.network(
                                        '${domainlink}${widget.model?.shopDatta?.background}',
                                        // color: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: Text(
                                      "${widget.model?.shopDatta?.brandName}",
                                      style: TextStyle(
                                        color: textColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
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
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 1.0),
                                onRatingUpdate: (rating) {
                                  setState(() {
                                    shopRating = rating;
                                  });

                                  // print(rating);
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 10, left: 25, right: 30, bottom: 13),
                          child: Container(
                            height: 40,
                            width: 373,
                            child: defaulttextfield(
                                isQuickSearch: false,
                                controller: clientNoteController,
                                type: TextInputType.text,
                                // prefix: Icons.search,
                                iconColor: textColor,
                                hinttext: S.current.add_note,
                                fontsize: 14.0),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 24.99, left: 25),
                          child: Divider(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 25, left: 34),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                      child: widget.model?.deliveryDetail
                                                  ?.deliveryUserData?.avatar ==
                                              'user.svg'
                                          ? SvgPicture.network(
                                              '${domainlink}${widget.model?.deliveryDetail?.deliveryUserData?.avatar}')
                                          : Image.network(
                                              '${domainlink}${widget.model?.deliveryDetail?.deliveryUserData?.avatar}',
                                              // color: Colors.transparent,
                                            ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: Text(
                                      '${widget.model?.deliveryDetail?.deliveryUserData?.name}',
                                      style: TextStyle(
                                        color: textColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
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
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 1.0),
                                onRatingUpdate: (rating) {
                                  setState(() {
                                    deliveryRating = rating;
                                  });
                                  // print(deliveryRating);
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 10, left: 25, right: 30, bottom: 13),
                          child: Container(
                            height: 40,
                            width: 373,
                            child: defaulttextfield(
                                isQuickSearch: false,
                                controller: deliveryNoteController,
                                type: TextInputType.text,
                                // prefix: Icons.search,
                                iconColor: textColor,
                                hinttext: S.current.add_note,
                                fontsize: 14.0),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 24.99, left: 25),
                          child: Divider(),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 25, left: 25, bottom: 35),
                          child: ingridentbutton(
                            width: 378,
                            height: 56,
                            function: () async {
                              await HomeCubit.get(context)
                                  .giveShopAndDeliveryRating(
                                      id: widget.model?.id,
                                      noteRate: clientNoteController.text,
                                      notedelivery: deliveryNoteController.text,
                                      ratingdelivery: deliveryRating,
                                      shopRate: shopRating,
                                      context: context
                                      // await HomeCubit.get(context)
                                      //     .giveShopAndDeliveryRating(
                                      //   id: widget.model?.id,
                                      //   noteRate: clientNoteController.text,
                                      //   notedelivery: deliveryNoteController.text,
                                      //   ratingdelivery: deliveryRating,
                                      //   shopRate: shopRating,
                                      // );
                                      );
                            },
                            text: S.current.send_rate,
                            color1: Color(0xAFF59B81E),
                            color2: Color(0xAFFB0C81F),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
