import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Models/todo.dart';
import 'package:todoapp/Models/user.dart';

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
        tel: 8585858585,
        todos: <Todo>[]);
  }

  @override
  Widget build(BuildContext context) {
    if (_user != null) {
      return Scaffold(
          backgroundColor: Theme.of(context).accentColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      CupertinoIcons.search,
                      color: Colors.grey[300],
                      size: 35,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: Color(0xfff7f7f7), width: 0.25),
                    ),
                    focusColor: Colors.black,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            BorderSide(color: Color(0xfff7f7f7), width: 0.25)),
                    hintText: 'Search Todo',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                  ),
                ),
              ),
            ),
          ));
    } else
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
  }
}
