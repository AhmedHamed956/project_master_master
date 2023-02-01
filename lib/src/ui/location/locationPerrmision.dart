import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:project/src/network/local/cache-helper.dart';
import 'package:project/src/ui/Auth/Cubit/cubit.dart';
import 'package:project/src/ui/Home/Cubit.dart';
import 'package:project/src/ui/Home/Home.dart';
import 'package:project/src/ui/delivery_package/navigation_screens/delivery_cycle_screen.dart';
import 'package:project/src/ui/delivery_package/navigation_screens/nav_screen.dart';

import '../../../generated/l10n.dart';
import '../../common/global.dart';
import '../Auth/Cubit/states.dart';
import '../Shared/constant.dart';
import 'mappingSet.dart';

class LocationPermision extends StatefulWidget {
  const LocationPermision({super.key});

  @override
  State<LocationPermision> createState() => _LocationPermisionState();
}

class _LocationPermisionState extends State<LocationPermision> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [button1color, button2color],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 28,
            ),
            Center(
              child: Text(
                S.current.allow_the_app_to_use_your_location,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 47,
            ),
            Center(
                child: InkWell(
              onTap: () {
                deliveryApp == 0 || deliveryApp == null
                    ? Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MappingSet(
                                  mappingset: 'startlocation',
                                )))
                    : Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DeliveryCycleScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 34, left: 34),
                child: Container(
                  width: 360,
                  height: 56,
                  child: Center(
                    child: Text(
                      S.current.allow_once,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Colors.white,
                      )),
                ),
              ),
            )),
            SizedBox(
              height: 25,
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.only(right: 34, left: 34),
              child: InkWell(
                onTap: () {
                  deliveryApp == 0 || deliveryApp == null
                      ? Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MappingSet(
                                    mappingset: 'startlocation',
                                  )))
                      : Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DeliveryCycleScreen()));
                },
                child: Container(
                  width: 360,
                  height: 56,
                  child: Center(
                    child: Text(
                      S.current.allow_location,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Colors.white,
                      )),
                ),
              ),
            )),
            SizedBox(
              height: 25,
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.only(right: 34, left: 34),
              child: InkWell(
                onTap: () {
                  deliveryApp == 0 || deliveryApp == null
                      ? Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MappingSet(
                                    mappingset: 'startlocation',
                                  )))
                      : Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DeliveryCycleScreen()));
                },
                child: Container(
                  width: 360,
                  height: 56,
                  child: Center(
                    child: Text(
                      S.current.do_not_allow,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Colors.white,
                      )),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
