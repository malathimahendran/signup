import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BloodMyRequestApi {
  Future bloodRequestApi() async {
    var logger = Logger();
    SharedPreferences prefer = await SharedPreferences.getInstance();
    var gettingId = prefer.getStringList('idS');
    var gettingUserId = gettingId[1];
    var gettingFamilyId = gettingId[0];
    logger.i(gettingFamilyId);
    logger.i(gettingUserId);

    var url = Uri.parse(
        "https://www.cviacserver.tk/parampara/v1/getSingleReceived/$gettingUserId");

    var bloodMyRequestdata = await http.get(url);
    var decodeBloodRequest = json.decode(bloodMyRequestdata.body);

    return decodeBloodRequest['result'];
  }
}
