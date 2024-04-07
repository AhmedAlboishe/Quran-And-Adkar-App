// import 'package:test_alquran/model/ayaat_model.dart';

// class Surah {
//   final int surahNumber;
//   final String name;
//   final String englishName;
//   final String englishNameTranslation;
//   final String revelationType;
//   final List<Ayah> ayahs;
//   Surah({
//     required this.surahNumber,
//     required this.name,
//     required this.englishName,
//     required this.englishNameTranslation,
//     required this.revelationType,
//     required this.ayahs,
//   });

//   Map<String, dynamic> toJson() {
//     return <String, dynamic>{
//       'number': surahNumber,
//       'name': name,
//       'englishName': englishName,
//       'englishNameTranslation': englishNameTranslation,
//       'revelationType': revelationType,
//       'ayahs': ayahs,
//     };
//   }

//   factory Surah.fromJson(Map<String, dynamic> json) {
//     return Surah(
//       surahNumber: json['number'] as int,
//       name: json['name'] as String,
//       englishName: json['englishName'] as String,
//       englishNameTranslation: json['englishNameTranslation'] as String,
//       revelationType: json['revelationType'] as String,
//       ayahs: (json['ayahs'] as List).map((ayah) => Ayah.fromJson(ayah)).toList(),
//     );
//   }
// }
