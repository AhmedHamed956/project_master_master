import 'package:flutter/material.dart';
import 'package:project/src/network/local/cache-helper.dart';
import 'package:project/src/ui/Auth/Login_Screen.dart';

import '../../common/global.dart';

const Color mainBackgourndColor = Color(0xffF5F5F5);
const Color textFieldColor = Color(0xff79747E);
const Color textColor = Color(0xff5B5B5B);
const Color lighttextColor = Color(0xffACACB5);
const Color blueColor = Color(0xff0066FF);
const Color whatsAppColor = Color(0xffF4F4F4);

const Color switchcolor = Color(0xff89B211);
const Color performaceCardcolor = Color(0xffD2D2D2);
const Color button1color = Color(0xff701EB8);
const Color button2color = Color(0xffA10CA4);
const Color buttonLightcolor = Color(0xffE8CDFF);
const Color greencolor = Color(0xff59B81E);
const Color quickcolor = Color(0xff5ddffdf);
const Color appbarcolor = Color(0xffF5F5F5);
const Color mainColorLite = Color(0xff2f84ed);
const Color shopCloseColorLite = Color(0xffA8A8A8);
const Color purpleColor = Color(0xff980FA7);
const Color indicatorColor = Color(0xff9C0DA5);
const Color borderColor = Color(0xff8516AF);
const Color shadowColor = Color(0xff000000);
const Color orderCardColor = Color(0xffF6EDFF);
const Color cancelButtonColor = Color(0xffFF4747);
const Color trackpointColor = Color(0xffCECECE);
const Color rateColor = Color(0xffFFA41B);
const Color smalltextColor = Color(0xff111212);
const Color dividerColor = Color(0xffE8E8E8);
const Color cardcolor = Color(0xffEFEFEF);
const Color textfieldLabelcolor = Color(0xff49454F);
const Color profilebordercolor = Color(0xff464646);
const Color clienderbordercolor = Color(0xff0A7AFF);
late String? counrty = '';
late String? city = '';
late String? street = '';
String clientAdress = "";
bool? cartIseEmpty;
String scheduled = '';
String time = '';
String am_pm = '';
 int? stepp ;
const int currentindex = 0;
bool ischat = false;
String? token;
String? mylocation;
String? mycity;

String? mystreet;

bool showcart = false;
const String domainlink = 'https://biflora.bluecode.sa/';
int total = 0;

// const Container ingr edient = const Container(decoration: BoxDecoration(
//   gradient:
// ),)
LinearGradient kAmberGradientColor = const LinearGradient(colors: [
  Color(0xAFF8C322),
  Color(0xAFFFDC69),
]);
LinearGradient quickButton = const LinearGradient(colors: [
  Color(0xff59b81e),
  Color(0xffb0c81f),
]);
LinearGradient trackPointButton = const LinearGradient(colors: [
  Color(0xffCECECE),
  Color(0xffCECECE),
]);
LinearGradient maingradientColor =
    const LinearGradient(colors: [button1color, button2color]);

void sginOut(context) async {
  await storage.delete(key: "myLocation");
  await storage.delete(key: "myAddress");

  CacheHelper.removeData(key: 'token').then((value) {
    CacheHelper.removeData(key: 'mylocation').then((value) {}).then((value) {
      CacheHelper.removeData(key: 'mycity').then((value) {}).then((value) {
        CacheHelper.removeData(key: 'mycity').then((value) {}).then((value) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
        });
      });
    });
  });
}
