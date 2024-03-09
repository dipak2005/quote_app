// To parse this JSON data, do
//
//     final quote = quoteFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

RxList<Quote> quoteFromJson(String str) => RxList<Quote>.from(json.decode(str).map((x) => Quote.fromJson(x)));

String quoteToJson(List<Quote> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Quote {
  String? type;
  String? image;
  List<dynamic>? quote;

  Quote({
    this.type,
    this.image,
    this.quote,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
    type: json["type"],
    image: json["image"],
    quote: json["quote"] == null ? [] : List<dynamic>.from(json["quote"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "image": image,
    "quote": quote == null ? [] : List<dynamic>.from(quote!.map((x) => x)),
  };
}
