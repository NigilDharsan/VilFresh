import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';

import 'Image_Path.dart';

class Booking_Map extends ConsumerStatefulWidget {
  String currentAddress = "";

  Booking_Map({super.key, required this.currentAddress});

  @override
  ConsumerState<Booking_Map> createState() => _Booking_MapState();
}

class _Booking_MapState extends ConsumerState<Booking_Map> {
  Position? currentPosition;
  var isLoading = false;
  var isDismiss = false;
  var isCheckIN = false;

  String? CurrentLocation;
  Future<Position> getPosition() async {
    LocationPermission? Permision;
    Permision = await Geolocator.checkPermission();
    if (Permision == LocationPermission.denied) {
      Permision = await Geolocator.requestPermission();
      if (Permision == LocationPermission.denied) {
        return Future.error("Location Permission are Denied");
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("Error${error.toString()}");
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();
    // Fetch current location when the page loads
    // getCurrentLocation();
  }

  // Future<void> getCurrentLocation() async {
  //   try {
  //     isLoading = true;
  //     currentPosition = await getPosition();
  //     getAddress(currentPosition!.latitude, currentPosition!.longitude);

  //     isLoading = false;
  //     print("FALSE LOADING");
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // //MAP
  // Future<void> getAddress(double latitude, double longitude) async {
  //   try {
  //     List<Placemark> placemarks =
  //         await placemarkFromCoordinates(latitude, longitude);
  //     if (placemarks.isNotEmpty) {
  //       Placemark place = placemarks[0]; // Access the first element
  //       String locality = place.locality ?? "";
  //       String street = place.street ?? "";
  //       String district = place.subAdministrativeArea ?? "";
  //       String area = place.thoroughfare ?? "";
  //       String subLocality = place.subLocality ?? "";
  //       String pinCode = place.postalCode ?? "";

  //       setState(() {
  //         SingleTon singleton = SingleTon();

  //         if (area != "") {
  //           currentAddress = "${street}, ${area}, ${locality}, ${pinCode}";
  //         } else {
  //           currentAddress = "${street}, ${locality}, ${pinCode}";
  //         }

  //         singleton.setLocation = currentAddress;
  //         singleton.lattidue = latitude.toString();
  //         singleton.longitude = longitude.toString();
  //       });
  //     } else {
  //       setState(() {
  //         currentPosition = null;
  //         currentAddress = "Location Not Found";
  //       });
  //     }
  //   } catch (e) {
  //     print("ERROR LOCATION ${e}");
  //     setState(() {
  //       currentPosition = null;
  //       currentAddress = "Error Fetching Location";
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green1,
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        color: white1,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Row(
                      children: [
                        ImgPathSvg("Pin.svg"),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(child: Text(widget.currentAddress)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
