import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class PlacemarkRepository {
  Future<Placemark> getAddressFromPosition({required Position currentPosition}) async {
    Placemark placemarkCoordinates = Placemark();

    await placemarkFromCoordinates(
      currentPosition.latitude,
      currentPosition.longitude,
    ).then((placemarks) {

      placemarkCoordinates = placemarks[0];

    }).catchError((onError) {

      Future.error(onError);

    });

    return placemarkCoordinates;
  }
}
