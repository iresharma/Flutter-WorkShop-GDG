import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:todoapp/Models/todo.dart';

class User {
  final String name;
  final String email;
  final int tel;
  final List<Todo> todos;
  User({
    required this.name,
    required this.email,
    required this.tel,
    required this.todos,
  });

  User copyWith({
    String? name,
    String? email,
    int? tel,
    List<Todo>? todos,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      tel: tel ?? this.tel,
      todos: todos ?? this.todos,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'tel': tel,
      'todos': todos.map((x) => x.toMap()).toList(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      email: map['email'],
      tel: map['tel']?.toInt(),
      todos: List<Todo>.from(map['todos']?.map((x) => Todo.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(name: $name, email: $email, tel: $tel, todos: $todos)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.name == name &&
        other.email == email &&
        other.tel == tel &&
        listEquals(other.todos, todos);
  }

  @override
  int get hashCode {
    return name.hashCode ^ email.hashCode ^ tel.hashCode ^ todos.hashCode;
  }
}