import 'package:flutter/material.dart';
import 'package:todoapp/Views/Home.dart';
import 'package:todoapp/Views/SplashScreen.dart';

Map<String, Widget Function(BuildContext)> router() {
  return <String, Widget Function(BuildContext)>{
    "/home": (_) => Home(),
    "/": (_) => SplashScreen()
  };
}
