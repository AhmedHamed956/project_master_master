import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../generated/l10n.dart';
import '../../Shared/constant.dart';
import '../../components/appar.dart';
import '../../components/component.dart';

class RatingOrderScreen extends StatelessWidget {
  const RatingOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController rateController = TextEditingController();
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
                height: 600,
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
                          padding: const EdgeInsets.only(
                              right: 12, left: 11, top: 19),
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
                              padding: const EdgeInsets.only(
                                  right: 18, left: 22, top: 7),
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
                                        children: const [
                                          SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: CircleAvatar(
                                              // backgroundColor: Colors.brown.shade800,
                                              child: Text('AH'),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 13,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 8),
                                            child: Text(
                                              'اسم متجر البائع',
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
                                        '#362840',
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
                                            '251.00 ${S.current.rs}',
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
                                        '05/06/2022',
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
                                children: const [
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: CircleAvatar(
                                      // backgroundColor: Colors.brown.shade800,
                                      child: Text('AH'),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: Text(
                                      'اسم متجر البائع',
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
                                  print(rating);
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
                                controller: rateController,
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
                                children: const [
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: CircleAvatar(
                                      // backgroundColor: Colors.brown.shade800,
                                      child: Text('AH'),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: Text(
                                      'اسم المندوب',
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
                                  print(rating);
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
                                controller: rateController,
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
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 25, left: 25, bottom: 35),
                      child: ingridentbutton(
                        width: 378,
                        height: 56,
                        function: () {},
                        text: S.current.send_rate,
                        color1: Color(0xAFF59B81E),
                        color2: Color(0xAFFB0C81F),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
