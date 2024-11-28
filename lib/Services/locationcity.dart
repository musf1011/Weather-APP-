import 'package:geocoding/geocoding.dart';

Future<String> getCityFromCoordinates(double latitude, double longitude) async {
  try {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    if (placemarks.isNotEmpty) {
      print('printcity ${placemarks.first.locality}');
      return placemarks.first.locality ?? "Unknown city";
    } else {
      print('unkown');
      return "Unknown city";
    }
  } catch (e) {
    print('errorcity : $e');
    return "Error: $e";
  }
}
