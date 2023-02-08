import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/src/common/global.dart';
import 'package:project/src/ui/Home/Cubit.dart';
import 'package:project/src/ui/Home/states.dart';
import 'package:project/src/ui/components/component.dart';

import '../../../Models/model/product_data.dart';
import '../../../generated/l10n.dart';
import '../Cart_Shops/order-details.dart';
import '../Shared/constant.dart';
import '../navigation_screen/main-screens/Quick-Screens/Quick-Tracking.dart';

class QuickWidget extends StatefulWidget {
  ProductData? model;
  // ProductQuick? model2;
  // QuickSuggestionModel model2;
  QuickWidget({
    super.key,
    this.model,
    // this.model2,
  });

  @override
  State<QuickWidget> createState() => _QuickWidgetState();
}

class _QuickWidgetState extends State<QuickWidget> {
  int? totalprice;
  int? deliveycost;
  var counter;
  @override
  void initState() {
    totalprice = int.parse(widget.model!.priceAfterDiscount.toString());
    deliveycost = (totalprice! +
        int.parse(widget.model!.shopData!.deliveryCost.toString()));
    counter = 1;
    super.initState();
  }

  void _increment() {
    setState(() {
      totalprice = (totalprice! +
          int.parse(widget.model!.priceAfterDiscount.toString()));
      counter += 1;
      deliveycost = (totalprice! +
          int.parse(widget.model!.shopData!.deliveryCost.toString()));
      print(counter);
    });
  }

  void _dicrement() {
    setState(() {
      totalprice = (totalprice! -
          int.parse(widget.model!.priceAfterDiscount.toString()));
      counter--;
      deliveycost = (totalprice! +
          int.parse(widget.model!.shopData!.deliveryCost.toString()));
      print(counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeAppState>(
      listener: (context, state) {
        if (state is PosQuickOrderSuccessStates) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OrderDetails(
                        total: totalprice.toString(),
                        deliverycost: widget.model?.shopData?.deliveryCost,
                        totalprice: deliveycost.toString(),
                        quickProductId: widget.model?.shopId.toString(),
                      )));
        }

        if (state is ReadyQuickPostOrderSuccessStates) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const QuickTraking()));
        }
      },
      builder: (context, state) {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      children: [
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
                                  "${domainlink}${widget.model?.masterImage}"),
                            ),
                          ),
                          // child:
                          //     Image.asset('assets/icons/Rectangle 7863-2 2.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 25, left: 23, right: 23),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                langKey == 'ar'
                                    ? "${widget.model?.translations?.first.name}"
                                    : "${widget.model?.translations?.last.name}",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: textColor),
                              ),
                              Column(
                                children: [
                                  Text(
                                    '${widget.model?.priceAfterDiscount} ${S.current.rs}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: indicatorColor),
                                  ),
                                  Text('${widget.model?.price} ${S.current.rs}',
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
                        SizedBox(
                          height: 9,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 23),
                          child: Row(
                            children: [
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width),
                                child: Text(
                                  langKey == 'ar'
                                      ? "${widget.model?.translations?.first.dis}"
                                      : "${widget.model?.translations?.last.dis}",
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                        'خلال ${widget.model?.shopData?.deliveryTime} ${S.current.min}',
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                        'التوصيل ${widget.model?.shopData?.deliveryCost} ${S.current.rs}',
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
                          padding: const EdgeInsets.symmetric(horizontal: 26),
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
                                      borderRadius: BorderRadius.circular(4.0),
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
                                      borderRadius: BorderRadius.circular(4.0),
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
                                                    BorderRadius.circular(10)),
                                            child: Image.asset(
                                                'assets/icons/Rectangle 7888.png'),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 4, left: 30),
                                              child: Container(
                                                width: 63,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                    color: Colors.transparent
                                                        .withOpacity(0.4),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '30 ${S.current.rs}',
                                                      style: TextStyle(
                                                          color: Colors.white),
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
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ConditionalBuilder(
                      condition: state is! PosQuickOrderLoadingState &&
                          state is! ReadyQuickPostOrderLoadingState,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              right: 25, left: 25, bottom: 35),
                          child: ingridentbutton(
                            width: 366,
                            height: 45,
                            function: () {
                              if (widget.model?.isAvailable == 1) {
                                HomeCubit.get(context).postQuickOrder(
                                    productID: widget.model?.productId,
                                    quantity: counter,
                                    isQiuck: 1);
                              } else {
                                if (widget.model?.isAvailable == 0) {
                                  HomeCubit.get(context).postnonReadyQuickOrder(
                                      productID: widget.model?.productId,
                                      quantity: counter);
                                }
                              }
                            },
                            text: S.current.quick_order,
                            color1: button1color,
                            color2: button2color,
                          ),
                        );
                      },
                      fallback: (context) => Container(
                          color: Colors.white,
                          child: Center(
                              child: CircularProgressIndicator(
                            color: button2color,
                          ))))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
