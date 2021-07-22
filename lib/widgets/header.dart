import 'package:flutter/material.dart';
import 'package:todoapp/utils/theme.dart';

class Header extends StatelessWidget {
  final String name;

  const Header({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello $name,",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Hope you are having a productive day',
              style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? ColorTheme.lightPurple
                      : ColorTheme.purple,
                  fontSize: 18),
            )
          ],
        ),
        IconButton(
          onPressed: () => print('hi'),
          icon: Icon(Icons.person),
          tooltip: "Check Account",
        )
      ],
    );
  }
}
