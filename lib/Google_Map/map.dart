// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LocationDemo extends StatefulWidget {
  const LocationDemo({super.key});

  @override
  State<LocationDemo> createState() => _LocationDemoState();
}

class _LocationDemoState extends State<LocationDemo> {
  /* getCurrentLocation()async{
      LocationPermission permission = await Geolocator.checkPermission();
      if(permission==LocationPermission.denied || permission==LocationPermission.deniedForever){
        print("Permission Denied");
        LocationPermission ask = await Geolocator.requestPermission();
      }else{
        print("permission : $permission");
        Position currentposition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
        print("Latitude = ${currentposition.latitude.toString()}");
        print("Longitude = ${currentposition.longitude.toString()}");
      }
    } */

  String locationMessage = "Current Location of the User";
  late String lat;
  late String long;

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location service are enabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Permission Denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Permission Denied Forever");
    }
    return await Geolocator.getCurrentPosition();
  }

  void _liveLocation() {
    LocationSettings locationSettings =
        LocationSettings(accuracy: LocationAccuracy.high, distanceFilter: 100);

    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      lat = position.latitude.toString();
      long = position.longitude.toString();

      setState(() {
        locationMessage = 'Latitude : $lat, Longitude : $long';
      });
    });
  }

  Future<void> _openMap(String lat, String long) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$long';

    /* await canLaunchUrlString(googleUrl) ?
           await launchUrlString(googleUrl):
           throw 'Could not launch $googleUrl'; */
    try {
      await canLaunchUrlString(googleUrl)
          ? await launchUrlString(googleUrl)
          : throw 'Could not launch $googleUrl';
    } catch (e) {
      print('Error launching map: $e');
      // Handle the error here, you might want to show a snackbar or a dialog to the user.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Geolocator"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(locationMessage),
            ElevatedButton(
              onPressed: () {
                _getCurrentLocation().then((value) {
                  lat = '${value.latitude}';
                  long = '${value.longitude}';
                  setState(() {
                    locationMessage = 'Latitude : $lat, Longitude : $long';
                  });
                  _liveLocation();
                });
              },
              child: Text("Get Current Location"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  _openMap(lat, long);
                },
                child: Text("Open Google Map"))
          ],
        ),
      ),
    );
  }
}
