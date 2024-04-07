// class Ayah {
//   final int number;
//   final String audio;
//   final List<dynamic> audioSecondary;
//   final String text;
//   final String ayaTextEmlaey;
//   final int numberInSurah;
//   final int juz;
//   final int manzil;
//   final int page;
//   final int pageInSurah;
//   final int ruku;
//   final int hizbQuarter;
//   final dynamic sajda;
//   final String codeV2;
//   Ayah({
//     required this.number,
//     required this.audio,
//     required this.audioSecondary,
//     required this.text,
//     required this.ayaTextEmlaey,
//     required this.numberInSurah,
//     required this.juz,
//     required this.manzil,
//     required this.page,
//     required this.pageInSurah,
//     required this.ruku,
//     required this.hizbQuarter,
//     required this.sajda,
//     required this.codeV2,
//   });

//   Map<String, dynamic> toJson() {
//     return <String, dynamic>{
//       'number': number,
//       'audio': audio,
//       'audioSecondary': audioSecondary,
//       'text': text,
//       'ayaTextEmlaey': ayaTextEmlaey,
//       'numberInSurah': numberInSurah,
//       'juz': juz,
//       'manzil': manzil,
//       'page': page,
//       'pageInSurah': pageInSurah,
//       'ruku': ruku,
//       'hizbQuarter': hizbQuarter,
//       'sajda': sajda,
//       'code_v2': codeV2,
//     };
//   }

//   factory Ayah.fromJson(Map<String, dynamic> json) {
//     return Ayah(
//       number: json['number'] as int,
//       audio: json['audio'] as String,
//       audioSecondary:
//           List<dynamic>.from((json['audioSecondary'] as List<dynamic>)),
//       text: json['text'] as String,
//       ayaTextEmlaey: json['aya_text_emlaey'] as String,
//       numberInSurah: json['numberInSurah'] as int,
//       juz: json['juz'] as int,
//       manzil: json['manzil'] as int,
//       page: json['page'] as int,
//       pageInSurah: json['pageInSurah'] as int,
//       ruku: json['ruku'] as int,
//       hizbQuarter: json['hizbQuarter'] as int,
//       sajda: json['sajda'],
//       codeV2: json['code_v2'] as String,
//     );
//   }
// }

class Surah {
  final int surahNumber;
  final String arabicName;
  final String englishName;
  final String revelationType;
  final List<Ayah> ayahs;

  Surah(
      {required this.surahNumber,
      required this.arabicName,
      required this.englishName,
      required this.revelationType,
      required this.ayahs});

  factory Surah.fromJson(Map<String, dynamic> json) {
    var ayahsFromJson = json['ayahs'] as List;
    List<Ayah> ayahsList = ayahsFromJson.map((i) => Ayah.fromJson(i)).toList();

    return Surah(
      surahNumber: json['number'],
      arabicName: json['name'],
      englishName: json['englishName'],
      revelationType: json['revelationType'],
      ayahs: ayahsList,
    );
  }
}

class Ayah {
  final int ayahUQNumber;
  final int ayahNumber;
  final String text;
  final String ayaTextEmlaey;
  final String codeV2;
  final int juz;
  final int page;

  Ayah(
      {required this.ayahUQNumber,
      required this.ayahNumber,
      required this.text,
      required this.ayaTextEmlaey,
      required this.codeV2,
      required this.juz,
      required this.page});

  factory Ayah.fromJson(Map<String, dynamic> json) {
    return Ayah(
      ayahUQNumber: json['number'],
      ayahNumber: json['numberInSurah'],
      text: json['text'],
      ayaTextEmlaey: json['aya_text_emlaey'],
      codeV2: json['code_v2'],
      juz: json['juz'],
      page: json['page'], // Parse the page field from JSON
    );
  }
}
