import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/src/ui/delivery_package/components/order_request_widget.dart';
import 'package:project/src/ui/delivery_package/cubits/delivery/delivery_cubit.dart';
import 'package:project/src/ui/delivery_package/cubits/tracking/tracking_cubit.dart';
import 'package:project/src/ui/delivery_package/data/model/order_request_model.dart';
import 'package:project/src/ui/delivery_package/helper/helper.dart';

class DeliveryMainScreen extends StatefulWidget {
  const DeliveryMainScreen({super.key});

  @override
  State<DeliveryMainScreen> createState() => _DeliveryMainScreenState();
}

class _DeliveryMainScreenState extends State<DeliveryMainScreen> {
  // LatLng initalLocation = const LatLng(30.0444, 31.2357);
  var defualtIcon =
      "https://b.fssta.com/uploads/application/soccer/headshots/885.vresize.350.350.medium.14.png";
  LatLng initialLocation = const LatLng(24.7136, 46.6753);
  Set<Marker> _markers = {};
  List<OrderRequestModel> _orders = [];

  // late GoogleMapController googleMapController;
  Uint8List? markerIcon;

  bool _observe = false;
  int _automatic = 0;

  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints;

  LatLng? _currentLocation;
  LatLng? _marketLocation;
  LatLng? _clientLocation;
  LatLngBounds? bound;
  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController mapController;
  late BitmapDescriptor marketIcon;

  late TrackingCubit _trackingBloc;
  late DeliveryCubit _deliveryCubit;

  @override
  void initState() {
    _trackingBloc = BlocProvider.of<TrackingCubit>(context);
    _deliveryCubit = BlocProvider.of<DeliveryCubit>(context);
    polylinePoints = PolylinePoints();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    setAvatar();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
          listeners: [
            BlocListener<DeliveryCubit, DeliveryState>(
                listener: (BuildContext context, state) async {
              if (state is AcceptOrderSuccess) {
                _marketLocation = LatLng(
                    double.tryParse(
                        state.response.data!.latLongShop!.split(",").first)!,
                    double.tryParse(state.response.data!.latLongShop!
                        .split(",")
                        .elementAt(1))!);
                _clientLocation = LatLng(
                    double.tryParse(
                        state.response.data!.latLongClient!.split(",").first)!,
                    double.tryParse(state.response.data!.latLongClient!
                        .split(",")
                        .elementAt(1))!);
                print("AcceptOrderSuccess : $_marketLocation");

                setPolyLines();
                showPinsOnMap();
                _orders.clear();
                _observe = false;
                setState(() {});
                _trackingBloc.getTrackingOrder();
              }
              if (state is UpdateMapSuccess) {
                print("UpdateMapSuccess : ${state.response.toJson()}");
                if (state.response.data != null) {
                  if (_automatic == 1 && _currentLocation != null) {
                    _deliveryCubit.checkNewOrderAutoAccept(
                        map:
                            "${_currentLocation!.latitude},${_currentLocation!.longitude}");
                  } else {
                    for (int i = 0; i < _orders.length; i++) {
                      if (_orders[i].id == state.response.data!.id) {
                        _orders.remove(_orders[i]);
                      }
                    }
                    _orders.add(state.response.data!);
                  }
                } else {
                  _orders.clear();
                  print("UpdateMapSuccess : ${state.response.toJson()}");
                }
                setState(() {});
              }

              if (state is CheckNewOrderAutoAcceptSuccess) {
                print(
                    "CheckNewOrderAutoAcceptSuccess : ${state.response.toJson()}");
                if (state.response.data != null) {
                  _marketLocation = LatLng(
                      double.tryParse(
                          state.response.data!.latLongShop!.split(",").first)!,
                      double.tryParse(state.response.data!.latLongShop!
                          .split(",")
                          .elementAt(1))!);

                  // if (_polylines.length < 1) {
                  setPolyLines();
                  // }
                  showPinsOnMap();
                  _orders.clear();
                  _observe = false;
                  setState(() {});
                }
              }
              if (state is UpdateStatusSuccess) {
                _automatic = state.response.data!.autoAccpet!;
                _observe = state.response.data!.active == 1 ? true : false;
                setState(() {});
              }
              if (state is InitialDeliverySuccess) {
                // print("here : ${state.value}");
                Position position = await _determinePosition();
                mapController.animateCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(
                        target: LatLng(position.latitude, position.longitude),
                        zoom: 13.5)));
                _markers.clear();
                _markers.add(Marker(
                    markerId: const MarkerId("currentPin"),
                    icon: markerIcon == null
                        ? BitmapDescriptor.defaultMarker
                        : BitmapDescriptor.fromBytes(markerIcon!),
                    position: LatLng(position.latitude, position.longitude)));
                _observe = true;
                _observeLocation();
                setState(() {});
              }

              if (state is RefuseOrderSuccess) {
                log("RefuseOrderSuccess : ${state.response}");

                _orders.removeWhere(
                    (element) => element.id == state.response.data!.orderId!);
                setState(() {});
              }
            }),
            BlocListener<TrackingCubit, TrackingState>(
                listener: (BuildContext context, state) async {
              if (state is GoToMarketSuccess) {
                log("GoToMarketSuccess :");
                _goToMarket();
              }
              if (state is GoToClientSuccess) {
                log("GoToClientSuccess :");
                _goToClient();
              }
              if (state is CloseOrderSuccess) {
                _clientLocation = null;
                _marketLocation = null;

                _markers.removeWhere((element) =>
                    element.markerId == const MarkerId("clientPin"));
                _polylines.clear();
                mapController
                    .animateCamera(CameraUpdate.newLatLng(_currentLocation!));
                polylineCoordinates.clear();
                _observe = true;
                setState(() {});
              }
            })
          ],
          child: Stack(children: [
            GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: initialLocation, zoom: 13.5),
                markers: _markers,
                polylines: _polylines,
                zoomControlsEnabled: false,
                tiltGesturesEnabled: true,
                compassEnabled: true,
                mapType: MapType.normal,
                onMapCreated: _onMapCreated,
                onCameraMove: _onCameraMove),
            _orders.isEmpty
                ? const SizedBox()
                : Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: 0,
                    child: ListView.separated(
                        reverse: true,
                        shrinkWrap: true,
                        primary: false,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 24),
                        itemBuilder: (BuildContext context, int index) {
                          return OrderRequestWidget(
                              model: _orders[index],
                              index: index,
                              onRefuse: _onRefuse,
                              onAccept: _onAccept);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 16);
                        },
                        itemCount: _orders.length))
          ])),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   _trackingBloc.getTrackingOrder();
      // }),
    );
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
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return Geolocator.getCurrentPosition();
  }

  void _observeLocation() {
    LocationSettings locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high,
        // distanceFilter: 50,
        // timeLimit: Duration(seconds: 30),
    );
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      _currentLocation = LatLng(position.latitude, position.longitude);

      if (_observe) {
        _deliveryCubit.updateMap(
            map: "${position.latitude},${position.longitude}");
      }
      setState(() {});
    });
  }

  _onRefuse(OrderRequestModel model, int index) {
    _deliveryCubit.refuseOrder(model.id!);
  }

  _onAccept(OrderRequestModel model) => _deliveryCubit.acceptOrder(model.id!);

  Future<void> setAvatar() async {
    markerIcon = await Helper.getBytesFromCanvas(150, defualtIcon);
  }

  Future<void> showPinsOnMap() async {
    // Uint8List? icon =
    //     await Helper.getBytesFromCanvas(150, marketIcon ?? defualtIcon);
    setState(() {
      _markers.add(Marker(
          markerId: const MarkerId('marketPin'),
          position: _marketLocation ?? const LatLng(0, 0),
          icon: marketIcon,
          infoWindow: const InfoWindow(title: "Market"),
          onTap: () {}));

      _markers.add(Marker(
          markerId: const MarkerId('clientPin'),
          position: _clientLocation ?? const LatLng(0, 0),
          icon: marketIcon,
          infoWindow: const InfoWindow(title: "Client"),
          onTap: () {}));
    });
  }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    _controller.complete(controller);
    marketIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.5),
        'assets/icons/delivery/pin.png');

    setPolyLines();
    showPinsOnMap();
  }

  void _onCameraMove(CameraPosition position) {}

  setPolyLines() async {
    if (_clientLocation != null && _marketLocation != null) {
      PolylineResult result = await polylinePoints
          .getRouteBetweenCoordinates(
              "AIzaSyDOC8PUJp6efIKaCYXozmY8POGUSyO3Z7s",
              PointLatLng(
                  _marketLocation!.latitude, _marketLocation!.longitude),
              PointLatLng(
                  _clientLocation!.latitude, _clientLocation!.longitude),
              travelMode: TravelMode.driving)
          .catchError((e) {
        log("error : $e");
        return e;
      });
      if (result.status == 'OK') {
        for (var point in result.points) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        }

        _polylines.add(Polyline(
            width: 6,
            polylineId: const PolylineId('polyLine'),
            color: const Color(0xff8869f2),
            points: polylineCoordinates));

        _setMapFitToTour(_polylines);

        setState(() {});
      } else {
        log("polyLines ${result.errorMessage}  , ${result.status} , ${result.points}");
      }
    }
  }

  _goToMarket() async {
    if (_currentLocation != null && _marketLocation != null) {
      _markers.clear();
      _markers.add(Marker(
          markerId: const MarkerId("currentPin"),
          icon: markerIcon == null
              ? BitmapDescriptor.defaultMarker
              : BitmapDescriptor.fromBytes(markerIcon!),
          position: _currentLocation ?? const LatLng(0, 0)));
      _markers.add(Marker(
          markerId: const MarkerId('marketPin'),
          position: _marketLocation ?? const LatLng(0, 0),
          icon: marketIcon,
          infoWindow: const InfoWindow(title: "Market"),
          onTap: () {}));
      _polylines.clear();
      polylineCoordinates.clear();
      PolylineResult result = await polylinePoints
          .getRouteBetweenCoordinates(
              "AIzaSyDOC8PUJp6efIKaCYXozmY8POGUSyO3Z7s",
              PointLatLng(
                  _marketLocation!.latitude, _marketLocation!.longitude),
              PointLatLng(
                  _currentLocation!.latitude, _currentLocation!.longitude),
              travelMode: TravelMode.driving)
          .catchError((e) {
        log("error : $e");
        return e;
      });
      if (result.status == 'OK') {
        for (var point in result.points) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        }

        _polylines.add(Polyline(
            width: 6,
            polylineId: const PolylineId('polyLine'),
            color: const Color(0xff8869f2),
            points: polylineCoordinates));

        _setMapFitToTour(_polylines);

        setState(() {});
      } else {
        log("polyLines ${result.errorMessage}  , ${result.status} , ${result.points}");
      }
    }
  }

  _goToClient() async {
    if (_currentLocation != null && _clientLocation != null) {
      _markers.clear();
      _markers.add(Marker(
          markerId: const MarkerId("currentPin"),
          icon: markerIcon == null
              ? BitmapDescriptor.defaultMarker
              : BitmapDescriptor.fromBytes(markerIcon!),
          position: _currentLocation ?? const LatLng(0, 0)));
      _markers.add(Marker(
          markerId: const MarkerId('clientPin'),
          position: _clientLocation ?? const LatLng(0, 0),
          icon: marketIcon,
          infoWindow: const InfoWindow(title: "Client"),
          onTap: () {}));
      _polylines.clear();
      polylineCoordinates.clear();
      PolylineResult result = await polylinePoints
          .getRouteBetweenCoordinates(
              "AIzaSyDOC8PUJp6efIKaCYXozmY8POGUSyO3Z7s",
              PointLatLng(
                  _clientLocation!.latitude, _clientLocation!.longitude),
              PointLatLng(
                  _currentLocation!.latitude, _currentLocation!.longitude),
              travelMode: TravelMode.driving)
          .catchError((e) {
        log("error : $e");
        return e;
      });
      if (result.status == 'OK') {
        for (var point in result.points) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        }

        _polylines.add(Polyline(
            width: 6,
            polylineId: const PolylineId('polyLine'),
            color: const Color(0xff8869f2),
            points: polylineCoordinates));

        _setMapFitToTour(_polylines);

        setState(() {});
      } else {
        log("polyLines ${result.errorMessage}  , ${result.status} , ${result.points}");
      }
    }
  }

  void _setMapFitToTour(Set<Polyline> p) {
    double minLat = p.first.points.first.latitude;
    double minLong = p.first.points.first.longitude;
    double maxLat = p.first.points.first.latitude;
    double maxLong = p.first.points.first.longitude;
    for (var poly in p) {
      for (var point in poly.points) {
        if (point.latitude < minLat) minLat = point.latitude;
        if (point.latitude > maxLat) maxLat = point.latitude;
        if (point.longitude < minLong) minLong = point.longitude;
        if (point.longitude > maxLong) maxLong = point.longitude;
      }
    }
    mapController.animateCamera(CameraUpdate.newLatLngBounds(
        LatLngBounds(
            southwest: LatLng(minLat, minLong),
            northeast: LatLng(maxLat, maxLong)),
        20));
  }
}
