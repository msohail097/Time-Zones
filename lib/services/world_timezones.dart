import 'dart:convert';

import 'package:http/http.dart';

class WorldTimeZone {
  List<String> timezones;

  Future<List<String>> getTimeZones() async {
    try {
      Response response = await get("http://worldtimeapi.org/api/timezone");
      timezones = (jsonDecode(response.body) as List<dynamic>).cast<String>();
      return Future<List<String>>.value(timezones);
    } catch (e) {
      print('error: $e');
      return Future<List<String>>.value(List());
    }
  }
}
