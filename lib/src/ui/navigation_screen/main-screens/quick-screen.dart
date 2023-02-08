import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/Models/Tabs_Details_Model.dart';
import 'package:project/Models/get_QuickProduct_model.dart';
import 'package:project/src/common/global.dart';
import 'package:project/src/network/remote/endPoint.dart';
import 'package:project/src/ui/Home/Cubit.dart';
import 'package:project/src/ui/Home/states.dart';

import 'package:project/src/ui/Shared/constant.dart';
import '../../../../generated/l10n.dart';
import '../../components/appar.dart';
import 'package:project/src/ui/components/component.dart';

import '../../widgets/quick-widget.dart';

class QuickScreen extends StatefulWidget {
  final String? title;
  final String? type;
  final String? isQuick;
  ProductQuick? quickmodel;
  QuickScreen(
      {super.key, this.title, this.type, this.isQuick, this.quickmodel});

  @override
  State<QuickScreen> createState() => _QuickScreenState();
}

class _QuickScreenState extends State<QuickScreen> {
  int? totalprice;
  int? deliveycost;
  var counter;
  TextEditingController quickController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.isQuick == 'true') {
      counter = 1;
      totalprice = int.parse(widget.quickmodel!.priceAfterDiscount.toString());
      Future.delayed(Duration.zero, () {
        widget.isQuick == 'true'
            ? showModalBottomSheet<void>(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext context) {
                  return FractionallySizedBox(
                    heightFactor: 0.9,
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              height: 220,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                // color: Colors.red,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      "${domainlink}${widget.quickmodel?.masterImage}"),
                                ),
                              ),
                              // child:
                              //     Image.asset('assets/icons/Rectangle 7863-2 2.png'),
                            ),
                            Container(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 25, left: 23, right: 23),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      langKey == 'ar'
                                          ? "${widget.quickmodel?.translations?.first.name}"
                                          : "${widget.quickmodel?.translations?.last.name}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: textColor),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          '${widget.quickmodel?.priceAfterDiscount} ${S.current.rs}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: indicatorColor),
                                        ),
                                        Text(
                                            '${widget.quickmodel?.price} ${S.current.rs}',
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w400,
                                                color: textColor)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 23),
                              child: Row(
                                children: [
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width),
                                    child: Text(
                                      langKey == 'ar'
                                          ? "${widget.quickmodel?.translations?.first.dis}"
                                          : "${widget.quickmodel?.translations?.last.dis}",
                                      style: TextStyle(
                                        color: textColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 23, right: 23, top: 27.5, bottom: 36),
                              child: Row(
                                children: [
                                  Container(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              width: 27,
                                              height: 15,
                                              child: SvgPicture.asset(
                                                  'assets/icons/home/Vector-9.svg')),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            'خلال ${widget.quickmodel?.shopDataa?.deliveryTime} ${S.current.min}',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: smalltextColor),
                                          ),
                                        ]),
                                  ),
                                  SizedBox(
                                    width: 35,
                                  ),
                                  Container(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              width: 27,
                                              height: 15,
                                              child: SvgPicture.asset(
                                                  'assets/icons/home/Vector-13.svg')),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            'التوصيل ${widget.quickmodel?.shopDataa?.deliveryCost} ${S.current.rs}',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: smalltextColor),
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 26),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      _increment();
                                    },
                                    child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: purpleColor,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        child: Center(
                                            child: Text(
                                          "+",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: purpleColor),
                                        ))),
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Text(
                                    '${counter}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: textColor),
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (counter != 1) {
                                        _dicrement();
                                      } else {
                                        null;
                                      }
                                    },
                                    child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: textColor,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        child: Center(
                                            child: Text(
                                          "-",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: textColor),
                                        ))),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    '${totalprice} ${S.current.rs}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: indicatorColor),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 40),
                            Divider(
                              color: dividerColor,
                              thickness: 1.5,
                            ),
                            Text(
                              S.current.similar_items,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: textColor),
                            ),
                            Divider(
                              color: dividerColor,
                              thickness: 1.5,
                            ),
                            const SizedBox(height: 15.92),
                            Padding(
                              padding: const EdgeInsets.only(right: 5, left: 6),
                              child: Container(
                                  height: 100,
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) => Stack(
                                            children: [
                                              Container(
                                                width: 130,
                                                height: 98,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Image.asset(
                                                    'assets/icons/Rectangle 7888.png'),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 4, left: 30),
                                                  child: Container(
                                                    width: 63,
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                        color: Colors
                                                            .transparent
                                                            .withOpacity(0.4),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          '30 ${S.current.rs}',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                            width: 12,
                                          ),
                                      itemCount: 2)),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 25, left: 25, bottom: 35),
                              child: ingridentbutton(
                                width: 366,
                                height: 45,
                                function: () {
                                  if (widget.quickmodel?.isAvailable == 1) {
                                    HomeCubit.get(context).postQuickOrder(
                                        productID: widget.quickmodel?.productId,
                                        quantity: counter,
                                        isQiuck: 1);
                                  } else {
                                    if (widget.quickmodel?.isAvailable == 0) {
                                      HomeCubit.get(context)
                                          .postnonReadyQuickOrder(
                                              productID:
                                                  widget.quickmodel?.productId,
                                              quantity: counter);
                                    }
                                  }
                                },
                                text: S.current.quick_order,
                                color1: button1color,
                                color2: button2color,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : null;
      });
    }

    // Future.delayed(Duration.zero, () {
    //   widget.isQuick == 'true'
    //       ? showModalBottomSheet(
    //           isScrollControlled: true,
    //           shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(10.0)),
    //           backgroundColor: Colors.transparent,
    //           builder: (BuildContext context) {
    //             return QuickWidget(model2: widget.quickmodel?.productQuick);
    //           },
    //           context: context)
    //       : null;
    // });
  }

  void _increment() {
    setState(() {
      totalprice = (totalprice! +
          int.parse(widget.quickmodel!.priceAfterDiscount.toString()));
      counter += 1;
      // deliveycost = (totalprice! +
      //     int.parse(widget.quickmodel!.shopData!.deliveryCost.toString()));
      print(counter);
    });
  }

  void _dicrement() {
    setState(() {
      totalprice = (totalprice! -
          int.parse(widget.quickmodel!.priceAfterDiscount.toString()));
      counter--;
      // deliveycost = (totalprice! +
      //     int.parse(widget.quickmodel!.shopData!.deliveryCost.toString()));
      print(counter);
    });
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    // final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    // final double itemWidth = size.width / 2;

    return BlocProvider(
        create: (context) => HomeCubit()..getQuickData(),
        child: BlocConsumer<HomeCubit, HomeAppState>(
          listener: (context, state) {},
          builder: (context, state) {
            return ConditionalBuilder(
                condition: HomeCubit.get(context).getQuickModel != null,
                builder: (context) =>
                    quickScreen(context, HomeCubit.get(context).getQuickModel!),
                fallback: ((context) => Container(
                      color: Colors.white,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: button2color,
                        ),
                      ),
                    )));
          },
        ));
  }

  Widget quickScreen(context, GetQuickModel model) => Scaffold(
      backgroundColor: mainBackgourndColor,
      appBar: QiuckAppBarWidget(
        label: widget.title != null ? widget.title.toString() : S.current.quick,
        type: widget.type,
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        widget.type != 'offer'
            ? Padding(
                padding: const EdgeInsets.only(right: 7, left: 16, top: 17),
                child: Container(
                  height: 44,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset:
                            const Offset(0, -4), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: SizedBox(
                            width: 40,
                            height: 24,
                            child: Image.asset(
                                'assets/icons/system-uicons_filtering.png')),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        child: defaulttextfield(
                            controller: quickController,
                            type: TextInputType.text,
                            // prefix: Icons.search,
                            isQuickSearch: true,
                            iconColor: textColor,
                            hinttext: S.current.search,
                            prefix: Icons.search,
                            fontsize: 14.0),
                      ),
                    ],
                  ),
                ),
              )
            : Container(),
        GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            primary: false,
            padding: const EdgeInsets.all(20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio:
                  (MediaQuery.of(context).orientation == Orientation.landscape)
                      ? 2
                      : 1,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              crossAxisCount: 2,
            ),
            itemCount: model.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return Wrap(children: [
                InkWell(
                    onTap: () {
                      // var model2 = HomeCubit.get(context).suggestionModel!;

                      showModalBottomSheet(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          backgroundColor: Colors.transparent,
                          builder: (BuildContext context) {
                            return QuickWidget(
                              model: model.data![index],
                            );
                          },
                          context: context);
                    },
                    child: Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 110,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              child: Image.network(
                                  '${domainlink}${model.data![index].masterImage}',
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              child: Column(children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          langKey == 'ar'
                                              ? '${model.data![index].translations!.first.name}'
                                              : '${model.data![index].translations!.last.name}',
                                          style: const TextStyle(
                                              color: textColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700)),
                                      Text(
                                          '${model.data![index].priceAfterDiscount} ${S.current.rs}',
                                          style: const TextStyle(
                                              color: borderColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400))
                                    ]),
                                const SizedBox(height: 4),
                                Row(children: [
                                  Flexible(
                                      child: Text(
                                          langKey == 'ar'
                                              ? '${model.data![index].translations!.first.dis}'
                                              : '${model.data![index].translations!.last.dis}',
                                          style: const TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.w400,
                                              color: textColor)))
                                ])
                              ]))
                        ])))
              ]);
            })
      ])));
}
