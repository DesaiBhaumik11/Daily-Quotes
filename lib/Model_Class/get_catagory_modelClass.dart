// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

class Category {
  List<CategoryElement> category;
  int flag;
  String message;

  Category({
    this.category,
    this.flag,
    this.message,
  });

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
    category: List<CategoryElement>.from(json["category"].map((x) => CategoryElement.fromMap(x))),
    flag: json["flag"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "category": List<dynamic>.from(category.map((x) => x.toMap())),
    "flag": flag,
    "message": message,
  };
}

class CategoryElement {
  String categoryId;
  String categoryName;
  String categoryImage;

  CategoryElement({
    this.categoryId,
    this.categoryName,
    this.categoryImage,
  });

  factory CategoryElement.fromJson(String str) => CategoryElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryElement.fromMap(Map<String, dynamic> json) => CategoryElement(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    categoryImage: json["category_image"],
  );

  Map<String, dynamic> toMap() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "category_image": categoryImage,
  };
}
