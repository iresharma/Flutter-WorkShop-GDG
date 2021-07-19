import 'package:flutter/material.dart';
import 'package:todoapp/Views/Home.dart';

Map<String, Widget Function(BuildContext)> router() {
  return <String, Widget Function(BuildContext)>{"/": (_) => Home()};
}
