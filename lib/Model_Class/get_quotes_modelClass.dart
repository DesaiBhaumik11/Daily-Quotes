// To parse this JSON data, do
//
//     final quotes = quotesFromJson(jsonString);

import 'dart:convert';

class Quotes {
  List<Quote> quotes;
  int flag;
  String message;

  Quotes({
    this.quotes,
    this.flag,
    this.message,
  });

  factory Quotes.fromJson(String str) => Quotes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Quotes.fromMap(Map<String, dynamic> json) => Quotes(
    quotes: List<Quote>.from(json["quotes"].map((x) => Quote.fromMap(x))),
    flag: json["flag"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "quotes": List<dynamic>.from(quotes.map((x) => x.toMap())),
    "flag": flag,
    "message": message,
  };
}

class Quote {
  String quotesId;
  String quotesName;
  DateTime quotesDate;
  String categoryId;

  Quote({
    this.quotesId,
    this.quotesName,
    this.quotesDate,
    this.categoryId,
  });

  factory Quote.fromJson(String str) => Quote.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Quote.fromMap(Map<String, dynamic> json) => Quote(
    quotesId: json["quotes_id"],
    quotesName: json["quotes_name"],
    quotesDate: DateTime.parse(json["quotes_date"]),
    categoryId: json["category_id"],
  );

  Map<String, dynamic> toMap() => {
    "quotes_id": quotesId,
    "quotes_name": quotesName,
    "quotes_date": "${quotesDate.year.toString().padLeft(4, '0')}-${quotesDate.month.toString().padLeft(2, '0')}-${quotesDate.day.toString().padLeft(2, '0')}",
    "category_id": categoryId,
  };
}
