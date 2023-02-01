import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/Models/GetCartData_Model.dart';
import 'package:project/Models/getProfile_Model.dart';
import 'package:project/src/network/local/cache-helper.dart';
import 'package:project/src/ui/Cart_Shops/order-details.dart';
import 'package:project/src/ui/Home/Cubit.dart';
import 'package:project/src/ui/navigation_screen/order-screen.dart';
import 'package:project/src/ui/navigation_screen/settings/profile/Edit-profile.dart';
// import 'package:geolocator/geolocator.dart';
import '../../../generated/l10n.dart';
import '../Shared/constant.dart';
import '../components/component.dart';
import '../Home/Home.dart';

class MappingSet extends StatefulWidget {
  String mappingset;
  String? payment;
  String? total;
  String? totalprice;
  String? deliverycost;
  String? quickproductId;
  String? gift;

  CartData? cartmodel;
  ProfileData? profilemodel;
  MappingSet(
      {super.key,
      required this.mappingset,
      this.cartmodel,
      this.profilemodel,
      this.payment,
      this.gift,
      this.total,
      this.totalprice,
      this.deliverycost,
      this.quickproductId});

  @override
  State<MappingSet> createState() => _MappingSetState();
}

class _MappingSetState extends State<MappingSet> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(24.7136, 46.6753),
    zoom: 14.4746,
  );

  bool typing = false;
  var search = TextEditingController();
  var markers = HashSet<Marker>();
  String? _currentAddress;

  String? _currentlat;
  String? _currentlong;
  String? fullLocation;
  String? latlong;

  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition(
    LatLng latLng,
  ) async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      // position =
      setState(() => _currentPosition = position);
      // print(position.toString());
      // print('bbbbbbbcccccc');
      _getAddressFromLatLng(_currentPosition!, latLng);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position, LatLng latLng) async {
    await placemarkFromCoordinates(latLng.latitude, latLng.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.country}, ${place.subAdministrativeArea}, ${place.street}';
        counrty = place.country.toString();
        city = place.subAdministrativeArea.toString();
        street = place.street.toString();
        fullLocation = '${city}-${street}';
        mycity = '${city}';
        mystreet = '${street}';
        CacheHelper.saveData(key: 'mylocation', value: fullLocation);
        CacheHelper.saveData(key: 'mycity', value: mycity);

        CacheHelper.saveData(key: 'mystreet', value: mystreet);

        mylocation = fullLocation;

        // print(_currentAddress.toString());
        // print('aaaaaaaaaaaaaaaaa');
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  void initState() {
    clientAdress = '';
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 88,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            // height: 56,
            // width: 370,
            color: Colors.white,
            child: Center(
                child: Padding(
              padding: const EdgeInsets.only(
                  top: 49, right: 29, left: 29, bottom: 27),
              child: SizedBox(
                child: SizedBox(
                  height: 56,
                  width: 370,
                  child: defaulttextfield(
                      isQuickSearch: false,
                      controller: search,
                      type: TextInputType.text,
                      prefix: Icons.search,
                      iconColor: textColor,
                      hinttext: S.current.search_for_your_address,
                      fontsize: 14.0),
                ),
              ),
            )),
          ),
        ),
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          onTap: (latLng) {
            markers.clear();
            print('doneeee');
            print('${latLng}');
            // _handleTap;
            _getCurrentPosition(latLng);
            setState(() {
              markers.add(Marker(
                markerId: MarkerId('${latLng.latitude}, ${latLng.longitude}'),
                position: LatLng(latLng.latitude, latLng.longitude),
                // icon: BitmapDescriptor.defaultMarkerWithHue(
                //     BitmapDescriptor.hueMagenta),
              ));
              _currentlat = latLng.latitude.toString();
              _currentlong = latLng.longitude.toString();
              latlong = '${_currentlat},${_currentlong}';
            });
          },
          markers: markers,
        ),
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: _goToTheLake,
        //   label: const Text('To the lake!'),
        //   icon: const Icon(Icons.directions_boat),
        // ),
        bottomNavigationBar: SizedBox(
            height: 147,
            child: Column(children: [
              Flexible(
                child: Center(
                  child: Text(
                    _currentAddress == null
                        ? S.current.enter_Adresss
                        : '${_currentAddress}',
                    style: TextStyle(
                        color: button1color,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 34, vertical: 10),
                child: ingridentbutton(
                  color1: button1color,
                  color2: button2color,
                  width: 360,
                  height: 56,
                  function: () {
                    if (widget.mappingset == 'startlocation') {
                      CacheHelper.saveData(
                          key: 'mylocation', value: fullLocation);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    }
                    if (widget.mappingset == 'completeOrder') {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderDetails(
                                    model: widget.cartmodel,
                                    city: city,
                                    street: street,
                                    counrty: counrty,
                                    location: latlong,
                                    payment: widget.payment,
                                    gift: widget.gift,
                                    quickProductId: widget.quickproductId,
                                    totalprice: widget.totalprice,
                                    total: widget.total,
                                    deliverycost: widget.deliverycost,
                                  )));
                    }

                    if (widget.mappingset == 'changelocation') {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfile(
                                  model: widget.profilemodel,
                                  city: city,
                                  street: street,
                                  country: counrty,
                                  location: latlong)));
                    }

                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => OrderDetails()));
                  },
                  text: S.current.deliver_here,
                ),
              ),
            ])));
  }

  _handleTap(LatLng point) {
    setState(() {
      markers.add(Marker(
        markerId: MarkerId(point.toString()),
        position: point,
        infoWindow: InfoWindow(
          title: 'I am a marker',
        ),
        icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
      ));
    });
// Widget get bottomNavigationBar {
//   return Container(
//     decoration: const BoxDecoration(
//       borderRadius: BorderRadius.only(
//         topRight: Radius.circular(40),
//         topLeft: Radius.circular(40),
//       ),
//     ),
//     child: BottomNavigationBar(
//       items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.home), label: '1'),
//         BottomNavigationBarItem(icon: Icon(Icons.usb), label: '2'),
//         BottomNavigationBarItem(icon: Icon(Icons.assignment_ind), label: '3'),
//         BottomNavigationBarItem(
//             icon: Icon(Icons.multiline_chart), label: '4'),
//       ],
//       unselectedItemColor: Colors.grey,
//       selectedItemColor: Colors.black,
//       showUnselectedLabels: true,
//     ),
//   );
// }
    // Future<void> _goToTheLake() async {
    //   final GoogleMapController controller = await _controller.future;
    //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
    // }
  }

// class TextBox extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.centerLeft,
//       color: Colors.white,
//       child: TextField(
//         decoration:
//             InputDecoration(border: InputBorder.none, hintText: 'Search'),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';

// class MappingSet extends StatefulWidget {
//   const MappingSet({Key? key}) : super(key: key);

//   @override
//   State<MappingSet> createState() => _MappingSetState();
// }

// class _MappingSetState extends State<MappingSet> {
//   String? _currentAddress;
//   Position? _currentPosition;

//   Future<bool> _handleLocationPermission() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text(
//               'Location services are disabled. Please enable the services')));
//       return false;
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Location permissions are denied')));
//         return false;
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text(
//               'Location permissions are permanently denied, we cannot request permissions.')));
//       return false;
//     }
//     return true;
//   }

//   Future<void> _getCurrentPosition() async {
//     final hasPermission = await _handleLocationPermission();

//     if (!hasPermission) return;
//     await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
//         .then((Position position) {
//       setState(() => _currentPosition = position);
//       _getAddressFromLatLng(_currentPosition!);
//     }).catchError((e) {
//       debugPrint(e);
//     });
//   }

//   Future<void> _getAddressFromLatLng(Position position) async {
//     await placemarkFromCoordinates(
//             _currentPosition!.latitude, _currentPosition!.longitude)
//         .then((List<Placemark> placemarks) {
//       Placemark place = placemarks[0];
//       setState(() {
//         _currentAddress =
//             '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
//       });
//     }).catchError((e) {
//       debugPrint(e);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Location Page")),
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('LAT: ${_currentPosition?.latitude ?? ""}'),
//               Text('LNG: ${_currentPosition?.longitude ?? ""}'),
//               Text('ADDRESS: ${_currentAddress ?? ""}'),
//               const SizedBox(height: 32),
//               ElevatedButton(
//                 onPressed: _getCurrentPosition,
//                 child: const Text("Get Current Location"),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
}
