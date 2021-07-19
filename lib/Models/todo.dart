import 'dart:convert';

class Todo {
  final int id;
  final String title;
  final bool completed;
  final String created_at;
  final String desc;
  Todo({
    required this.id,
    required this.title,
    required this.completed,
    required this.created_at,
    required this.desc,
  });

  Todo copyWith({
    int? id,
    String? title,
    bool? completed,
    String? created_at,
    String? desc,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
      created_at: created_at ?? this.created_at,
      desc: desc ?? this.desc,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'completed': completed,
      'created_at': created_at,
      'desc': desc,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id']?.toInt(),
      title: map['title'],
      completed: map['completed'],
      created_at: map['created_at'],
      desc: map['desc'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Todo(id: $id, title: $title, completed: $completed, created_at: $created_at, desc: $desc)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Todo &&
        other.id == id &&
        other.title == title &&
        other.completed == completed &&
        other.created_at == created_at &&
        other.desc == desc;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        completed.hashCode ^
        created_at.hashCode ^
        desc.hashCode;
  }
}
