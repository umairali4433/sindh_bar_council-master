// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

List<NewsModel> newsModelFromJson(String str) => List<NewsModel>.from(json.decode(str).map((x) => NewsModel.fromJson(x)));

String newsModelToJson(List<NewsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsModel {
  NewsModel({
    this.id,
    this.postTitle,
    this.postDescription,
    this.postDate,
    this.postImage,
    this.isActive,
  });

  String id;
  String postTitle;
  String postDescription;
  String postDate;
  String postImage;
  dynamic isActive;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
    id: json["id"] == null ? null : json["id"],
    postTitle: json["post_title"] == null ? null : json["post_title"],
    postDescription: json["post_description"] == null ? null : json["post_description"],
    postDate: json["post_date"] == null ? null : json["post_date"],
    postImage: json["post_image"] == null ? null : json["post_image"],
    isActive: json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "post_title": postTitle == null ? null : postTitle,
    "post_description": postDescription == null ? null : postDescription,
    "post_date": postDate == null ? null : postDate,
    "post_image": postImage == null ? null : postImage,
    "is_active": isActive,
  };
}
