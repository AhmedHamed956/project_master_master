import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:project/Models/profile_Gift_Model.dart';
import 'package:project/src/common/global.dart';
import 'package:project/src/ui/Home/Cubit.dart';

import 'package:project/src/ui/components/component.dart';

import '../../../generated/l10n.dart';
import '../Shared/constant.dart';

class GiftCardWidget extends StatefulWidget {
  const GiftCardWidget({super.key, required this.model});
  final ProfileGiftData model;
  @override
  State<GiftCardWidget> createState() => _GiftCardWidgetState();
}

class _GiftCardWidgetState extends State<GiftCardWidget> {
  int? amountRemain;
  final Shader linearGradient = const LinearGradient(
    colors: <Color>[
      Color(0xAFF59B81E),
      Color(0xAFFB0C81F),
    ],
  ).createShader(
    Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
  );

  @override
  Widget build(BuildContext context) {
    amountRemain = widget.model.totalPrice;
    TextEditingController textController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 25),
      child: Container(
        height: 110,
        width: 370,
        decoration: BoxDecoration(
            border: Border.all(color: buttonLightcolor),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 110,
                height: 71,
                child: Image.network(
                    '${domainlink}${widget.model.productData!.image}')),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  langKey == 'ar'
                      ? '${widget.model.productData!.translations!.first.name}'
                      : '${widget.model.productData!.translations!.last.name}',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.current.gift_voucher,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '${widget.model.totalPrice} ${S.current.rs}',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 88,
                      height: 36,
                      // ignore: sort_child_properties_last
                      child: MaterialButton(
                          // ignore: sort_child_properties_last
                          child: Text(
                            S.current.pay,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          // shape: RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.circular(15.0),
                          // ),
                          onPressed: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              backgroundColor: Colors.white,
                              builder: (BuildContext context) {
                                return StatefulBuilder(
                                  builder: (BuildContext context,
                                      void Function(void Function()) setState) {
                                    return FractionallySizedBox(
                                      heightFactor: 0.65,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              // crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 220,
                                                  width: 428,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(10),
                                                            topRight:
                                                                Radius.circular(
                                                                    10)),
                                                    color: Colors.red,
                                                    image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(
                                                          '${domainlink}${widget.model.productData!.image}'),
                                                    ),
                                                  ),
                                                  // child:
                                                  //     Image.asset('assets/icons/Rectangle 7863-2 2.png'),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 23,
                                                    vertical: 10,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        '${widget.model.totalPrice} ${S.current.rs}',
                                                        style: const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: textColor),
                                                      ),
                                                      Text(
                                                        '${widget.model.shopData!.name} ',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: textColor),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 25, right: 25),
                                                  child: Container(
                                                      height: 56,
                                                      width: 378,
                                                      child: defaulttextfield(
                                                          onchanged: (value) {
                                                            print(
                                                                'First text field: $value');
                                                            setState(() {
                                                              if (value ==
                                                                  textController
                                                                      .text) {
                                                                if (int.parse(
                                                                        value) <=
                                                                    0) {
                                                                  value = '0';
                                                                }
                                                                amountRemain =
                                                                    (amountRemain! -
                                                                        int.parse(
                                                                            value));
                                                                value = '0';
                                                              }
                                                            });
                                                          },
                                                          hinttext: S.current
                                                              .select_the_paid_amount,
                                                          controller:
                                                              textController,
                                                          type: TextInputType
                                                              .text)),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 25,
                                                          right: 26,
                                                          top: 34,
                                                          bottom: 27),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        '${amountRemain.toString()} ${S.current.rs}',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          foreground: Paint()
                                                            ..shader =
                                                                linearGradient,
                                                        ),
                                                      ),
                                                      Text(
                                                        S.current.remain_amount,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          foreground: Paint()
                                                            ..shader =
                                                                linearGradient,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 25,
                                                  left: 25,
                                                  bottom: 35),
                                              child: ingridentbutton(
                                                width: 366,
                                                height: 45,
                                                function: () {
                                                  HomeCubit().postGiftorder(
                                                      context: context,
                                                      productID:
                                                          widget.model.id,
                                                      amount:
                                                          textController.text);
                                                },
                                                text: S.current.confirm_payment,
                                                color1: button1color,
                                                color2: button2color,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              context: context,
                            );
                          }),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [button2color, button1color])),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
