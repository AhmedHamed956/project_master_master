import 'package:flutter/material.dart';
import 'package:project/src/ui/Home/Cubit.dart';
import 'package:project/src/ui/navigation_screen/main-screens/digital-Screens/digital-Screen.dart';

import '../../../../../generated/l10n.dart';
import '../../../Shared/constant.dart';
import '../../../components/appar.dart';
import '../../../components/component.dart';

class DigtalOrders extends StatefulWidget {
  String price;
  String productID;
  TextEditingController namecontroller;
  TextEditingController phonecontroller;
  DigtalOrders(
      {super.key,
      required this.namecontroller,
      required this.phonecontroller,
      required this.productID,
      required this.price});

  @override
  State<DigtalOrders> createState() => _DigtalOrdersState();
}

class _DigtalOrdersState extends State<DigtalOrders> {
  FocusNode _focusNode = new FocusNode();
  FocusNode _focusNode2 = new FocusNode();

  @override
  void initState() {
    super.initState();
    //Add Listener to know when is updated focus
    _focusNode.addListener(_onLoginUserNameFocusChange);
    _focusNode2.addListener(_onLoginUserNameFocusChange);
  }

  @override
  void dispose() {
    //Dispose Listener to know when is updated focus
    _focusNode.addListener(_onLoginUserNameFocusChange);
    _focusNode2.addListener(_onLoginUserNameFocusChange);

    super.dispose();
  }

  void _onLoginUserNameFocusChange() {
    //Force updated once if focus changed
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgourndColor,
      appBar: AppBarWidget(label: S.current.order_details),
      body: SingleChildScrollView(
        child: Container(
            height: 600,
            width: double.infinity,
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
                  //  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      child: Row(
                        children: [
                          Text(
                            S.current.who_the_gift_for,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 26, right: 22, bottom: 17),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              children: <Widget>[
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 6, 0, 0),
                                    child: Container(
                                      height: 56,
                                      width: 360,
                                      child: TextField(
                                        textAlign: TextAlign.right,
                                        keyboardType: TextInputType.text,
                                        controller: widget.namecontroller,
                                        style:
                                            const TextStyle(color: textColor),
                                        maxLines: 2,
                                        decoration: const InputDecoration(
                                          focusedBorder: OutlineInputBorder(
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
                            SizedBox(
                              height: 16,
                            ),
                            Stack(
                              children: <Widget>[
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 6, 0, 0),
                                    child: Container(
                                      height: 56,
                                      width: 360,
                                      child: TextField(
                                        textAlign: TextAlign.right,
                                        keyboardType: TextInputType.number,
                                        controller: widget.phonecontroller,
                                        style: TextStyle(color: textColor),
                                        maxLines: 2,
                                        decoration: const InputDecoration(
                                          focusedBorder: OutlineInputBorder(
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
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 7, 0),
                                      padding:
                                          const EdgeInsets.fromLTRB(4, 0, 4, 0),
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

                            // defaulttextfield(
                            //     controller: nameController,
                            //     type: TextInputType.name,
                            //     label: 'aa')
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(right: 21, left: 20),
                      child: Divider(
                        color: dividerColor,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 25, left: 26, top: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Text(
                                S.current.payment_method,
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  'VISA  5841-XXXX-XXXX-XXXX',
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Container(
                                height: 36,
                                width: 110,
                                decoration: BoxDecoration(
                                    gradient: quickButton,
                                    borderRadius: BorderRadius.circular(6.0)),
                                child: Center(
                                  child: Text(
                                    S.current.add_new_card,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 21, left: 20),
                      child: Divider(
                        color: dividerColor,
                      ),
                    ),
                    SizedBox(
                      height: 29,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 11, right: 12),
                      child: Container(
                        // height: 100,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: buttonLightcolor,
                              width: 1,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 19, bottom: 19),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 21,
                                  right: 28,
                                  bottom: 9,
                                  // top: 19,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      S.current.total_amount,
                                      style: TextStyle(
                                        color: textColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      '${widget.price} ${S.current.rs}',
                                      style: TextStyle(
                                        color: textColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: dividerColor,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 21,
                                  right: 28,
                                  top: 9,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      S.current.total_calculted_amount,
                                      style: TextStyle(
                                        color: button1color,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      '${widget.price} ${S.current.rs}',
                                      style: TextStyle(
                                        color: button1color,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                    bottom: 30,
                  ),
                  child: Container(
                    width: 378,
                    height: 56,
                    child: ingridentbutton(
                        function: () {
                          HomeCubit()
                              .postdigitalorder(
                                  name: widget.namecontroller.text,
                                  phone: widget.phonecontroller.text,
                                  productID: widget.productID,
                                  price: widget.price)
                              .then((value) =>
                                  Navigator.pushReplacement<void, void>(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            DigtalScreen(),
                                      )));
                        },
                        color1: button1color,
                        color2: button2color,
                        text: S.current.complete_order),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
