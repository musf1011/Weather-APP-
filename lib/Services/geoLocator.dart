import 'package:geolocator/geolocator.dart';

Future<Position> geoLocation() async {
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location Permissions are denied');
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions');
  } else {
    final Positions = await Geolocator.getCurrentPosition();
    print(Positions.latitude);
    return await Geolocator.getCurrentPosition();
  }
}
