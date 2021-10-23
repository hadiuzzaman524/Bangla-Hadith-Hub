// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/material.dart';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  String id;
  String nameEnglish;
  String nameBengali;
  DateTime lastUpdate;
  String isActive;
  String priority;
  String publisherId;
  String sectionNumber;
  String hadithNumber;
  String bookKey;

  Welcome({
    required this.id,
    required this.nameEnglish,
    required this.nameBengali,
    required this.lastUpdate,
    required this.isActive,
    required this.priority,
    required this.publisherId,
    required this.sectionNumber,
    required this.hadithNumber,
    required this.bookKey,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["id"],
        nameEnglish: json["nameEnglish"],
        nameBengali: json["nameBengali"],
        lastUpdate: DateTime.parse(json["lastUpdate"]),
        isActive: json["isActive"],
        priority: json["priority"],
        publisherId: json["publisherId"],
        sectionNumber: json["section_number"],
        hadithNumber: json["hadith_number"],
        bookKey: json["book_key"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nameEnglish": nameEnglish,
        "nameBengali": nameBengali,
        "lastUpdate":
            "${lastUpdate.year.toString().padLeft(4, '0')}-${lastUpdate.month.toString().padLeft(2, '0')}-${lastUpdate.day.toString().padLeft(2, '0')}",
        "isActive": isActive,
        "priority": priority,
        "publisherId": publisherId,
        "section_number": sectionNumber,
        "hadith_number": hadithNumber,
        "book_key": bookKey,
      };
}
