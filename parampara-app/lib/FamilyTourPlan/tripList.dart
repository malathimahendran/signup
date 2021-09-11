import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Triplist extends StatefulWidget {
  @override
  TriplistState createState() => TriplistState();
}

class TriplistState extends State<Triplist> {
  var familyId;
  triplist() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    familyId = prefer.getStringList('idS');
    var url = Uri.parse(
        'https://www.cviacserver.tk/parampara/v1/getOpinion/:tour_id');
    var response = await http.get(url);
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
