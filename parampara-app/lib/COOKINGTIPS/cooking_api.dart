import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CookingApi {
  var familyId;
  Future apiData() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    familyId = prefer.getStringList('idS');
    var url = Uri.parse(
        "https://www.cviacserver.tk/parampara/v1/getFamilyTips/${familyId[0]}");
    var datas = await http.get(url);
    var decodeList = json.decode(datas.body);
    return decodeList['result'];
  }
}
