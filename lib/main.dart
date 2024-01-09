import 'package:flutter/material.dart';
import 'package:worldtime/packages/choose_location.dart';
import 'package:worldtime/packages/home.dart';
import 'package:worldtime/packages/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => Location(),
    },
  ));
}
