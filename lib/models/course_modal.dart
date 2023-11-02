import 'dart:convert';

import 'package:flutter/widgets.dart';

class CourseModal {
  String? image;
  String? name;
  String? price;
  String? month;
  String? language;
  CourseModal({
    this.image,
    this.name,
    this.price,
    this.month,
    this.language,
  });

  CourseModal copyWith({
    ValueGetter<String?>? image,
    ValueGetter<String?>? name,
    ValueGetter<String?>? price,
    ValueGetter<String?>? month,
    ValueGetter<String?>? language,
  }) {
    return CourseModal(
      image: image != null ? image() : this.image,
      name: name != null ? name() : this.name,
      price: price != null ? price() : this.price,
      month: month != null ? month() : this.month,
      language: language != null ? language() : this.language,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'courseImage': image,
      'courseName': name,
      'coursePrice': price,
      'courseDuration': month,
      'language': language,
    };
  }

  factory CourseModal.fromMap(Map<String, dynamic> map) {
    return CourseModal(
      image: map['courseImage'],
      name: map['courseName'],
      price: map['coursePrice'],
      month: map['courseDuration'],
      language: map['language'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseModal.fromJson(String source) =>
      CourseModal.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CourseModal(image: $image, name: $name, price: $price, month: $month, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CourseModal &&
        other.image == image &&
        other.name == name &&
        other.price == price &&
        other.month == month &&
        other.language == language;
  }

  @override
  int get hashCode {
    return image.hashCode ^
        name.hashCode ^
        price.hashCode ^
        month.hashCode ^
        language.hashCode;
  }
}
