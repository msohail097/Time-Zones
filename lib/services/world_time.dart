import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDayTime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'].split('.')[0];
      String offset = data['utc_offset'].substring(1, 3);

      print(datetime);

      DateTime now = DateTime.parse(datetime);
      print(now.hour);
      isDayTime = (now.hour > 6 && now.hour < 20) ? true : false;
//      now = now.add(Duration(hours: int.parse(offset)));
      time = DateFormat.jms().format(now);
    } catch (e) {
      print('error: $e');
      time = "could not get time";
    }
  }
}
