import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:project/Models/profile_Gift_Model.dart';
import 'package:project/src/ui/Home/Cubit.dart';
import 'package:project/src/ui/Home/states.dart';

import 'package:project/src/ui/Shared/constant.dart';

import 'package:project/src/ui/components/appar.dart';
import 'package:project/src/ui/Home/Home.dart';
import 'package:project/src/ui/navigation_screen/settings/profile/settings-Screen.dart';

import '../../../../../generated/l10n.dart';
import '../../../widgets/gift-card-widget.dart';

class GiftCardScreen extends StatefulWidget {
  const GiftCardScreen({super.key});

  @override
  State<GiftCardScreen> createState() => _GiftCardScreenState();
}

class _GiftCardScreenState extends State<GiftCardScreen> {
  @override
  Widget build(BuildContext context) {
    int currentindex = 3;

    return BlocProvider(
      create: (context) => HomeCubit()..getProfieGiftData(),
      child: BlocConsumer<HomeCubit, HomeAppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
              condition: HomeCubit.get(context).profileGiftModel != null,
              builder: (context) => profileGiftScreen(
                  currentindex, HomeCubit.get(context).profileGiftModel!),
              fallback: (context) => Container(
                    color: Colors.white,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: button2color,
                      ),
                    ),
                  ));
        },
      ),
    );
  }

  Widget profileGiftScreen(int currentindex, ProfileGiftModel model) =>
      Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [button2color, button1color])),
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
              label: S.current.gift_cards,
              type: 'gift_card',
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              height: 500,
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
              // height: 495,
              child: ListView.separated(
                  // physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      GiftCardWidget(model: model.data![index]),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                  itemCount: model.data!.length),
            )
          ],
        ),
      );
}
