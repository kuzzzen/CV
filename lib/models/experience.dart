class Experience {
  final String company;
  final String location;
  final String position;
  final String period;
  final String description;

  Experience({
    required this.company,
    required this.location,
    required this.position,
    required this.period,
    required this.description,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      company: json['company'] as String,
      location: json['location'] as String,
      position: json['position'] as String,
      period: json['period'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'company': company,
      'location': location,
      'position': position,
      'period': period,
      'description': description,
    };
  }
}
