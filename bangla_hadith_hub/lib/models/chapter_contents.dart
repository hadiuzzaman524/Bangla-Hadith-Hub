// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Content> chapterContentFromJson(String str) =>
    List<Content>.from(json.decode(str).map((x) => Content.fromJson(x)));

String welcomeToJson(List<Content> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Content {
  final String hadithEnglish;
  final String hadithArabic;
  final String hadithBengali;
  final String checkStatus;
  final String hadithNo;
  final String id;
  final String thesequence;
  final String isActive;
  final String chapterId;
  final String bookId;
  final String publisherId;
  final String sectionId;
  final String statusId;
  final String topicName;
  final String rabiNameBn;
  final String rabiNameEn;

  Content({
    required this.id,
    required this.bookId,
    required this.chapterId,
    required this.checkStatus,
    required this.hadithArabic,
    required this.hadithBengali,
    required this.hadithEnglish,
    required this.hadithNo,
    required this.isActive,
    required this.publisherId,
    required this.rabiNameBn,
    required this.rabiNameEn,
    required this.sectionId,
    required this.statusId,
    required this.thesequence,
    required this.topicName,
  });

  // BookInitial bookInitial;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        sectionId: json['sectionId'],
        rabiNameEn: json['rabiNameEn'],
        bookId: json['bookId'],
        hadithEnglish: json['hadithEnglish'],
        chapterId: json['chapterId'],
        topicName: json['topicName'],
        statusId: json['statusId'],
        hadithNo: json['hadithNo'],
        checkStatus: json['checkStatus'],
        thesequence: json['thesequence'],
        publisherId: json['publisherId'],
        hadithArabic: json['hadithArabic'],
        hadithBengali: json['hadithBengali'],
        rabiNameBn: json['rabiNameBn'],
        isActive: json['isActive'],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        "sectionId": sectionId,
        "rabiNameEn": rabiNameEn,
        "bookId": bookId,
        "hadithEnglish": hadithEnglish,
        "chapterId": chapterId,
        "topicName": topicName,
        "statusId": statusId,
        "hadithNo": hadithNo,
        "checkStatus": checkStatus,
        "thesequence": thesequence,
        "publisherId": publisherId,
        "hadithArabic": hadithArabic,
        "hadithBengali": hadithBengali,
        "rabiNameBn": rabiNameBn,
        "isActive": isActive,
        "id": id,
      };
}
