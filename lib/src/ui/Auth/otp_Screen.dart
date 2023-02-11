import 'dart:async';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:project/src/ui/Home/Home.dart';
import 'package:project/src/ui/Shared/constant.dart';
import 'package:project/src/ui/components/component.dart';
import 'package:project/src/ui/delivery_package/navigation_screens/delivery_cycle_screen.dart';
import 'package:project/src/ui/location/location_permission_screen.dart';
import 'package:project/src/ui/navigation_screen/chat/helper/fire_helper.dart';
import 'package:project/src/ui/widgets/widgets.dart';

import '../../../generated/l10n.dart';
import 'Cubit/cubit.dart';
import 'Cubit/states.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  Timer? countdownTimer;
  Duration myDuration = const Duration(days: 5);

  String currentText = "";
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  final formKey = GlobalKey<FormState>();

  bool loading = false;

  String? fcmToken;

  @override
  void initState() {
    startTimer();
    // _email = "himahamed999@gmail.com";
    errorController = StreamController<ErrorAnimationType>();
    init();
    super.initState();
  }

  init() async {
    fcmToken = await FireHelper.getFirebaseMessagingToken();
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = const Duration(days: 5));
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(1));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return BlocProvider(
        create: (BuildContext context) => LoginScreenCubit(),
        child: BlocConsumer<LoginScreenCubit, LoginAppStates>(
          listener: (context, state) {
            if (state is CheckOtpSuccessStates) {
              if (state.type == 0) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LocationPermissionScreen()));
              } else {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DeliveryCycleScreen()));
              }
            }

            if (state is CheckOtpErrorStates) {
              print('eroooor');
              // if (state.loginModel.status) {
              //   print(state.loginModel.message);
              //   print(state.loginModel.data.token);
              //   CacheHelper.saveData(
              //           key: 'token', value: state.loginModel.data.token)
              //       .then((value) {
              //     Navigator.pushReplacementNamed(context, "/home");
              //   });
              // } else
              //   print(state.loginModel.message);
              // showtoast(state.loginModel.message, toaststate.ERROR);
            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 167,
                        child: Padding(
                            padding:
                                const EdgeInsets.only(right: 69.0, left: 58.0),
                            child: SizedBox(
                                width: 300,
                                height: 136.58,
                                child: Image.asset(
                                    'assets/images/loginImage.png')))),
                    const SizedBox(height: 50),
                    Center(
                        child: Text(S.current.please_enter_the_otp_code,
                            style: const TextStyle(
                                fontSize: 16,
                                color: button1color,
                                fontWeight: FontWeight.w500))),
                    const SizedBox(height: 57),
                    Padding(
                      padding: const EdgeInsets.only(right: 34, left: 34),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: PinCodeTextField(
                          appContext: context,
                          pastedTextStyle: TextStyle(
                            color: Colors.green.shade600,
                            fontWeight: FontWeight.bold,
                          ),
                          length: 4,
                          textStyle: const TextStyle(color: textFieldColor),
                          // obscureText: true,
                          // obscuringCharacter: '*',
                          // obscuringWidget: FlutterLogo(size: 24),
                          blinkWhenObscuring: true,
                          animationType: AnimationType.fade,
                          // validator: (v) {
                          //   if (v!.length < 3) {
                          //     return "I'm from validator";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              fieldHeight: 50,
                              fieldWidth: 60,
                              activeFillColor: Colors.white,
                              inactiveFillColor: Colors.white,
                              disabledColor: const Color(0xffeeeeee),
                              inactiveColor: textFieldColor,
                              selectedFillColor: Colors.white,
                              activeColor: textFieldColor),
                          cursorColor: Colors.black,
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          errorAnimationController: errorController,
                          // controller: textEditingController,
                          keyboardType: TextInputType.number,
                          // ignore: prefer_const_literals_to_create_immutables
                          boxShadows: [
                            const BoxShadow(
                              offset: Offset(0, 1),
                              color: Colors.white,
                              blurRadius: 10,
                            )
                          ],
                          onCompleted: (v) {
                            print("Completed");
                            print(textEditingController.text);
                          },
                          // onTap: () {
                          //   print("Pressed");
                          // },
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              currentText = value;
                              textEditingController.text = value;
                            });
                          },
                          beforeTextPaste: (text) {
                            print("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(right: 34, left: 34),
                      child: ConditionalBuilder(
                          condition: state is! CheckOtpLoadingState,
                          builder: (context) => ingridentbutton(
                              text: S.current.continue_,
                              color2: button2color,
                              color1: button1color,
                              width: 360,
                              height: 56,
                              function: () {
                                // if (textEditingController.text.length == 4 &&
                                //     textEditingController.text != '') {
                                if (fcmToken == null) {
                                  showSnackBar(title: 'Token is empty');
                                } else {
                                  LoginScreenCubit.get(context).checkOtp(
                                      code: textEditingController.text,
                                      fcmToken: fcmToken!,
                                      context: context);
                                }
                              }),
                          fallback: (context) => const Center(
                              child: CircularProgressIndicator(
                                  color: button2color))),
                      //  ingridentbutton(
                      //   color1: button1color,
                      //   color2: button2color,
                      //   width: 360,
                      //   height: 56,
                      //   function: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => LocationPermision()));
                      //   },
                      //   text: S.current.continue_,
                      // ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Center(
                      child: Text(
                        S.current.you_did_nt_receive_any_code,
                        style: const TextStyle(
                            fontSize: 16,
                            color: button1color,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 34, left: 34),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.current.resend,
                            style: const TextStyle(
                                color: greencolor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline),
                          ),
                          Row(
                            children: [
                              Text(
                                '$minutes:$seconds',
                                style: const TextStyle(
                                    color: greencolor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                S.current.request_new_otp_code_in + "",
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: button1color,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
