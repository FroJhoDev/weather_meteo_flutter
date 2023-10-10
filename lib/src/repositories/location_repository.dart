import 'package:geolocator/geolocator.dart';

class LocationRepository {

  Future<Position> getDeviceCurrentPosition() async {

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error('Location permision are denied');
      }
      
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permission are permanently denide!');
    }

    final currentPosition = await Geolocator.getCurrentPosition();

    return currentPosition;

  }
  
}