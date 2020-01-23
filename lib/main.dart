import 'package:flutter/material.dart';
import 'package:hora_mundial/pages/choose_location.dart';
import 'package:hora_mundial/pages/home.dart';
import 'package:hora_mundial/pages/loading.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    ));
