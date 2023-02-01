import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../../../Shared/constant.dart';
import '../../../components/appar.dart';
import '../../../components/component.dart';

enum PaymentType { card1, card2, cash }

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({super.key});

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  FocusNode _focusNode = new FocusNode();
  FocusNode _focusNode2 = new FocusNode();
  FocusNode _focusNode3 = new FocusNode();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ExpiredController = TextEditingController();

  TextEditingController CvvController = TextEditingController();
  bool _value = false;
  bool _value1 = false;
  bool _value2 = false;
  bool appearContainer = false;
  double _width = 0;
  final Shader linearGradient = const LinearGradient(
    colors: <Color>[
      Color(0xAFF59B81E),
      Color(0xAFF59B81E),
      Color(0xAFFB0C81F),
    ],
  ).createShader(
    const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
  );
  PaymentType? _payments = PaymentType.card1;

  @override
  void initState() {
    super.initState();
    //Add Listener to know when is updated focus
    _focusNode.addListener(_onLoginUserNameFocusChange);
    _focusNode2.addListener(_onLoginUserNameFocusChange);
    _focusNode3.addListener(_onLoginUserNameFocusChange);
  }

  @override
  void dispose() {
    //Dispose Listener to know when is updated focus
    _focusNode.addListener(_onLoginUserNameFocusChange);
    _focusNode2.addListener(_onLoginUserNameFocusChange);
    _focusNode3.addListener(_onLoginUserNameFocusChange);

    super.dispose();
  }

  void _onLoginUserNameFocusChange() {
    //Force updated once if focus changed
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool isTextClear = true;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: mainBackgourndColor,
        appBar: AppBarWidget(label: S.current.my_wallet),
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.only(top: 40),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 600,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20))),
                  )),
              SizedBox(
                  height: 700,
                  width: _width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                                gradient: maingradientColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(children: [
                              Expanded(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                    Text(S.current.your_wallet_balance,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400)),
                                    const SizedBox(height: 12),
                                    Text('251.00 ${S.current.rs}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500))
                                  ])),
                            ])),
                        const SizedBox(height: 24),
                        _cardWidget(PaymentType.card1),
                        const SizedBox(height: 18),
                        _cardWidget(PaymentType.card2),
                        const SizedBox(height: 18),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Radio<PaymentType>(
                                value: PaymentType.cash,
                                groupValue: _payments,
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => button1color),
                                onChanged: (PaymentType? value) {
                                  setState(() {
                                    _payments = value;
                                  });
                                },
                                visualDensity: VisualDensity.compact,
                              ),
                              Expanded(
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 16),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: buttonLightcolor)),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Image.asset(
                                                'assets/icons/cash.png'),
                                            Expanded(
                                                child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 16),
                                                    child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(S.current.cash,
                                                              style: const TextStyle(
                                                                  color:
                                                                      textColor,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                        ]))),
                                          ])))
                            ]),
                        const SizedBox(height: 20),
                        appearContainer == false
                            ? Column(
                                children: [
                                  // Container(
                                  //   height: 240,
                                  //   width: 344,
                                  //   decoration: BoxDecoration(
                                  //       gradient: quickButton,
                                  //       borderRadius: BorderRadius.circular(20)),
                                  // ),
                                  const SizedBox(height: 140),
                                  SizedBox(
                                    width: 378,
                                    height: 56,
                                    child: ingridentbutton(
                                        function: () {
                                          setState(() {
                                            appearContainer = true;
                                          });
                                        },
                                        color1: button1color,
                                        color2: button2color,
                                        text: S.current.add_new_card),
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  Container(
                                    height: 260,
                                    width: 344,
                                    decoration: BoxDecoration(
                                        gradient: quickButton,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 15, left: 17, top: 12),
                                      child: Column(children: [
                                        Row(
                                          children: [
                                            Text(S.current.card_holder_name,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ],
                                        ),
                                        const SizedBox(height: 3),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                child: Container(
                                              height: 48,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white),
                                              child: defaulttextfield(
                                                  hinttext:
                                                      S.current.name_surname,
                                                  controller: nameController,
                                                  type: TextInputType.name),
                                            ))
                                          ],
                                        ),
                                        const SizedBox(height: 3),
                                        Row(
                                          children: [
                                            Text(S.current.card_number,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ],
                                        ),
                                        const SizedBox(height: 3),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                child: Container(
                                              height: 48,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white),
                                              child: defaulttextfield(
                                                  hinttext:
                                                      '0000 0000 0000 0000',
                                                  controller: phoneController,
                                                  type: TextInputType.number),
                                            ))
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                  Text(S.current.expiry,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                          height: 1,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                  MyTextField(
                                                      controller:
                                                          ExpiredController,
                                                      hint: "MM/YY")
                                                ])),
                                            SizedBox(width: 8),
                                            Expanded(
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                  const Text('CVV',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                  MyTextField(
                                                      controller: CvvController,
                                                      hint: "***")
                                                ])),
                                            SizedBox(width: 8),
                                            Expanded(
                                                child: Column(
                                              children: [
                                                const SizedBox(height: 15),
                                                Container(
                                                    height: 36,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    child: ingridentbutton(
                                                        text: S.current.add,
                                                        function: () {
                                                          setState(() {
                                                            appearContainer =
                                                                false;
                                                          });
                                                        },
                                                        color1: button1color,
                                                        color2: button2color)),
                                              ],
                                            )),
                                          ],
                                        )
                                      ]),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 140,
                                  // ),
                                  // Container(
                                  //   width: 378,
                                  //   height: 56,
                                  //   child: ingridentbutton(
                                  //       function: () {},
                                  //       color1: button1color,
                                  //       color2: button2color,
                                  //       text: 'إضافة بطاقة جديدة'),
                                  // ),
                                ],
                              )
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }

  Widget _cardWidget(PaymentType paymentType) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Radio<PaymentType>(
        value: paymentType,
        fillColor: MaterialStateColor.resolveWith((states) => button1color),
        groupValue: _payments,
        onChanged: (PaymentType? value) {
          setState(() {
            _payments = value;
          });
        },
        visualDensity: VisualDensity.compact,
      ),
      Expanded(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: buttonLightcolor)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/icons/visa.png'),
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(S.current.card_holder_name,
                                      style: const TextStyle(
                                          color: textColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                  const SizedBox(height: 4),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text('5841-XXXX-XXXX-XXXX',
                                            style: TextStyle(
                                                color: textColor,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400)),
                                        Text('07/25',
                                            style: TextStyle(
                                                color: textColor,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400))
                                      ])
                                ]))),
                    Image.asset('assets/icons/delete.png')
                  ])))
    ]);
  }
}

class MyTextField extends StatelessWidget {
  TextEditingController controller;
  String hint;

  MyTextField({required this.controller, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8))));
  }
}
