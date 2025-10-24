class Task {
  final int? id;
  final String description;
  final bool isComplete;
  final int projectId;

  const Task({
    this.id,
    required this.description,
    this.isComplete = false,
    required this.projectId,
  });

  Task copyWith({
    int? id,
    String? description,
    bool? isComplete,
    int? projectId,
  }) {
    return Task(
      id: id ?? this.id,
      description: description ?? this.description,
      isComplete: isComplete ?? this.isComplete,
      projectId: projectId ?? this.projectId,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Task &&
        other.id == id &&
        other.description == description &&
        other.isComplete == isComplete &&
        other.projectId == projectId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        description.hashCode ^
        isComplete.hashCode ^
        projectId.hashCode;
  }

  @override
  String toString() {
    return 'Task(id: $id, description: $description, isComplete: $isComplete, projectId: $projectId)';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'isComplete': isComplete,
      'projectId': projectId,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as int?,
      description: json['description'] as String,
      isComplete: json['isComplete'] as bool? ?? false,
      projectId: json['projectId'] as int,
    );
  }
}
