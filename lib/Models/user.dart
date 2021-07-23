import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'todo.dart';

class User {
  final String name;
  final String email;
  final String tel;
  final List<Todo> todos;
  final List<Todo> completed;
  User({
    required this.name,
    required this.email,
    required this.tel,
    required this.todos,
    required this.completed,
  });

  User copyWith({
    String? name,
    String? email,
    String? tel,
    List<Todo>? todos,
    List<Todo>? completed,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      tel: tel ?? this.tel,
      todos: todos ?? this.todos,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'tel': tel,
      'todos': todos.map((x) => x.toMap()).toList(),
      'completed': completed.map((x) => x.toMap()).toList(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      email: map['email'],
      tel: map['tel'],
      todos: List<Todo>.from(map['todos']?.map((x) => Todo.fromMap(x))),
      completed: List<Todo>.from(map['completed']?.map((x) => Todo.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(name: $name, email: $email, tel: $tel, todos: $todos, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.name == name &&
        other.email == email &&
        other.tel == tel &&
        listEquals(other.todos, todos) &&
        listEquals(other.completed, completed);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        tel.hashCode ^
        todos.hashCode ^
        completed.hashCode;
  }

  // integer getter to return the number todos with priority greater than 7
  int get highPriorityCount {
    return todos.where((x) => x.priority > 7).toList().length;
  }

  void addTodo(Todo todo) {
    todos.add(todo);
  }
}
