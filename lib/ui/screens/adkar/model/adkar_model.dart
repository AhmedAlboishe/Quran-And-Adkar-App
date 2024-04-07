class Adkar {
  final int id;
  final String category;
  final String deker;
  final int repetition;
  Adkar({
    required this.id,
    required this.category,
    required this.deker,
    required this.repetition,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'category': category,
      'deker': deker,
      'repetition': repetition,
    };
  }

  factory Adkar.fromJson(Map<String, dynamic> json) {
    return Adkar(
      id: json['id'] as int,
      category: json['category'] as String,
      deker: json['deker'] as String,
      repetition: json['repetition'] as int,
    );
  }
}
