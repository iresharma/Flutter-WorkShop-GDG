import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/utils/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer route;

  @override
  void initState() {
    super.initState();
    route = Timer.periodic(Duration(seconds: 2),
        (_) => Navigator.of(context).pushReplacementNamed('/home'));
  }

  @override
  void dispose() {
    super.dispose();
    route.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: ColorTheme.yellow),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              child: Image.asset('assets/images/to-do-list.png'),
            ),
            Text(
              "TodoFire",
              style: TextStyle(
                fontSize: 45,
                color: ColorTheme.red,
                fontWeight: FontWeight.w900,
                letterSpacing: 3,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            CupertinoActivityIndicator()
          ],
        ),
      ),
    );
  }
}
