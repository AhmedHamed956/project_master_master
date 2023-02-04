import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

// import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as handler;

// import 'package:permission_handler/permission_handler.dart';
import 'package:project/src/ui/delivery_package/navigation_screens/delivery_cycle_screen.dart';

import '../../../generated/l10n.dart';
import '../../common/global.dart';
import '../Shared/constant.dart';
import '../widgets/widgets.dart';
import 'mapping_set.dart';

class LocationPermissionScreen extends StatefulWidget {
  @override
  State<LocationPermissionScreen> createState() =>
      _LocationPermissionScreenState();
}

class _LocationPermissionScreenState extends State<LocationPermissionScreen> {
  late bool gpsEnabled;

  late PermissionStatus status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [button1color, button2color])),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 28),
              Center(
                  child: Text(S.current.allow_the_app_to_use_your_location,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500))),
              const SizedBox(height: 24),
              button(
                  title: S.current.allow_once,
                  onTap: () async {
                    gpsEnabled = await isGPSEnabled();
                    status = await getPermissionStatus();

                    if (status == PermissionStatus.denied) {
                      handler.openAppSettings();
                    } else {
                      if (!gpsEnabled) {
                        showSnackBar(
                            title: S.current.please_turn_on_the_gps_location_service_to_continue);
                        await requestPermission();
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                deliveryApp == 0 || deliveryApp == null
                                    ? MappingSet(
                                    mappingset: 'startlocation',
                                    getLocation: true)
                                    : DeliveryCycleScreen()));
                      }
                    }
                    log("$gpsEnabled , ${status.name} , ${status.authorized} , ${status.index}");
                  }),
              button(
                  title: S.current.allow_location,
                  onTap: () async {
                    gpsEnabled = await isGPSEnabled();
                    status = await getPermissionStatus();

                    if (status == PermissionStatus.denied) {
                      handler.openAppSettings();
                    } else {
                      if (!gpsEnabled) {
                        showSnackBar(
                            title: S.current.please_turn_on_the_gps_location_service_to_continue);
                        await requestPermission();
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    deliveryApp == 0 || deliveryApp == null
                                        ? MappingSet(
                                            mappingset: 'startlocation',
                                            getLocation: true)
                                        : DeliveryCycleScreen()));
                      }
                    }
                  }),
              button(
                  title: S.current.do_not_allow,
                  onTap: () {
                    deliveryApp == 0 || deliveryApp == null
                        ? Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MappingSet(mappingset: 'startlocation')))
                        : Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DeliveryCycleScreen()));
                  })
            ])));
  }

  Widget button({required String title, required Function onTap}) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(34, 24, 34, 0),
        child: InkWell(
            onTap: () => onTap(),
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.white)),
                child: Center(
                    child: Text(title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400))))));
  }
}
