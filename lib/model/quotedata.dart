// To parse this JSON data, do
//
//     final quoteData = quoteDataFromJson(jsonString);

import 'dart:convert';

List<QuoteData> quoteDataFromJson(String str) =>
    List<QuoteData>.from(json.decode(str).map((x) => QuoteData.fromJson(x)));

String quoteDataToJson(List<QuoteData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuoteData {
  int? id;
  String? quote;
  String? image;
  String? type;

  QuoteData({this.id, this.quote, this.image, this.type});

  factory QuoteData.fromJson(Map<String, dynamic> json) => QuoteData(
      id: json["id"],
      quote: json["quote"],
      image: json["path"],
      type: json["type"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "quote": quote, "path": image, "type": type};
}
