import 'package:flutter/material.dart';
import 'package:todoapp/Models/todo.dart';
import 'package:todoapp/utils/theme.dart';

class TodoListTile extends StatelessWidget {
  final Todo todo;
  const TodoListTile({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print('hi'),
      borderRadius: BorderRadius.circular(10),
      splashColor: ColorTheme.purple,
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 3),
        decoration: BoxDecoration(
            color: ColorTheme.lightPurple.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            CircleAvatar(
                child: Text(
                  todo.priority.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 25,
                      color: ColorTheme.white),
                ),
                backgroundColor: todo.priority >= 7
                    ? ColorTheme.red
                    : todo.priority >= 3
                        ? Colors.orange
                        : Colors.green),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.title,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(todo.getCreatedAt, style: TextStyle(fontSize: 10)),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
