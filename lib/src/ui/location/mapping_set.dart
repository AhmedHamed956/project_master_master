import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/Models/model/location_model.dart';
import 'package:project/src/common/global.dart';
import 'package:project/src/network/local/cache-helper.dart';
import 'package:project/src/ui/Cart_Shops/order-details.dart';
import 'package:project/src/ui/Home/Cubit.dart';
import 'package:project/src/ui/Home/states.dart';
import 'package:project/src/ui/navigation_screen/settings/profile/Edit-profile.dart';
import 'package:project/src/ui/widgets/widgets.dart';

import '../../../Models/model/cart_data.dart';
import '../../../Models/model/user_model.dart';
import '../../../generated/l10n.dart';
import '../Home/Home.dart';
import '../Shared/constant.dart';
import '../components/component.dart';

class MappingSet extends StatefulWidget {
  String mappingset;
  String? payment;
  String? total;
  String? totalprice;
  String? deliverycost;
  String? quickproductId;
  String? gift;

  CartData? cartmodel;
  UserModel? profilemodel;

  bool? getLocation = false;

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
      this.quickproductId,
      this.getLocation});

  @override
  State<MappingSet> createState() => _MappingSetState();
}

class _MappingSetState extends State<MappingSet> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(24.7136, 46.6753), zoom: 14.0);

  bool typing = false;
  var search = TextEditingController();
  Set<Marker> markers = {};
  String? _currentAddress;

  double? _currentlat;
  double? _currentlong;
  String? fullLocation;
  String? latlong;

  Position? _currentPosition;

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  List<LocationModel> _locations = [];
  late HomeCubit _homeCubit;

  late GoogleMapController mapController;

  LocationModel? searchLocation;
  LocationModel? mapLocation;

  @override
  void initState() {
    clientAdress = '';
    _homeCubit = BlocProvider.of<HomeCubit>(context);
    _homeCubit.getLocations();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 88,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            flexibleSpace: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Column(children: [
                  SizedBox(height: MediaQuery.of(context).padding.top),
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    Expanded(
                        child: TypeAheadFormField(
                            textFieldConfiguration: TextFieldConfiguration(
                                // textDirection: _textDirection,
                                // onChanged: _onChange,
                                controller: _searchController,
                                focusNode: _focusNode,
                                style: const TextStyle(fontSize: 14),
                                decoration: InputDecoration(
                                    suffixIcon: _focusNode.hasFocus
                                        ? IconButton(
                                            onPressed: _clearBtnTap,
                                            icon: const Icon(Icons.close,
                                                color: Colors.black))
                                        : const SizedBox(),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 16),
                                    hintText: S.current.search_for_your_address,
                                    hintStyle:
                                        const TextStyle(color: textColor),
                                    filled: true,
                                    fillColor: Theme.of(context).cardColor,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .unselectedWidgetColor)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .unselectedWidgetColor)))),
                            noItemsFoundBuilder: (BuildContext context) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 16),
                                child: Text(S.current.no_similar_results_found,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Theme.of(context).disabledColor, fontSize: 16.0))),
                            minCharsForSuggestions: 1,
                            suggestionsBoxDecoration: SuggestionsBoxDecoration(
                                // borderRadius: BorderRadius.circular(4),
                                color: Theme.of(context).cardColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                clipBehavior: Clip.hardEdge),
                            suggestionsCallback: HomeCubit().suggestSearch,
                            itemBuilder: (context, String text) {
                              return Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  child: Row(children: [
                                    const Icon(Icons.location_on),
                                    const SizedBox(width: 8),
                                    Expanded(
                                        child: Text(text,
                                            style:
                                                const TextStyle(fontSize: 14)))
                                  ]));
                            },
                            onSuggestionSelected: _onSuggestionSelected))
                  ])
                ]))),
        body: BlocBuilder<HomeCubit, HomeAppState>(builder: (context, state) {
          if (state is GetLocationsSuccessStates) {
            _locations = state.items;
          }
          return GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: _onMapCreated,
              zoomControlsEnabled: false,
              onTap: _onMapTap,
              markers: markers);
        }),
        bottomNavigationBar: IntrinsicHeight(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                            child: Text(
                                _currentAddress ?? S.current.enter_Adresss,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: button1color,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500)))
                      ]),
                  const SizedBox(height: 8),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CommonBtn(
                          text: S.current.deliver_here,
                          onTap: _onDeliveryHereTap))
                ]))));
  }

  Future<void> _getAddressFromLatLng(LatLng latLng) async {
    await placemarkFromCoordinates(latLng.latitude, latLng.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.country}, ${place.subAdministrativeArea}, ${place.street}';
        counrty = place.country.toString();
        city = place.subAdministrativeArea.toString();
        street = place.street.toString();

        // searchLocation = null;
        mapLocation = LocationModel(
            id: 080900100,
            name: _currentAddress,
            latLong: "${latLng.latitude},${latLng.longitude}");
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  void _onMapTap(LatLng latLng) {
    if (widget.getLocation == true) {
      markers.clear();
      _getCurrentPosition(latLng);
    }
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showSnackBar(
          title: "Location services are disabled. Please enable the services");

      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showSnackBar(title: "Location permissions are denied");
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      showSnackBar(
          title:
              "Location permissions are permanently denied, we cannot request permissions.");

      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition(LatLng latLng) async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() {
        markers.add(Marker(
            markerId: MarkerId('${latLng.latitude}, ${latLng.longitude}'),
            position: LatLng(latLng.latitude, latLng.longitude)));
        // _currentlat = latLng.latitude;
        // _currentlong = latLng.longitude;
        // latlong = '$_currentlat,$_currentlong';
        // storage.write(key: "myLatLong", value: latlong);
        // _currentPosition = position;
      });
      _getAddressFromLatLng(latLng);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    _controller.complete(controller);
    if (widget.getLocation == true) {
      Position position = await _determinePosition();
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(position.latitude, position.longitude), zoom: 13.5)));
      _getAddressFromLatLng(LatLng(position.latitude, position.longitude));
      setState(() {
        _currentlat = position.latitude;
        _currentlong = position.longitude;
        latlong = '$_currentlat,$_currentlong';
        // storage.write(key: "myLatLong", value: latlong);
      });
      markers.clear();
      markers.add(Marker(
          markerId: const MarkerId("currentPin"),
          icon: BitmapDescriptor.defaultMarker,
          position: LatLng(position.latitude, position.longitude)));
    }
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

  _onDeliveryHereTap() {
    if (widget.mappingset == 'startlocation') {
      if (_currentAddress == null) {
        showSnackBar(title: S.current.please_choose_the_address_first);
      } else {
        if (searchLocation != null) {
          _saveLocation(searchLocation);
        } else if (mapLocation != null) {
          _saveLocation(mapLocation);
        }
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
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
      if (_currentAddress == null) {
        showSnackBar(title: S.current.please_choose_the_address_first);
      } else {
        if (searchLocation != null) {
          _saveLocation(searchLocation);
        } else if (mapLocation != null) {
          _saveLocation(mapLocation);
        }
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
    }
  }

  _saveLocation(LocationModel? location) async {
    if (location != null) {
      String value = json.encode(location);
      await storage.write(key: "myLocation", value: value);
    }
  }

  void _clearBtnTap() {
    setState(() {
      _focusNode.unfocus();
      _searchController.clear();
    });
  }

  void _onSuggestionSelected(String suggestion) {
    setState(() {
      _searchController.text = suggestion;
      _currentAddress = suggestion;
      print("current :: $_locations");
      for (var element in _locations) {
        if (element.name == suggestion) {
          double latitude = double.tryParse(element.latLong!.split(",").first)!;
          double longitude =
              double.tryParse(element.latLong!.split(",").elementAt(1))!;

          latlong = '$latitude,$longitude';
          storage.write(key: "myLatLong", value: latlong);

          mapController.animateCamera(
              CameraUpdate.newLatLng(LatLng(latitude, longitude)));
          markers.clear();
          markers.add(Marker(
              markerId: const MarkerId('currentLocation'),
              position: LatLng(latitude, longitude)));
          searchLocation = element;
          mapLocation = null;
        }
      }
    });
  }
}
