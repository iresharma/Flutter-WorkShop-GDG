import 'dart:convert';

class Completed {
  final String id;
  final String title;
  final int created_at;
  final String dsec;
  final bool completed;
  final int priority;
  Completed({
    required this.id,
    required this.title,
    required this.created_at,
    required this.dsec,
    required this.completed,
    required this.priority,
  });

  Completed copyWith({
    String? id,
    String? title,
    int? created_at,
    String? dsec,
    bool? completed,
    int? priority,
  }) {
    return Completed(
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

  factory Completed.fromMap(Map<String, dynamic> map) {
    return Completed(
      id: map['id'],
      title: map['title'],
      created_at: map['created_at']?.toInt(),
      dsec: map['dsec'],
      completed: map['completed'],
      priority: map['priority']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Completed.fromJson(String source) => Completed.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Completed(id: $id, title: $title, created_at: $created_at, dsec: $dsec, completed: $completed, priority: $priority)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Completed &&
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