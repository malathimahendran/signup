import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class MapPractice extends StatefulWidget {
  @override
  _MapPracticeState createState() => _MapPracticeState();
}

class _MapPracticeState extends State<MapPractice> {
  GoogleMapController mapController;
  // Set<Marker> marker = {};
  var address;
  var coordinates;
  var loca;
  var id = "466";
  var receivedLatitude;
  var receivedLongitude;
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  getLocation() async {
    await Geolocator.getCurrentPosition().then((value) {
      setState(() {
        loca = value;
      });
    });
    print(loca);
    var coordinates = Coordinates(loca.latitude, loca.longitude);
    var address =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var url = Uri.parse('https://2a0cafcf30b5.ngrok.io/parampara/location');
    var url1 =
        Uri.parse('https://2a0cafcf30b5.ngrok.io/locations/nearFamilyMembers');
    var sending = await http.post(url, body: {
      "id": id,
      "latitude": loca.latitude.toString(),
      "longnitude": loca.longitude.toString(),
      "address": address.first.subLocality.toString(),
      "district": address.first.subAdminArea.toString(),
      "state": address.first.adminArea.toString(),
      "country": address.first.countryName.toString(),
      "pin_code": address.first.postalCode.toString()
    });

    print(sending.statusCode);
    var sendingAgain = await http.post(url1, body: {
      "id": id,
    });
    var information = json.decode(sendingAgain.body);
    receivedLatitude = information['nearFamilyMembers'][0]['latitude'];
    receivedLongitude = information['nearFamilyMembers'][0]['longnitude'];
    print(receivedLatitude);
    print(receivedLongitude);
    // setState(() {
    //   marker.add(Marker(
    //     markerId: MarkerId("another area"),
    //     position: LatLng(receivedLatitude, receivedLongitude),
    //   ));
    // });
  }

  // myMarker() {
  //   marker.add(Marker(
  //     markerId: MarkerId("area"),
  //     position: LatLng(loca.latitude, loca.longitude),
  //     infoWindow: InfoWindow(title: "my area"),
  //   ));

  //   print(marker.length);
  //   return marker;
  // }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          loca == null
              ? Text(
                  'waiting',
                  style: TextStyle(
                    fontSize: 40,
                  ),
                )
              : Container(
                  height: height * 0.7,
                  width: width,
                  // child: GoogleMap(
                  //   // initialCameraPosition: CameraPosition(
                  //   //   zoom: 15,
                  //   //   // target: LatLng(loca.latitude, loca.longitude),
                  //   // ),
                  //   onMapCreated: (controller) {
                  //     setState(() {
                  //       mapController = controller;
                  //     });
                  //   },
                  //   // markers: myMarker(),
                  // ),
                ),
        ],
      ),
    );
  }
}
