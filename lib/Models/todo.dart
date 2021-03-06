import 'dart:convert';

// {
//       "id": "",
//       "title": "",
//       "created_at": 93756389,
//       "desc": "",
//       "completed": true,
//       "priority": 0
//     }

class Todo {
  final String id;
  final String title;
  final int created_at;
  final String desc;
  final bool completed;
  final int priority;
  Todo({
    required this.id,
    required this.title,
    required this.created_at,
    required this.desc,
    required this.completed,
    required this.priority,
  });

  Todo copyWith({
    String? id,
    String? title,
    int? created_at,
    String? desc,
    bool? completed,
    int? priority,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      created_at: created_at ?? this.created_at,
      desc: desc ?? this.desc,
      completed: completed ?? this.completed,
      priority: priority ?? this.priority,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'created_at': created_at,
      'desc': desc,
      'completed': completed,
      'priority': priority,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      created_at: map['created_at']?.toInt(),
      desc: map['desc'],
      completed: map['completed'],
      priority: map['priority']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Todo(id: $id, title: $title, created_at: $created_at, desc: $desc, completed: $completed, priority: $priority)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Todo &&
        other.id == id &&
        other.title == title &&
        other.created_at == created_at &&
        other.desc == desc &&
        other.completed == completed &&
        other.priority == priority;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        created_at.hashCode ^
        desc.hashCode ^
        completed.hashCode ^
        priority.hashCode;
  }

  String get getDesc {
    if (desc.length < 40) {
      return desc;
    } else {
      return desc.substring(0, 40) + '...';
    }
  }

  // getter to convert timestamp to readable date
  String get getCreatedAt {
    var date = DateTime.fromMillisecondsSinceEpoch(created_at * 1000);
    return '${date.day} / ${date.month}';
  }
}
