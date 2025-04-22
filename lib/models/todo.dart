class Todo {
  final String id;
  final String uid;
  final String title;
  final String description;
  final DateTime dueDate;
  final String priority; // "Low", "Medium", "High"
  final bool isCompleted;
  final DateTime createdAt;

  Todo({
    required this.id,
    required this.uid,
    required this.title,
    this.description = '',
    required this.dueDate,
    this.priority = 'Medium',
    this.isCompleted = false,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'title': title,
      'description': description,
      'dueDate': dueDate.toIso8601String(),
      'priority': priority,
      'isCompleted': isCompleted,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Todo.fromMap(String id, Map<String, dynamic> map) {
    return Todo(
      id: id,
      uid: map['uid'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      dueDate: DateTime.parse(map['dueDate'] ?? DateTime.now().toIso8601String()),
      priority: map['priority'] ?? 'Medium',
      isCompleted: map['isCompleted'] ?? false,
      createdAt: DateTime.parse(map['createdAt'] ?? DateTime.now().toIso8601String()),
    );
  }
}