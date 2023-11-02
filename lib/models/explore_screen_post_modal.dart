import 'dart:convert';

import 'package:flutter/widgets.dart';

class PostModal {
  String? image;
  String? name;
  String? subName;
  String? date;
  String? time;
  String? postImage;
  PostModal({
    this.image,
    this.name,
    this.subName,
    this.date,
    this.time,
    this.postImage,
  });

  PostModal copyWith({
    ValueGetter<String?>? image,
    ValueGetter<String?>? name,
    ValueGetter<String?>? subName,
    ValueGetter<String?>? date,
    ValueGetter<String?>? time,
    ValueGetter<String?>? postImage,
  }) {
    return PostModal(
      image: image != null ? image() : this.image,
      name: name != null ? name() : this.name,
      subName: subName != null ? subName() : this.subName,
      date: date != null ? date() : this.date,
      time: time != null ? time() : this.time,
      postImage: postImage != null ? postImage() : this.postImage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'subName': subName,
      'date': date,
      'time': time,
      'postImage': postImage,
    };
  }

  factory PostModal.fromMap(Map<String, dynamic> map) {
    return PostModal(
      image: map['image'],
      name: map['name'],
      subName: map['subName'],
      date: map['date'],
      time: map['time'],
      postImage: map['postImage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModal.fromJson(String source) =>
      PostModal.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostModal(image: $image, name: $name, subName: $subName, date: $date, time: $time, postImage: $postImage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostModal &&
        other.image == image &&
        other.name == name &&
        other.subName == subName &&
        other.date == date &&
        other.time == time &&
        other.postImage == postImage;
  }

  @override
  int get hashCode {
    return image.hashCode ^
        name.hashCode ^
        subName.hashCode ^
        date.hashCode ^
        time.hashCode ^
        postImage.hashCode;
  }
}
