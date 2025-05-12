// models/talent.dart
class Talent {
  final int id;
  final String name;
  final String title;
  final String rate;
  final String success;
  final String earned;
  final String description;
  final List<String> skills;

  Talent({
    required this.id,
    required this.name,
    required this.title,
    required this.rate,
    required this.success,
    required this.earned,
    required this.description,
    required this.skills,
  });

  factory Talent.fromMap(Map<String, dynamic> map) {
    return Talent(
      id: map['id'] as int,
      name: map['name'] as String,
      title: map['title'] as String, 
      rate: map['rate'] as String,
      success: map['success'] as String,
      earned: map['earned'] as String,
      description: map['description'] as String,
      skills: List<String>.from(map['skills'] as List),
    );
  }
}