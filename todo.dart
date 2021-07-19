import 'dart:convert';

class Todo {
  final String id;
  final String title;
  final int created_at;
  final String dsec;
  final bool completed;
  final int priority;
  Todo({
    required this.id,
    required this.title,
    required this.created_at,
    required this.dsec,
    required this.completed,
    required this.priority,
  });

  Todo copyWith({
    String? id,
    String? title,
    int? created_at,
    String? dsec,
    bool? completed,
    int? priority,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      created_at: created_at ?? this.created_at,
      dsec: dsec ?? this.dsec,
      completed: completed ?? this.completed,
      priority: priority ?? this.priority,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'created_at': created_at,
      'dsec': dsec,
      'completed': completed,
      'priority': priority,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      created_at: map['created_at']?.toInt(),
      dsec: map['dsec'],
      completed: map['completed'],
      priority: map['priority']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Todo(id: $id, title: $title, created_at: $created_at, dsec: $dsec, completed: $completed, priority: $priority)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Todo &&
      other.id == id &&
      other.title == title &&
      other.created_at == created_at &&
      other.dsec == dsec &&
      other.completed == completed &&
      other.priority == priority;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      created_at.hashCode ^
      dsec.hashCode ^
      completed.hashCode ^
      priority.hashCode;
  }
}