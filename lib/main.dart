import 'package:flutter/material.dart';
import 'package:flutter_timezone/pages/choose_location.dart';
import 'package:flutter_timezone/pages/home.dart';
import 'package:flutter_timezone/pages/loadilng.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation()
      },
    ));
