import 'dart:math';

class LocationService {
  static const R = 6371e3; // earth radius in meters

  int distanceBetweenTwoPoints(
      {required double lat1,
      required double lon1,
      required double lat2,
      required double lon2}) {
    var line1 = lat1 * pi / 180;
    var line2 = lat2 * pi / 180;
    var latSub = (lat2 - lat1) * pi / 180;
    var lonSub = (lon2 - lon1) * pi / 180;

    var a = sin(latSub / 2) * sin(latSub / 2) +
        cos(line1) * cos(line2) * sin(lonSub / 2) * sin(lonSub / 2);
    var c = 2 * atan2(sqrt(a), sqrt(1 - a));

    var d = R * c;
    var resultInKilometers = (d / 1000).round();

    return resultInKilometers;
  }
}
