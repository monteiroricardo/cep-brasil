import 'home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarColor: Color(0xff141736),
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Color(0xff141736),
  ));
}
