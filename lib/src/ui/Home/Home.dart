import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/src/ui/navigation_screen/settings/profile/settings-Screen.dart';
import 'package:project/src/ui/widgets/keep_alive.dart' as keep;

import '../../../generated/l10n.dart';
import '../Shared/constant.dart';
import '../components/appar.dart';
import '../navigation_screen/chat/support.dart';
import '../navigation_screen/main-screens/main_Screen.dart';
import '../navigation_screen/offers-screen/offers-screen.dart';
import '../navigation_screen/orders/order-screen.dart';

class HomeScreen extends StatefulWidget {
  int? index;
  HomeScreen({super.key, this.index});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentindex = 0;

  List<String> titles = [
    'New Task',
    'Done Task',
    'Archievd Task',
  ];
  PageController? _pageController;
  late List<Widget> _pages;
  late int _selectedPageIndex;

  @override
  void initState() {
    if (widget.index != null) {
      _selectedPageIndex = widget.index!.toInt();
    } else {
      _selectedPageIndex = 0;
    }

    // _selectedPageIndex = 3;
    _pageController = PageController(initialPage: _selectedPageIndex);
    _pages = [
      const MainScreen(),
      const OffersScreen(),
      const SupportAgent(),
      const OrderScreen(),
      const SettingScreen(),
    ];
    super.initState();
  }

  // void changeindex(int index) {
  //   currentindex = index;
  //   // emit(ChangeBottomNavBarStates());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _selectedPageIndex == 2 ||
                _selectedPageIndex == 0 ||
                _selectedPageIndex == 3 ||
                _selectedPageIndex == 4
            ? null
            : RegularAppBar(
                label: 'aaa',
                icon: Image.asset('assets/icons/bell-ring.png'),
              ),
        body: PageView.custom(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (page) {},
            childrenDelegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return keep.KeepAlive(
                  widget: _pages[index], key: const ValueKey<String>(""));
            }, childCount: _pages.length)),
        bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [button2color, button1color])),
            child: BottomNavigationBar(
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                currentIndex: _selectedPageIndex,
                selectedFontSize: 18,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white,
                selectedLabelStyle: const TextStyle(fontSize: 11),
                unselectedLabelStyle: const TextStyle(fontSize: 11),
                onTap: (index) {
                  setState(() => _selectedPageIndex = index);
                  print(_selectedPageIndex);
                  _pageController!.jumpToPage(index);
                },
                items: [
                  _customNavItem(icon: 'main_ic', label: S.current.main),
                  _customNavItem(icon: 'offers_ic', label: S.current.offers),
                  const BottomNavigationBarItem(icon: SizedBox(), label: ""),
                  _customNavItem(icon: 'order_ic', label: S.of(context).orders),
                  _customNavItem(icon: 'settings_ic', label: S.current.settings)
                ])),
        floatingActionButton: ischat == false
            ? FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {
                  setState(() {
                    ischat = true;
                    print(_selectedPageIndex);
                    _selectedPageIndex = 2;
                    _pageController!.jumpToPage(_selectedPageIndex);
                  });
                },
                child: SizedBox(
                    width: 62,
                    height: 62,
                    child: Image.asset('assets/icons/BiFloraICON.png')))
            : FloatingActionButton(
                onPressed: () {
                  setState(() {
                    ischat = false;
                    print(_selectedPageIndex);
                    _selectedPageIndex = 0;
                    _pageController!.jumpToPage(_selectedPageIndex);
                  });
                },
                child: Container(
                    width: 62,
                    height: 62,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, gradient: quickButton),
                    child: Center(
                        child: SvgPicture.asset('assets/icons/home/chat.svg'))),
              ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);

    // c
    //   backgroundColor: Colors.white,
    //   onPressed: () {
    //     setState(() {
    //       ischat = true;
    //     });
    //   },
    //   child: SizedBox(
    //     width: 62,
    //     height: 62,
    //     child: SvgPicture.asset(
    //       'assets/icons/home/Ellipse 5.svg',
    //       // allowDrawingOutsideViewBox: true,
    //     ),
    // )
  }

  BottomNavigationBarItem _customNavItem(
      {required String icon, required String label}) {
    return BottomNavigationBarItem(
        icon: Container(
            margin: const EdgeInsets.only(bottom: 6, top: 6),
            child: SvgPicture.asset('assets/icons/home/$icon.svg',
                height: 20, width: 20, color: Colors.white)),
        activeIcon: Container(
            margin: const EdgeInsets.only(bottom: 6),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: SvgPicture.asset('assets/icons/home/$icon.svg',
                height: 18, width: 18, color: button1color)),
        label: label);
  }
}

class IconBottomBar extends StatelessWidget {
  final text;
  final int index;
  final String icon;
  final bool selected;
  final Function() onpressed;

  const IconBottomBar(
      {super.key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onpressed,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return selected
        ? Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 30,
                width: 55,

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                // height: 32,
                child: Container(
                  // height: 21,
                  // width: 19,
                  child: IconButton(
                      onPressed: onpressed,
                      icon: Image.asset(
                        'assets/icons/$icon',
                        // icon,
                        // size: 25,
                        color: selected ? button1color : Colors.black,
                      )),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 0.1,
                  color: selected ? Colors.white : Colors.white,
                ),
              )
            ],
          )
        : Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 30,
                width: 30,
                // height: 32,
                child: Container(
                  // height: 21,
                  // width: 19,
                  child: IconButton(
                      onPressed: onpressed,
                      icon: Container(
                        height: 20,
                        width: 20,
                        child: Image.asset(
                          'assets/icons/$icon',
                          // icon,
                          // size: 25,
                          color: selected ? button1color : Colors.white,
                        ),
                      )),
                ),
              ),
              const SizedBox(
                height: 12,
              ),

              // IconButton(
              //     onPressed: onpressed,
              //     icon: Image.asset(
              //       'assets/icons/$icon',
              //       // icon,
              //       // size: 25,
              //       color: selected ? button1color : Colors.white,
              //     )),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 0.1,
                  color: selected ? Colors.white : Colors.white,
                ),
              )
            ],
          );
  }
}
