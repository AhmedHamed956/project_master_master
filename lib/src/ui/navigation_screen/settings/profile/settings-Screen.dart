import 'dart:developer';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/Models/getProfile_Model.dart';
import 'package:project/src/blocs/global_bloc/global_bloc.dart';
import 'package:project/src/ui/Home/Cubit.dart';
import 'package:project/src/ui/Home/states.dart';
import 'package:project/src/ui/Shared/constant.dart';
import 'package:project/src/ui/delivery_package/navigation_screens/delivery_cycle_screen.dart';
import 'package:project/src/ui/navigation_screen/settings/My-Walet/myWalet-screen.dart';
import 'package:project/src/ui/navigation_screen/settings/profile/terms-screens.dart';
import 'package:project/src/ui/navigation_screen/settings/profile/webView_Rep.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../generated/l10n.dart';
import '../../../../common/global.dart';
import '../../../../network/local/cache-helper.dart';
import '../../../components/component.dart';
import '../../../delivery_package/navigation_screens/nav_screen.dart';
import 'Edit-profile.dart';
import 'gift-card.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late GlobalBloc _globalBloc;

  @override
  void initState() {
    _globalBloc = BlocProvider.of<GlobalBloc>(context);
    super.initState();
  }

  _launchURL() async {
    const url = 'https://biflora.bluecode.sa/reg-representative';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getProfieData(),
      child: BlocConsumer<HomeCubit, HomeAppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
              condition: HomeCubit.get(context).profileModel != null,
              builder: (context) {
                return getScreen(HomeCubit.get(context).profileModel!.data!);
              },
              fallback: (context) => Container(
                  color: Colors.white,
                  child: Center(
                      child: CircularProgressIndicator(
                    color: button2color,
                  ))));
        },
      ),
    );
  }

  Widget getScreen(ProfileData model) => Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
              child: Column(children: [
                Row(children: [
                  Container(
                      // decoration: BoxDecoration(
                      //     gradient: quickButton,
                      //     borderRadius: BorderRadius.circular(10)),
                      height: 70,
                      width: 70,
                      child: Padding(
                          padding: const EdgeInsets.all(0.1),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: model.avatar == 'user.svg'
                                      ? SvgPicture.network(
                                          '${domainlink}${model.avatar}')
                                      : Image.network(
                                          '${domainlink}${model.avatar}'))))),
                  const SizedBox(width: 16),
                  Expanded(
                      child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text('${model.name}',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: textColor)),
                        const SizedBox(height: 11.33),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${model.email}',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: textColor)),
                              Text(
                                '${model.phone}',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: textColor),
                              ),
                              // SizedBox(width: 40),
                            ]),
                        const SizedBox(height: 14.74),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EditProfile(model: model)));
                            },
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.zero,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        gradient: maingradientColor),
                                    child: Text(S.current.edit_profile,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white)),
                                  )
                                ]))
                      ]))
                ]),
                const SizedBox(height: 26),
                Padding(
                    padding: const EdgeInsets.only(right: 20, left: 30),
                    child: Divider(color: profilebordercolor.withOpacity(0.8))),
                const SizedBox(height: 26),
                _rowWidget(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyWalletScreen()));
                    },
                    label: S.current.my_wallet,
                    icon: 'assets/icons/1.png'),
                const SizedBox(height: 25),
                _rowWidget(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GiftCardScreen()));
                    },
                    label: S.current.gift_cards,
                    icon: 'assets/icons/2.png'),
                const SizedBox(height: 25),
                _rowWidget(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TermsScreen(title: S.current.about_biflora)));
                    },
                    label: S.current.about_biflora,
                    icon: 'assets/icons/3.png'),
                const SizedBox(height: 25),
                _rowWidget(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TermsScreen(title: S.current.contact_us)));
                    },
                    label: S.current.contact_us,
                    icon: 'assets/icons/4.png'),
                const SizedBox(height: 25),
                _rowWidget(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TermsScreen(
                                  title: S.current.terms_conditions)));
                    },
                    label: S.current.terms_conditions,
                    icon: 'assets/icons/5.png'),
                const SizedBox(height: 25),
                _rowWidget(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TermsScreen(
                                  title: S.current.privacy_policy)));
                    },
                    label: S.current.privacy_policy,
                    icon: 'assets/icons/6.png'),
                const SizedBox(height: 25),
                _rowWidget(
                    onTap: () {
                      sginOut(context);
                    },
                    label: S.current.logout,
                    icon: 'assets/icons/7.png'),
                const SizedBox(height: 25),
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 56,
                  child: ingridentbutton(
                    text: S.of(context).delivery_mode,
                    function: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WebViewPage()));

                      // deliveryApp = true;
                      // CacheHelper.saveData(
                      //         key: 'deliveryApp', value: deliveryApp)
                      //     .then((value) => {
                      //           Navigator.pushReplacement(
                      //               context,
                      //               MaterialPageRoute(
                      //                   builder: (context) =>
                      //                       DeliveryCycleScreen()))
                      //         });
                    },
                    color1: Color(0xAFF59B81E),
                    color2: Color(0xAFFB0C81F),
                  ),
                ),
                const SizedBox(height: 60),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Container(
                      child: Text(
                    "${S.current.app_version}V2.00",
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: textColor),
                  ))
                ]),
                const SizedBox(height: 30),
              ])),
        ),
      );

  Widget _rowWidget(
      {required Function onTap, required String label, required String icon}) {
    return InkWell(
        onTap: () => onTap(),
        child: Row(children: [
          Container(
              height: 36,
              width: 36,
              decoration: const BoxDecoration(
                  color: buttonLightcolor, shape: BoxShape.circle),
              child: Image.asset(icon)),
          const SizedBox(width: 16),
          Text(label,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: button1color))
        ]));
  }

  void _changeLang() {
    _globalBloc.add(const ChangeLangEvent());
  }
}
