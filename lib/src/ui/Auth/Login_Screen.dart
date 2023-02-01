import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/src/ui/Auth/Cubit/cubit.dart';
import 'package:project/src/ui/Auth/otp_Screen.dart';
import 'package:project/src/ui/Home/Home.dart';
import 'package:project/src/ui/Shared/constant.dart';
import 'package:project/src/ui/components/component.dart';
import '../../../generated/l10n.dart';
import 'Cubit/states.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/LoginScreen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  // FocusNode _focusNode = new FocusNode();
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    //Add Listener to know when is updated focus
    // _focusNode.addListener(_onLoginUserNameFocusChange);
  }

  @override
  void dispose() {
    //Dispose Listener to know when is updated focus
    // _focusNode.addListener(_onLoginUserNameFocusChange);
    super.dispose();
  }

  // void _onLoginUserNameFocusChange() {
  //   //Force updated once if focus changed
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };

      return textColor;
    }

    return BlocConsumer<LoginScreenCubit, LoginAppStates>(
      listener: (context, state) {
        if (state is ShopLoginSuccessStates) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const OtpScreen()));
          print("succes");
        }
        if (state is ShopLoginErrorStates) {
          print("error");
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: SizedBox(
                  width: 300,
                  height: 136.58,
                  child: Image.asset(
                    'assets/images/loginImage.png',
                  ),
                ),
              ),
              const SizedBox(
                height: 58.42,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 34.0, right: 34.0),
                child: SizedBox(
                  width: 360,
                  height: 66,
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    onChanged: (val) {},
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: S.of(context).phone_number,
                      border: OutlineInputBorder(
                          // borderSide: BorderSide(color: Colors.red),
                          ),
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 28,
              // ),
              SizedBox(
                height: 28,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 34),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.c,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          border: Border.all(color: textColor, width: 2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                          child: isChecked
                              ? const Icon(
                                  Icons.check,
                                  // size: 30.0,
                                  color: textColor,
                                  size: 20,
                                )
                              : const Icon(
                                  null,
                                  // size: 30.0,
                                ),
                        ),
                        // Checkbox(
                        //   checkColor: Colors.white,
                        //   fillColor: MaterialStateProperty.resolveWith(getColor),
                        //   value: isChecked,
                        //   onChanged: (bool? value) {
                        //     setState(() {
                        //       isChecked = value!;
                        //     });
                        //   },
                        // ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                        child: Text(
                          S.of(context).remember_me,
                          style: TextStyle(color: textColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ConditionalBuilder(
                    condition: state is! ShopLoginLoadingState,
                    builder: (context) => ingridentbutton(
                        text: S.of(context).login,
                        color2: button2color,
                        color1: button1color,
                        width: 360,
                        height: 56,
                        function: () async {
                          // if (emailController.text != '') {
                          await LoginScreenCubit.get(context)
                              .userlogin(phone: emailController.text);

                          //   //   }
                          // } else {
                          //   Null;
                          // }
                        }),
                    fallback: (context) => Container(
                        child: Center(
                            child: CircularProgressIndicator(
                      color: button2color,
                    ))),
                  )),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: ingridentbutton(
              //     color2: button2color,
              //     color1: button1color,
              //     width: 360,
              //     height: 56,
              //     function: () {

              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => OtpScreen()));
              //     },
              //     text: S.of(context).login,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: defultbutton(
                    width: 360,
                    height: 56,
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    text: S.of(context).login_as_a_guest,
                    color: buttonLightcolor),
              )
            ],
          ),
        );
      },
    );
  }
}
