// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

List<NotificationModel> notificationModelFromJson(String str) => List<NotificationModel>.from(json.decode(str).map((x) => NotificationModel.fromJson(x)));

String notificationModelToJson(List<NotificationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificationModel {
  NotificationModel({
    this.id,
    this.postTitle,
    this.postDescription,
    this.postDate,
  });

  String id;
  String postTitle;
  String postDescription;
  String postDate;

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    id: json["id"],
    postTitle: json["post_title"],
    postDescription: json["post_description"],
    postDate: json["post_date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "post_title": postTitle,
    "post_description": postDescription,
    "post_date": postDate,
  };
}
