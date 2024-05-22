class MedicalCondition {
  late final int id;
  final String type;
  final String affectedArea;
  final String effortLevel;

  MedicalCondition({
    required this.id,
    required this.type,
    required this.affectedArea,
    required this.effortLevel,
  });

  factory MedicalCondition.fromJson(Map<String, dynamic> json) {
    return MedicalCondition(
      id: json['id'],
      type: json['type'],
      affectedArea: json['affected_area'],
      effortLevel: json['effort_level'],
    );
  }
}
