// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<ChapterDetails> chapterNameFromJson(String str) =>
    List<ChapterDetails>.from(
        json.decode(str).map((x) => ChapterDetails.fromJson(x)));

String welcomeToJson(List<ChapterDetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChapterDetails {
  ChapterDetails({
    required this.nameEnglish,
    required this.nameBengali,
    required this.lastUpdate,
    required this.isActive,
    required this.id,
    required this.chSerial,
    required this.bookId,
    required this.hadithNumber,
    required this.rangeStart,
    required this.rangeEnd,
    //required this.bookInitial,
  });

  String nameEnglish;
  String nameBengali;
  DateTime lastUpdate;
  String isActive;
  String id;
  String chSerial;
  String bookId;
  String hadithNumber;
  String rangeStart;
  String rangeEnd;

  // BookInitial bookInitial;

  factory ChapterDetails.fromJson(Map<String, dynamic> json) => ChapterDetails(
        nameEnglish: json["nameEnglish"],
        nameBengali: json["nameBengali"],
        lastUpdate: DateTime.parse(json["lastUpdate"]),
        isActive: json["isActive"],
        id: json["id"],
        chSerial: json["chSerial"],
        bookId: json["bookId"],
        hadithNumber: json["hadith_number"],
        rangeStart: json["range_start"],
        rangeEnd: json["range_end"],
        //  bookInitial: []//bookInitialValues.map[json["bookInitial"]],
      );

  Map<String, dynamic> toJson() => {
        "nameEnglish": nameEnglish,
        "nameBengali": nameBengali,
        "lastUpdate":
            "${lastUpdate.year.toString().padLeft(4, '0')}-${lastUpdate.month.toString().padLeft(2, '0')}-${lastUpdate.day.toString().padLeft(2, '0')}",
        "isActive": isActive,
        "id": id,
        "chSerial": chSerial,
        "bookId": bookId,
        "hadith_number": hadithNumber,
        "range_start": rangeStart,
        "range_end": rangeEnd,
        // "bookInitial": bookInitialValues.reverse[bookInitial],
      };
}
