import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todoapp/utils/theme.dart';

class InputModal extends StatefulWidget {
  const InputModal({Key? key}) : super(key: key);

  @override
  _InputModalState createState() => _InputModalState();
}

class _InputModalState extends State<InputModal> {
  double value = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height + 200,
      decoration: BoxDecoration(color: ColorTheme.palePurple.withOpacity(0.2)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Add Todo",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w700,
              ),
            ),
            Lottie.asset('assets/JSON/add-task.json'),
            TextField(
              decoration: InputDecoration(
                hintText: "Title",
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Description",
              ),
              maxLines: 3,
            ),
            Slider.adaptive(
              value: value,
              onChanged: (onChanged) => setState(() => value = onChanged),
              min: 1,
              max: 10,
              divisions: 10,
            )
          ],
        ),
      ),
    );
  }
}
