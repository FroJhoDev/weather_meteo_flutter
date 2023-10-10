import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import '../repositories/location_repository.dart';
import '../repositories/placemark_repository.dart';

class PlacemarkProvider extends ChangeNotifier {

  PlacemarkProvider() {
    getCurrentAddress();
  }

  final PlacemarkRepository _placemarkRepository = PlacemarkRepository();
  final LocationRepository _locationRepository = LocationRepository();
  
  Placemark _currentAddress = Placemark();

  Placemark get currentAddress => _currentAddress;

  set currentAddress (Placemark placemark) {
    _currentAddress = placemark;
    notifyListeners();
  }

  Future<void> getCurrentAddress() async {

    final placemark = await _placemarkRepository.getAddressFromPosition(currentPosition: await _locationRepository.getDeviceCurrentPosition());
    currentAddress = placemark;

  }

}