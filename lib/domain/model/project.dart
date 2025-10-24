class Project {
  final int? id;
  final String name;
  final int userId;

  const Project({
    this.id,
    required this.name,
    required this.userId,
  });

  Project copyWith({
    int? id,
    String? name,
    int? userId,
  }) {
    return Project(
      id: id ?? this.id,
      name: name ?? this.name,
      userId: userId ?? this.userId,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Project &&
        other.id == id &&
        other.name == name &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        userId.hashCode;
  }

  @override
  String toString() {
    return 'Project(id: $id, name: $name, userId: $userId)';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'userId': userId,
    };
  }

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'] as int?,
      name: json['name'] as String,
      userId: json['userId'] as int,
    );
  }
}
