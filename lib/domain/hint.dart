class Hint {
  final String category;
  final String title;
  final String student;
  final String description;

  Hint({required this.category, required this.title, required this.student, required this.description});

  factory Hint.fromJson(Map<String, dynamic> json) {
    return Hint(
      category: json['category'],
      title: json['title'],
      student: json['student'],
      description: json['description']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'title': title,
      'student': student,
      'description': description,
    };
  }
}
