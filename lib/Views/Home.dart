import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Models/todo.dart';
import 'package:todoapp/Models/user.dart';
import 'package:todoapp/utils/theme.dart';
import 'package:todoapp/widgets/header.dart';
import 'package:todoapp/widgets/largeInfoBox.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late User _user;

  @override
  void initState() {
    super.initState();
    _user = new User(
        name: 'Jane Doe',
        email: 'iresh.sharma8@gmail.com',
        tel: "8585858585",
        todos: <Todo>[]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('hi'),
        child: Icon(
          Icons.add,
          color: ColorTheme.yellow,
        ),
        backgroundColor: ColorTheme.palePurple,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Header(name: _user.name.split(' ')[0]),
                Row(
                  children: [
                    LargeInfoBox(
                      text: _user.todos.length.toString(),
                      secondaryText: 'Todos',
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            ColorTheme.lightPurple,
                            ColorTheme.palePurple,
                            ColorTheme.purple
                          ]),
                      textColor: ColorTheme.white,
                    ),
                    LargeInfoBox(
                      text: _user.highPriorityCount.toString(),
                      secondaryText: "High Priority Todos",
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [ColorTheme.yellow, ColorTheme.red]),
                      textColor: ColorTheme.white,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
