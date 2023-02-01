import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:geolocator/geolocator.dart';
import 'package:project/src/ui/delivery_package/cubits/delivery/delivery_cubit.dart';
import 'package:project/src/ui/delivery_package/cubits/tracking/tracking_cubit.dart';
import 'package:project/src/ui/delivery_package/navigation_screens/delivery_setting_screen.dart';
import 'package:project/src/ui/delivery_package/navigation_screens/main_screen.dart';
import 'package:project/src/ui/delivery_package/navigation_screens/performance_screen.dart';
import 'package:project/src/ui/delivery_package/navigation_screens/wallet_screen.dart';
import 'package:project/src/ui/widgets/keep_alive.dart' as keep;

import '../../../../generated/l10n.dart';
import '../../Shared/constant.dart';
import 'orders_screen.dart';

class DeliveryHomeScreen extends StatefulWidget {
  const DeliveryHomeScreen({super.key});

  @override
  State<DeliveryHomeScreen> createState() => _DeliveryHomeScreenState();
}

class _DeliveryHomeScreenState extends State<DeliveryHomeScreen> {
  int _selectedPageIndex = 2;
  final PageController _pageController = PageController(initialPage: 2);

  final List<Widget> _pages = [
    const DeliveryOrdersScreen(),
    const DeliveryWallet(),
    const DeliveryMainScreen(),
    const PerformanceScreen(),
    const DeliverySettingScreen(),
  ];

  int _automatic = 0;
  int _available = 0;

  bool _sendInitiail = false;
  Position? position;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<DeliveryCubit, DeliveryState>(
              listener: (BuildContext context, state) async {
            if (state is InitialDeliverySuccess) {
              print("setInitial : ${state.response.toJson()}");
              _sendInitiail = true;
              _available = state.response.data!.active!;
              _automatic = state.response.data!.autoAccpet!;
              setState(() {});
            }

            if (state is UpdateStatusSuccess) {
              print("UpdateStatusSuccess : ${state.response.toJson()}");

              _available = state.response.data!.active!;
              _automatic = state.response.data!.autoAccpet!;
              setState(() {});
            }
            if (state is AcceptOrderSuccess) {
              // setState(() => _selectedPageIndex = 0);
              // _pageController!.jumpToPage(0);
            }
          }),
          BlocListener<TrackingCubit, TrackingState>(
              listener: (BuildContext context, state) async {
            if (state is GoToMarketSuccess) {
              setState(() => _selectedPageIndex = 2);
              _pageController.jumpToPage(2);
            }
            if (state is GoToClientSuccess) {
              setState(() => _selectedPageIndex = 2);
              _pageController.jumpToPage(2);
            }
            if (state is CloseOrderSuccess) {
              setState(() => _selectedPageIndex = 2);
              _pageController.jumpToPage(2);
            }
          }),
        ],
        child: Scaffold(
          appBar: _selectedPageIndex == 4
              ? null
              : AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  elevation: 2,
                  title: Row(children: [
                    InkWell(
                        onTap: _changeAvailable,
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(36),
                                border: Border.all(
                                    color: _available == 0
                                        ? Colors.red
                                        : Colors.blue)),
                            child: Center(
                                child: Text(
                                    _available == 0
                                        ? S.current.unavailable
                                        : S.current.available,
                                    style: TextStyle(
                                        color: _available == 0
                                            ? Colors.red
                                            : Colors.blue,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400))))),
                    const Spacer(),
                    Text(S.current.automatic_acceptance,
                        style: const TextStyle(
                            color: textColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                    const Spacer(),
                    FlutterSwitch(
                        value: _automatic == 1 ? true : false,
                        activeColor: switchcolor,
                        onToggle: (val) {
                          context.read<DeliveryCubit>().updateStatus(
                              autoAccept: val == false ? 0 : 1,
                              active: _available);
                        })
                  ])),
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
                    _pageController.jumpToPage(index);
                  },
                  items: [
                    _customNavItem(icon: 'order_ic', label: S.current.orders),
                    _customNavItem(icon: 'wallet_ic', label: S.current.wallet),
                    _customNavItem(icon: 'main_ic', label: S.current.main),
                    _customNavItem(
                        icon: 'tag_ic', label: S.of(context).performance),
                    _customNavItem(
                        icon: 'settings_ic', label: S.current.settings),
                  ])),
        ));
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

  Future<Position> _determinePosition() async {
    LocationPermission permission;

// Test if location services are enabled.

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    } else {
      // serviceEnabled = true;
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return Geolocator.getCurrentPosition();
  }

  void _changeAvailable() async {
    if (_sendInitiail == false) {
      position = await _determinePosition();
      context.read<DeliveryCubit>().setInitial(
          active: 1,
          autoAccept: 0,
          map: "${position!.latitude},${position!.longitude}");
    } else {
      context.read<DeliveryCubit>().updateStatus(
          autoAccept: _automatic, active: _available == 0 ? 1 : 0);
    }
  }
}
