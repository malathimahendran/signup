import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class Donors {
  var logger = Logger();
  Future donorList() async {
    try {
      var data =
          Uri.parse('https://www.cviacserver.tk/parampara/v1/getDonar/4/o+');
      var data2 = await http.get(data);
      var data3 = json.decode(data2.body);
      logger.w(data3);
      return data3["result"];
    } catch (e) {
      logger.e(e);
    }
  }
}
