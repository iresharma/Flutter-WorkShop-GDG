import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Models/todo.dart';
import 'package:todoapp/Models/user.dart';
import 'package:todoapp/utils/theme.dart';
import 'package:todoapp/widgets/TodoListTile.dart';
import 'package:todoapp/widgets/header.dart';
import 'package:todoapp/widgets/inputModal.dart';
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
    var random = new Random();
    _user = new User(
        name: 'Iresh Sharma',
        email: 'iresh.sharma8@gmail.com',
        tel: "8585858585",
        todos: List.generate(
            10,
            (index) => Todo(
                  id: index.toString(),
                  title: 'Make The flutter app',
                  created_at: 1626738143,
                  desc:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo ",
                  completed: false,
                  priority: random.nextInt(10) + 1,
                )),
        completed: List.generate(
            1,
            (index) => Todo(
                  id: index.toString(),
                  title: 'Make The flutter app',
                  created_at: 1626738143,
                  desc:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo ",
                  completed: true,
                  priority: random.nextInt(10) + 1,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorTheme.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => InputModal(
                    user: _user,
                  )).then((value) {
            print(value);
            setState(() => _user.todos.add(value));
          });
        },
        child: Icon(
          Icons.add,
          color: ColorTheme.yellow,
        ),
        backgroundColor: ColorTheme.palePurple,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                ),
                Text(
                  "Todos",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                    height: 107.0 * _user.todos.length,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Dismissible(
                        background: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            Align(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.check,
                                      size: 45, color: Colors.white),
                                ),
                                alignment: Alignment.centerLeft)
                          ],
                        ),
                        secondaryBackground: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: ColorTheme.red,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            Align(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(CupertinoIcons.delete,
                                      size: 35, color: Colors.white),
                                ),
                                alignment: Alignment.centerRight)
                          ],
                        ),
                        onDismissed: (direction) => {
                          if (direction == DismissDirection.endToStart)
                            setState(() => _user.todos.removeAt(index))
                          else
                            setState(() => {
                                  _user.completed.add(_user.todos[index]),
                                  _user.todos.removeAt(index)
                                })
                        },
                        key: Key(_user.todos[index].toString()),
                        child: TodoListTile(todo: _user.todos[index]),
                      ),
                      itemCount: _user.todos.length,
                    )),
                Text(
                  "Completed",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                    height: 103.0 * _user.completed.length,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Dismissible(
                        background: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: ColorTheme.red,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            Align(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(CupertinoIcons.delete,
                                      size: 35, color: Colors.white),
                                ),
                                alignment: Alignment.centerLeft)
                          ],
                        ),
                        secondaryBackground: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: ColorTheme.red,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            Align(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(CupertinoIcons.delete,
                                      size: 35, color: Colors.white),
                                ),
                                alignment: Alignment.centerRight)
                          ],
                        ),
                        onDismissed: (direction) =>
                            setState(() => _user.completed.removeAt(index)),
                        key: Key(_user.completed[index].toString()),
                        child: TodoListTile(todo: _user.completed[index]),
                      ),
                      itemCount: _user.completed.length,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
