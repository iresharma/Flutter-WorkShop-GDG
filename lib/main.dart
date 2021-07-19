import 'package:flutter/material.dart';
import 'package:todoapp/utils/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
          primaryColor: Color(0xff7951F9), accentColor: Color(0xffF9F9F9)),
      routes: router(),
      initialRoute: '/',
    );
  }
}
