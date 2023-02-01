import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/src/ui/Home/Home.dart';

import '../../../../generated/l10n.dart';
import '../../../blocs/global_bloc/global_bloc.dart';
import '../../../common/global.dart';
import '../../../network/local/cache-helper.dart';
import '../../Shared/constant.dart';
import '../../components/component.dart';
import '../../widgets/order-widgets/order-cancel.dart';
import '../../widgets/order-widgets/order-schedule.dart';
import '../../widgets/order-widgets/orderPrepare-widget.dart';

class DeliverySettingScreen extends StatefulWidget {
  const DeliverySettingScreen({super.key});

  @override
  State<DeliverySettingScreen> createState() => _DeliverySettingScreenState();
}

class _DeliverySettingScreenState extends State<DeliverySettingScreen> {
  FocusNode _focusNode = new FocusNode();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController idController = TextEditingController();

  @override
  final Shader linearGradient = LinearGradient(
    colors: <Color>[
      Color(0xAFF59B81E),
      Color(0xAFF59B81E),
      Color(0xAFFB0C81F),
    ],
  ).createShader(
    Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
  );
  late GlobalBloc _globalBloc;

  @override
  void initState() {
    super.initState();
    _globalBloc = BlocProvider.of<GlobalBloc>(context);

    //Add Listener to know when is updated focus
    _focusNode.addListener(_onLoginUserNameFocusChange);
  }

  @override
  void dispose() {
    //Dispose Listener to know when is updated focus
    _focusNode.addListener(_onLoginUserNameFocusChange);

    super.dispose();
  }

  void _onLoginUserNameFocusChange() {
    //Force updated once if focus changed
    setState(() {});
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 18,
          elevation: 0.0,
          backgroundColor: appbarcolor,
          automaticallyImplyLeading: false,
          bottom: TabBar(
            indicatorColor: indicatorColor,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: purpleColor,
            unselectedLabelColor: textColor,

            // isScrollable: true,
            padding: EdgeInsets.symmetric(horizontal: 10),
            // indicatorPadding: EdgeInsets.only(right: 20),
            // labelPadding: EdgeInsets.only(left: 20),
            labelStyle: TextStyle(
              fontSize: 16,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 16,
            ),
            // indicator: BoxDecoration(
            //   color: Colors.white,
            // ),
            tabs: [
              Tab(
                child: Container(
                    child: Text(
                  S.current.private_profile,
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                )),
              ),
              Tab(
                child: Container(
                  child: Text(
                    S.current.car,
                    style: TextStyle(
                        // color: purpleColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    S.current.files,
                    style: TextStyle(
                        // color: purpleColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    S.current.bank,
                    style: TextStyle(
                        // color: purpleColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Icon(Icons.flight, size: 350),

            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 34, vertical: 28),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            S.current.your_information,
                            style: TextStyle(
                                color: textColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      Stack(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                              child: Container(
                                height: 56,
                                width: MediaQuery.of(context).size.width,
                                child: TextField(
                                  textAlign: TextAlign.right,
                                  keyboardType: TextInputType.text,
                                  controller: nameController,
                                  style: const TextStyle(color: textColor),
                                  maxLines: 2,
                                  decoration: const InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(126, 132, 138, 1),
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: textFieldColor, width: 0.0),
                                    ),
                                  ),
                                  focusNode: _focusNode,
                                ),
                              )),
                          Row(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 7),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 7),
                                color: Colors
                                    .white, // input outline default seems using 4.0 as padding from their source
                                child: Text(
                                  S.current.the_name,
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
                        height: 15,
                      ),
                      Stack(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                              child: Container(
                                height: 56,
                                width: MediaQuery.of(context).size.width,
                                child: TextField(
                                  textAlign: TextAlign.right,
                                  keyboardType: TextInputType.phone,
                                  controller: phoneController,
                                  style: const TextStyle(color: textColor),
                                  maxLines: 2,
                                  decoration: const InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(126, 132, 138, 1),
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: textFieldColor, width: 0.0),
                                    ),
                                  ),
                                  focusNode: _focusNode,
                                ),
                              )),
                          Row(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 7),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 7),
                                color: Colors
                                    .white, // input outline default seems using 4.0 as padding from their source
                                child: Text(
                                  S.current.phone_number,
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
                        height: 15,
                      ),
                      Stack(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                              child: Container(
                                height: 56,
                                width: MediaQuery.of(context).size.width,
                                child: TextField(
                                  textAlign: TextAlign.right,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
                                  style: const TextStyle(color: textColor),
                                  maxLines: 2,
                                  decoration: const InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(126, 132, 138, 1),
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: textFieldColor, width: 0.0),
                                    ),
                                  ),
                                  focusNode: _focusNode,
                                ),
                              )),
                          Row(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 7),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 7),
                                color: Colors
                                    .white, // input outline default seems using 4.0 as padding from their source
                                child: Text(
                                  S.current.email_address,
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
                        height: 15,
                      ),
                      Stack(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                              child: Container(
                                height: 56,
                                width: MediaQuery.of(context).size.width,
                                child: TextField(
                                  textAlign: TextAlign.right,
                                  keyboardType: TextInputType.text,
                                  controller: idController,
                                  style: const TextStyle(color: textColor),
                                  maxLines: 2,
                                  decoration: const InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(126, 132, 138, 1),
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: textFieldColor, width: 0.0),
                                    ),
                                  ),
                                  focusNode: _focusNode,
                                ),
                              )),
                          Row(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 7),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 7),
                                color: Colors
                                    .white, // input outline default seems using 4.0 as padding from their source
                                child: Text(
                                  S.current.national_ID_number,
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
                        height: 25,
                      ),
                      const Divider(
                        color: dividerColor,
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.current.language,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: textColor),
                            ),
                            InkWell(
                                onTap: _changeLang,
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 16),
                                    child: Text(S.of(context).app_language,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: button1color)))),
                          ]),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        color: dividerColor,
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        S.current.delete_profile,
                        style: TextStyle(
                            foreground: Paint()..shader = linearGradient,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 56,
                          child: ingridentbutton(
                            color1: button1color,
                            color2: button2color,
                            text: S.current.update,
                            function: () {},
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 56,
                        child: ingridentbutton(
                          text: S.current.client_mode,
                          function: () {
                            setState(() {
                              // deliveryApp = false;
                              // CacheHelper.saveData(
                              //     key: 'deliveryApp', value: deliveryApp);
                            });

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          },
                          color1: Color(0xAFF59B81E),
                          color2: Color(0xAFFB0C81F),
                        ),
                      ),
                    ],
                  ),
                )),
            Center(
              child: Text('Cars'),
            ),
            Center(
              child: Text('Files'),
            ),
            Center(
              child: Text('BANK'),
            )
          ],
        ),
      ),
    );
  }

  void _changeLang() {
    _globalBloc.add(const ChangeLangEvent());
  }
}
