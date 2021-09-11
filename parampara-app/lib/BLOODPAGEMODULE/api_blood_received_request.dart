import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Products {
  var logger = Logger();
  Future productList() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    var gettingId = prefer.getStringList('idS');
    var gettingUserId = gettingId[1];
    var gettingFamilyId = gettingId[0];
    logger.w("$gettingUserId,api_blood_received_request");
    var data = Uri.parse(
        'https://www.cviacserver.tk/parampara/v1/getFamilyReceived/$gettingFamilyId');
    var data2 = await http.get(data);
    var data3 = json.decode(data2.body);
    print(data3);
    return data3["result"];
  }
}
