class Todo {
  final String id;
  final String uid;
  final String title;
  final bool isCompleted;
  final DateTime createdAt;

  Todo({
    required this.id,
    required this.uid,
    required this.title,
    this.isCompleted = false,
    required this.createdAt,
  });

  // Convert Todo object to Firestore document
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'title': title,
      'isCompleted': isCompleted,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Create Todo object from Firestore document
  factory Todo.fromMap(String id, Map<String, dynamic> map) {
    return Todo(
      id: id,
      uid: map['uid'] ?? '',
      title: map['title'] ?? '',
      isCompleted: map['isCompleted'] ?? false,
      createdAt: DateTime.parse(map['createdAt'] ?? DateTime.now().toIso8601String()),
    );
  }
}