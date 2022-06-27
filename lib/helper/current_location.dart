import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sooner/helper/toast.dart';

class MyCurrentLocation {
  static Position? myCurrentLocation2;
  static LatLng? myCurrentLocation;
  static String? myCurrentLocationCity;
  static String? myCurrentLocationDescription;

  static Future<bool> getCurrentLocation(context) async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    await Geolocator.requestPermission();
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Toast.show("Location services are disabled", context);
      // LoadingDialog.showSimpleToast('Location services are disabled');
      // myCurrentLocation = null;

    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Toast.show("Location permissions are denied", context);
        // LoadingDialog.showSimpleToast('Location permissions are denied');
        myCurrentLocation = null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // LoadingDialog.showSimpleToast('Location permissions are permanently denied, we cannot request permissions');
      myCurrentLocation = null;
    }

    myCurrentLocation2 = await Geolocator.getCurrentPosition();
    myCurrentLocation =
        LatLng(myCurrentLocation2!.latitude, myCurrentLocation2!.longitude);
    if (myCurrentLocation != null) {
      myCurrentLocationCity = await getAddress(
          myCurrentLocation!.latitude, myCurrentLocation!.longitude, context);
      return true;
    } else {
      return false;
    }
  }

  static Future<String> getAddress(
      double lat, double lng, BuildContext context) async {
    print("lat:" + lat.toString());
    print("lng:" + lng.toString());
    List<Placemark> place = await placemarkFromCoordinates(lat, lng,
        localeIdentifier: "ar");
    String address = place.first.subAdministrativeArea.toString();
    myCurrentLocationDescription =    place.first.subLocality.toString() +
        " - " +
        place.first.subAdministrativeArea.toString();
    print(address);

    return address;
  }
}
