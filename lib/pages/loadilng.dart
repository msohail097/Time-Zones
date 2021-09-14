import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_timezone/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: "Dhaka", flag: "germany.png", url: "Asia/Dhaka");
    await instance.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "location": instance.location,
      "flag": instance.flag,

      "time": instance.time,
      "isDayTime": instance.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.blue[900],
          size: 60.0,
        ),
      ),
    );
  }
}
