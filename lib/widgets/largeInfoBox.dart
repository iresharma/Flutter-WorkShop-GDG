import 'package:flutter/material.dart';

class LargeInfoBox extends StatelessWidget {
  final String text;
  final String secondaryText;
  final LinearGradient? gradient;
  final Color? backgroundColor;
  final Color? textColor;

  const LargeInfoBox({
    Key? key,
    required this.text,
    required this.secondaryText,
    this.gradient,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 5),
        height: MediaQuery.of(context).size.width / 2 - 10,
        decoration: BoxDecoration(
            color: backgroundColor,
            gradient: gradient,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 40, color: textColor),
            ),
            Text(secondaryText,
                style: TextStyle(fontSize: 15, color: textColor)),
          ],
        ),
      ),
    );
  }
}
