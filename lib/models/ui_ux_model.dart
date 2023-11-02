import 'dart:convert';

import 'package:flutter/widgets.dart';

class UIUXModal {
  String? image;
  String? title;
  String? subTitle;
  String? time;
  UIUXModal({
    this.image,
    this.title,
    this.subTitle,
    this.time,
  });

  UIUXModal copyWith({
    ValueGetter<String?>? image,
    ValueGetter<String?>? title,
    ValueGetter<String?>? subTitle,
    ValueGetter<String?>? time,
  }) {
    return UIUXModal(
      image: image != null ? image() : this.image,
      title: title != null ? title() : this.title,
      subTitle: subTitle != null ? subTitle() : this.subTitle,
      time: time != null ? time() : this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'title': title,
      'subTitle': subTitle,
      'time': time,
    };
  }

  factory UIUXModal.fromMap(Map<String, dynamic> map) {
    return UIUXModal(
      image: map['image'],
      title: map['title'],
      subTitle: map['subTitle'],
      time: map['time'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UIUXModal.fromJson(String source) =>
      UIUXModal.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UIUXModal(image: $image, title: $title, subTitle: $subTitle, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UIUXModal &&
        other.image == image &&
        other.title == title &&
        other.subTitle == subTitle &&
        other.time == time;
  }

  @override
  int get hashCode {
    return image.hashCode ^ title.hashCode ^ subTitle.hashCode ^ time.hashCode;
  }
}
