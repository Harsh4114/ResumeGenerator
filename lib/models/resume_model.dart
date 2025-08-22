// models/resume_model.dart
class ResumeModel {
  final String name;
  final String skills;
  final String projects;

  ResumeModel({
    required this.name,
    required this.skills,
    required this.projects,
  });

  factory ResumeModel.fromJson(Map<String, dynamic> json) {
    return ResumeModel(
      name: json['name'] ?? '',
      skills: (json['skills'] is List)
          ? (json['skills'] as List).join(', ')
          : (json['skills']?.toString() ?? ''),
      projects: (json['projects'] is List)
          ? (json['projects'] as List).join(', ')
          : (json['projects']?.toString() ?? ''),
    );
  }
}
