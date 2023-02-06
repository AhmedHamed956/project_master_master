import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Models/GetCartData_Model.dart';
import 'package:project/src/common/global.dart';
import 'package:project/src/ui/Home/Cubit.dart';
import 'package:project/src/ui/Home/Home.dart';
import 'package:project/src/ui/location/mapping_set.dart';

import '../../../Models/model/cart_data.dart';
import '../../../generated/l10n.dart';
import '../Home/states.dart';
import '../Shared/constant.dart';
import '../components/appar.dart';
import '../components/component.dart';
import '../navigation_screen/settings/My-Walet/myWalet-screen.dart';
import '../widgets/card-widget.dart';

enum GiftType {
  forme,
  forother,
}

enum PaymentType { card1, cash }

class OrderDetails extends StatefulWidget {
  String? total;
  String? totalprice;
  String? deliverycost;
  String? counrty;
  String? city;
  String? street;
  String? location;
  String? payment;
  String? gift;
  String? quickProductId;
  CartData? model;

  OrderDetails(
      {super.key,
      this.total,
      this.totalprice,
      this.deliverycost,
      this.model,
      this.counrty,
      this.city,
      this.street,
      this.location,
      this.payment,
      this.gift,
      this.quickProductId});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  PaymentType? _payments;
  GiftType? _gift;
  FocusNode _focusNode = new FocusNode();
  FocusNode _focusNode2 = new FocusNode();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  String? typeSend;
  String? paymentType;

  final _formKey = GlobalKey<FormState>();
  bool giftVaildate = false;
  bool mapVaildate = false;
  bool paymentVaildate = false;

  String? result;

  @override
  void initState() {
    result = widget.location.toString();
    if (widget.payment == "cash") {
      _payments = PaymentType.cash;
      paymentType = 'cash';
    } else {
      if (widget.payment == "visa") {
        _payments = PaymentType.card1;
        paymentType = 'visa';
      }
    }

    if (widget.gift == "ToMe") {
      _gift = GiftType.forme;
      typeSend = 'ToMe';
    } else {
      if (widget.payment == "ToPersone") {
        _gift = GiftType.forother;
        typeSend = 'ToPersone';
      }
    }

    print(result);
    // TODO: implement initState
    super.initState();
  }

  // Future<void> _navigateAndDisplaySelection(BuildContext context) async {
  //   // Navigator.push returns a Future that completes after calling
  //   // Navigator.pop on the Selection Screen.
  //   result = await Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //         builder: (context) => const MappingSet(
  //               mappingset: false,
  //             )),
  //   );

  //   // When a BuildContext is used from a StatefulWidget, the mounted property
  //   // must be checked after an asynchronous gap.
  //   if (!mounted) return;

  //   // After the Selection Screen returns a result, hide any previous snackbars
  //   // and show the new result.
  // }

  @override
  bool isChecked = false;
  TextEditingController promoCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeAppState>(
      listener: (context, state) {
        if (state is ConfirmOrderSuccessStates) {
          Navigator.pushReplacement<void, void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => HomeScreen(
                index: 0,
              ),
            ),
          );
        }
        if (state is ConfirmOrderErrorStates) {
          Navigator.pushReplacement<void, void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => HomeScreen(
                index: 0,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: mainBackgourndColor,
          appBar: AppBarWidget(
            label: S.current.order_details,
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: shadowColor.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 8,
                          offset:
                              const Offset(0, -4), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  // width: 360,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 30, left: 20, top: 32),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.current.who_the_gift_for,
                              style: const TextStyle(
                                color: textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Radio<GiftType>(
                              value: GiftType.forme,
                              groupValue: _gift,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) => button1color),
                              onChanged: (GiftType? value) {
                                setState(() {
                                  _gift = value;
                                  typeSend = 'ToMe';
                                  widget.city = myAddress;
                                  result = myLat_long;
                                  giftVaildate = false;
                                });
                              },
                              visualDensity: VisualDensity.compact,
                            ),
                            const SizedBox(width: 13),
                            Text(S.current.gift_for_me,
                                style: const TextStyle(
                                    color: textColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Radio<GiftType>(
                              value: GiftType.forother,
                              groupValue: _gift,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) => button1color),
                              onChanged: (GiftType? value) {
                                setState(() {
                                  _gift = value;
                                  typeSend = 'ToPersone';
                                  widget.city = null;
                                  result = null;
                                  giftVaildate = false;
                                });
                              },
                              visualDensity: VisualDensity.compact,
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            Text(
                              S.current.gift_for_someone_else,
                              style: const TextStyle(
                                color: textColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        _gift == GiftType.forother
                            ? Column(
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Stack(
                                    children: <Widget>[
                                      Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 6, 0, 0),
                                          child: Container(
                                            height: 56,
                                            width: 360,
                                            child: TextField(
                                              textAlign: TextAlign.right,
                                              keyboardType: TextInputType.text,
                                              controller: namecontroller,
                                              style: const TextStyle(
                                                  color: textColor),
                                              maxLines: 2,
                                              decoration: const InputDecoration(
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color.fromRGBO(
                                                        126, 132, 138, 1),
                                                  ),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: textFieldColor,
                                                      width: 0.0),
                                                ),
                                              ),
                                              focusNode: _focusNode,
                                            ),
                                          )),
                                      Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 7),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 7),
                                            color: Colors.white,
                                            // input outline default seems using 4.0 as padding from their source
                                            child: Text(
                                              S.current.receiver_name,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: _focusNode.hasFocus
                                                    ? textfieldLabelcolor
                                                    : textfieldLabelcolor,
                                              ),
                                            ), //just to cover the intercepted border
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Stack(
                                    children: <Widget>[
                                      Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 6, 0, 0),
                                          child: Container(
                                            height: 56,
                                            width: 360,
                                            child: TextField(
                                              textAlign: TextAlign.right,
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: phonecontroller,
                                              style: const TextStyle(
                                                  color: textColor),
                                              maxLines: 2,
                                              decoration: const InputDecoration(
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color.fromRGBO(
                                                        126, 132, 138, 1),
                                                  ),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: textFieldColor,
                                                      width: 0.0),
                                                ),
                                              ),
                                              focusNode: _focusNode2,
                                            ),
                                          )),
                                      Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 7, 0),
                                            padding: const EdgeInsets.fromLTRB(
                                                4, 0, 4, 0),
                                            color: Colors.white,
                                            // input outline default seems using 4.0 as padding from their source
                                            child: Text(
                                              S.current.phone_number,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: _focusNode2.hasFocus
                                                    ? textfieldLabelcolor
                                                    : textfieldLabelcolor,
                                              ),
                                            ), //just to cover the intercepted border
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              )
                            : Container(),

                        const SizedBox(
                          height: 15,
                        ),
                        giftVaildate == true
                            ? Row(
                                children: [
                                  Text(
                                    langKey == 'ar'
                                        ? 'برجاء اختيار الهدية'
                                        : 'please choose gift',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              )
                            : Container(),
                        const Divider(color: Colors.grey),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  Row(children: [
                                    Flexible(
                                        child: Text(
                                            widget.city == null
                                                ? S.current.enter_Location
                                                : '${widget.city}',
                                            style: const TextStyle(
                                                color: textColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700)))
                                  ]),
                                  Row(children: [
                                    Flexible(
                                        child: Text(
                                            widget.street == null
                                                ? ''
                                                : '${widget.street}',
                                            style: const TextStyle(
                                                color: textColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500)))
                                  ]),
                                  Row(children: [
                                    Flexible(
                                        child: Text(
                                            S.current
                                                .delivery_details_can_be_specified_in_this_field,
                                            style: const TextStyle(
                                                color: greencolor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400)))
                                  ])
                                ])),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MappingSet(
                                                mappingset: 'completeOrder',
                                                cartmodel: widget.model,
                                                payment: paymentType,
                                                gift: typeSend,
                                                total: widget.total,
                                                totalprice: widget.totalprice,
                                                deliverycost:
                                                    widget.deliverycost,
                                                quickproductId:
                                                    widget.quickProductId,
                                                getLocation: true)));
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 24,
                                        width: 24,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                          image: AssetImage(
                                              'assets/icons/Vector-9.png'),
                                          // fit: BoxFit.fill
                                        )),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        S.current.open_map,
                                        style: const TextStyle(
                                          color: button1color,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        mapVaildate == true
                            ? Row(
                                children: [
                                  Text(
                                    langKey == 'ar'
                                        ? 'برجاء تحديد موقع التسليم'
                                        : 'Please enter the delivery location',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              )
                            : Container(),
                        const Divider(
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      S.current.payment_method,
                                      style: const TextStyle(
                                        color: textColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                Row(
                                  children: [
                                    Radio<PaymentType>(
                                      value: PaymentType.card1,
                                      groupValue: _payments,
                                      fillColor: MaterialStateColor.resolveWith(
                                          (states) => button1color),
                                      onChanged: (PaymentType? value) {
                                        setState(() {
                                          _payments = value;
                                          paymentType = 'visa';
                                        });
                                      },
                                      visualDensity: VisualDensity.compact,
                                    ),
                                    const SizedBox(
                                      width: 0,
                                    ),
                                    Container(
                                      child: const Text(
                                        'VISA  5841-XXXX-XX-XX',
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Radio<PaymentType>(
                                      value: PaymentType.cash,
                                      groupValue: _payments,
                                      fillColor: MaterialStateColor.resolveWith(
                                          (states) => button1color),
                                      onChanged: (PaymentType? value) {
                                        setState(() {
                                          _payments = value;
                                          paymentType = 'cash';
                                        });
                                      },
                                      visualDensity: VisualDensity.compact,
                                    ),
                                    const SizedBox(
                                      width: 13,
                                    ),
                                    Text(
                                      S.current.cash,
                                      style: const TextStyle(
                                        color: textColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    print('Open map');
                                  },
                                  child: Container(
                                    height: 36,
                                    // width: 110,
                                    decoration: BoxDecoration(
                                        gradient: quickButton,
                                        borderRadius:
                                            BorderRadius.circular(6.0)),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          S.current.add_new_card,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        paymentVaildate == true
                            ? Row(
                                children: [
                                  Text(
                                    langKey == 'ar'
                                        ? 'برجاء تحديد طريقة الدفع'
                                        : 'Please choose the payment type',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              )
                            : Container(),
                        const Divider(
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(children: [
                          Text(
                              S.current
                                  .do_you_have_promo_or_voucher_discount_code,
                              style: const TextStyle(
                                  color: textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700))
                        ]),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Container(
                              height: 56,
                              width: 378,
                              child: defaulttextfield(
                                  ispromocode: true,
                                  hinttext: S.current.enter_code,
                                  prefix: Icons.send,
                                  controller: promoCodeController,
                                  type: TextInputType.text)),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 110,
                          color: Colors.white,
                          width: double.infinity,
                          // decoration: BoxDecoration(
                          //   color: Colors.white,
                          //   border: Border.all(
                          //     // color: textColor,
                          //     width: 1,
                          //   ),
                          //   borderRadius: BorderRadius.circular(4.0),
                          // ),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: buttonLightcolor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 21,
                                  vertical: 5,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          widget.model?.totalPrice != null
                                              ? '${widget.model?.total} ${S.current.rs}'
                                              : '${widget.total} ${S.current.rs}',
                                          style: const TextStyle(
                                            color: textColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          S.current.total_amount,
                                          style: const TextStyle(
                                            color: textColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          widget.model?.totalPrice != null
                                              ? '${widget.model?.deliveryCost} ${S.current.rs}'
                                              : '${widget.deliverycost} ${S.current.rs}',
                                          style: const TextStyle(
                                            color: textColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            GradientText(
                                              S.current.now,
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400),
                                              gradient:
                                                  const LinearGradient(colors: [
                                                Color(0xAFF59B81E),
                                                Color(0xAFFB0C81F),
                                              ]),
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              S.current.delivery_price,
                                              style: const TextStyle(
                                                color: textColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          right: 10.99, left: 16),
                                      child: Divider(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          widget.model?.totalPrice != null
                                              ? '${widget.model?.totalPrice} ${S.current.rs}'
                                              : '${widget.totalprice} ${S.current.rs}',
                                          style: const TextStyle(
                                            color: button1color,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          S.current.total,
                                          style: const TextStyle(
                                            color: button1color,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Container(
                        //   height: 100,
                        //   color: Colors.white,
                        //   width: double.infinity,
                        //   // decoration: BoxDecoration(
                        //   //   color: Colors.white,
                        //   //   border: Border.all(
                        //   //     // color: textColor,
                        //   //     width: 1,
                        //   //   ),
                        //   //   borderRadius: BorderRadius.circular(4.0),
                        //   // ),
                        //   child: Container(
                        //       decoration: BoxDecoration(
                        //         color: Colors.white,
                        //         border: Border.all(
                        //           color: buttonLightcolor,
                        //           width: 1,
                        //         ),
                        //         borderRadius: BorderRadius.circular(10.0),
                        //       ),
                        //       child: Padding(
                        //         padding: const EdgeInsets.symmetric(
                        //           horizontal: 21,
                        //           vertical: 5,
                        //         ),
                        //         child: Column(
                        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //           children: [
                        //             Row(
                        //               mainAxisAlignment:
                        //                   MainAxisAlignment.spaceBetween,
                        //               children: [
                        //                 Text(
                        //                   '82.00 ${S.current.rs}',
                        //                   style: TextStyle(
                        //                     color: textColor,
                        //                     fontSize: 16,
                        //                     fontWeight: FontWeight.w700,
                        //                   ),
                        //                 ),
                        //                 Text(
                        //                   S.current.total_amount,
                        //                   style: TextStyle(
                        //                     color: textColor,
                        //                     fontSize: 16,
                        //                     fontWeight: FontWeight.w400,
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //             Row(
                        //               mainAxisAlignment:
                        //                   MainAxisAlignment.spaceBetween,
                        //               children: [
                        //                 Text(
                        //                   '10.00 ${S.current.rs}',
                        //                   style: TextStyle(
                        //                     color: textColor,
                        //                     fontSize: 16,
                        //                     fontWeight: FontWeight.w700,
                        //                   ),
                        //                 ),
                        //                 Row(
                        //                   children: [
                        //                     GradientText(
                        //                       '15/04/22 - 11:30',
                        //                       style: TextStyle(
                        //                           fontSize: 14,
                        //                           fontWeight: FontWeight.w400),
                        //                       gradient: LinearGradient(colors: [
                        //                         Color(0xAFF59B81E),
                        //                         Color(0xAFFB0C81F),
                        //                       ]),
                        //                     ),
                        //                     SizedBox(
                        //                       width: 15,
                        //                     ),
                        //                     Text(
                        //                       S.current.delivery_price,
                        //                       style: TextStyle(
                        //                         color: textColor,
                        //                         fontSize: 16,
                        //                         fontWeight: FontWeight.w400,
                        //                       ),
                        //                     ),
                        //                   ],
                        //                 ),
                        //               ],
                        //             ),
                        //             Padding(
                        //               padding: const EdgeInsets.only(
                        //                   right: 10.99, left: 16),
                        //               child: Divider(
                        //                 color: Colors.grey,
                        //               ),
                        //             ),
                        //             Row(
                        //               mainAxisAlignment:
                        //                   MainAxisAlignment.spaceBetween,
                        //               children: [
                        //                 Text(
                        //                   '92,00 ${S.current.rs}',
                        //                   style: TextStyle(
                        //                     color: button1color,
                        //                     fontSize: 16,
                        //                     fontWeight: FontWeight.w700,
                        //                   ),
                        //                 ),
                        //                 Text(
                        //                   S.current.rs,
                        //                   style: TextStyle(
                        //                     color: button1color,
                        //                     fontSize: 16,
                        //                     fontWeight: FontWeight.w400,
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //           ],
                        //         ),
                        //       )),
                        // ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            height: 56,
                            color: Colors.white,
                            width: double.infinity,
                            // decoration: BoxDecoration(
                            //   color: Colors.white,
                            //   border: Border.all(
                            //     // color: textColor,
                            //     width: 1,
                            //   ),
                            //   borderRadius: BorderRadius.circular(4.0),
                            // ),
                            child: Container(
                                decoration: BoxDecoration(
                                  color: buttonLightcolor.withOpacity(0.2),
                                  border: Border.all(
                                    color: buttonLightcolor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 11, left: 21),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget.model?.totalPrice != null
                                            ? '${widget.model?.totalPrice} ${S.current.rs}'
                                            : '${widget.totalprice} ${S.current.rs}',
                                        style: const TextStyle(
                                          color: button1color,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        S.current.total_calculted_amount,
                                        style: const TextStyle(
                                          color: button1color,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ))),
                        const SizedBox(
                          height: 25,
                        ),

                        ConditionalBuilder(
                            condition: state is! ConfirmOrderLoadingState,
                            builder: (context) {
                              return SizedBox(
                                height: 56,
                                width: MediaQuery.of(context).size.width,
                                child: ingridentbutton(
                                    function: () async {
                                      print(result);
                                      if (typeSend == "ToMe") {
                                        namecontroller.text = '';
                                        phonecontroller.text = '';
                                      }
                                      if (result == 'null') {
                                        setState(() {
                                          mapVaildate = true;
                                        });
                                      } else {
                                        setState(() {
                                          mapVaildate = false;
                                        });
                                      }
                                      if (typeSend == null) {
                                        setState(() {
                                          giftVaildate = true;
                                        });
                                      } else {
                                        setState(() {
                                          giftVaildate = false;
                                        });
                                      }
                                      if (paymentType == null) {
                                        setState(() {
                                          paymentVaildate = true;
                                        });
                                      } else {
                                        setState(() {
                                          paymentVaildate = false;
                                        });
                                      }

                                      if (result != 'null' &&
                                          typeSend != null &&
                                          paymentType != null) {
                                        widget.model?.totalPrice != null
                                            ? await HomeCubit.get(context)
                                                .confirmOrder(
                                                    context: context,
                                                    typesend: typeSend,
                                                    name: namecontroller.text,
                                                    phone: phonecontroller.text,
                                                    typepay: paymentType,
                                                    map: result,
                                                    id: widget
                                                        .model?.shopData!.id
                                                        .toString())
                                            : await HomeCubit.get(context)
                                                .confirmOrder(
                                                    context: context,
                                                    typesend: typeSend,
                                                    name: namecontroller.text,
                                                    phone: phonecontroller.text,
                                                    typepay: paymentType,
                                                    map: result,
                                                    id: widget.quickProductId
                                                        .toString());
                                      }
                                    },
                                    color1: button1color,
                                    color2: button2color,
                                    text: S.current.confirm_payment),
                              );
                            },
                            fallback: (context) => Container(
                                    child: const Center(
                                        child: CircularProgressIndicator(
                                  color: button2color,
                                ))))
                      ],
                    ),
                  )),
            ),
          ),
        );
      },
    );
  }
}
