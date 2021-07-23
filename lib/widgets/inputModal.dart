import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todoapp/Models/todo.dart';
import 'package:todoapp/Models/user.dart';
import 'package:todoapp/utils/theme.dart';

class InputModal extends StatefulWidget {
  final User user;
  const InputModal({Key? key, required this.user}) : super(key: key);

  @override
  _InputModalState createState() => _InputModalState();
}

class _InputModalState extends State<InputModal> {
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _descController = new TextEditingController();
  double value = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add Todo",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => widget.user.addTodo(Todo(
                        id: "sdkjfhs",
                        title: _titleController.text,
                        created_at: DateTime.now().millisecondsSinceEpoch,
                        desc: _descController.text,
                        completed: false,
                        priority: value.ceil())),
                    child: Text("Add"),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(ColorTheme.lightPurple)),
                  )
                ],
              ),
              Container(
                height: 150,
                child: Lottie.asset('assets/JSON/add-task.json'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    hintText: "Title",
                    hintStyle: TextStyle(fontWeight: FontWeight.w700),
                    filled: true,
                    fillColor: ColorTheme.grey.withOpacity(0.5),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _descController,
                  decoration: InputDecoration(
                    hintText: "Description",
                    hintStyle: TextStyle(fontWeight: FontWeight.w700),
                    filled: true,
                    fillColor: ColorTheme.grey.withOpacity(0.5),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none),
                  ),
                  maxLines: 3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Priority",
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      Text(value.ceil().toString(),
                          style: TextStyle(fontWeight: FontWeight.w700)),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Slider.adaptive(
                  value: value,
                  onChanged: (onChanged) => setState(() => value = onChanged),
                  min: 1,
                  max: 10,
                  divisions: 9,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
