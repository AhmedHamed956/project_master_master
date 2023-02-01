import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:project/src/ui/Shared/constant.dart';

import 'package:project/src/ui/components/appar.dart';

import '../../../../../generated/l10n.dart';
import '../../../Home/Home.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({super.key, required this.title});

  final String title;

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  int currentindex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [button2color, button1color])),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: BottomAppBar(
            elevation: 0,
            color: Colors.transparent,
            child: SizedBox(
              height: 56,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconBottomBar(
                        index: currentindex,
                        text: S.current.main,
                        icon: 'menu-open.png',
                        selected: currentindex == 0,
                        onpressed: () {
                          setState(() {
                            currentindex = 0;
                            print(currentindex);
                          });
                        }),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: IconBottomBar(
                          index: currentindex,
                          text: S.current.orders,
                          icon: 'basket.png',
                          selected: currentindex == 1,
                          onpressed: () {
                            setState(() {
                              currentindex = 1;
                              print(currentindex);
                            });
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: IconBottomBar(
                          index: currentindex,
                          text: S.current.offers,
                          icon: 'offers.png',
                          selected: currentindex == 2,
                          onpressed: () {
                            setState(() {
                              currentindex = 2;
                              print(currentindex);
                            });
                          }),
                    ),
                    IconBottomBar(
                        index: currentindex,
                        text: S.current.settings,
                        icon: 'Vector.png',
                        selected: currentindex == 3,
                        onpressed: () {
                          setState(() {
                            currentindex = 3;
                            print(currentindex);
                          });
                        })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,

        //Floating action button on Scaffold
        onPressed: () {
          //code to execute on button press
        },
        child: Container(
          width: 62,
          height: 63,
          child: Image.asset(
            'assets/icons/BiFloraICON.png',
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: mainBackgourndColor,
      body: Column(
        children: [
          AppBarWidget(
            label: widget.title,
          ),
          SizedBox(
            height: 35,
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 8,
                      offset: Offset(0, -4), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              height: 495,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 25, top: 34, bottom: 19),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: buttonLightcolor),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 19, top: 19, bottom: 16),
                    child: SingleChildScrollView(
                      child: Text(S.current.lorem),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
