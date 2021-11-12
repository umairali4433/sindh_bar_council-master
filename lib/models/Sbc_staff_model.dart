// To parse this JSON data, do
//
//     final sbcStaffModel = sbcStaffModelFromJson(jsonString);

import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
// part 'sbcStaffModel.g.dart';
List<SbcStaffModel> sbcStaffModelFromJson(String str) => List<SbcStaffModel>.from(json.decode(str).map((x) => SbcStaffModel.fromJson(x)));

String sbcStaffModelToJson(List<SbcStaffModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
@JsonSerializable()
class SbcStaffModel {
  SbcStaffModel({
    this.postImage,
    this.secretaryName,
    this.id,
    this.fullName,
    this.mobile,
    this.designation,
    this.working,
    this.order,
  });
  @JsonKey(defaultValue: false)
  String postImage;
  @JsonKey(defaultValue: false)
  String secretaryName;
  @JsonKey(defaultValue: false)
  String id;

  @JsonKey(defaultValue: false)
  String fullName;
  @JsonKey(defaultValue: false)
  String mobile;
  @JsonKey(defaultValue: false)
  String designation;
  @JsonKey(defaultValue: false)
  String working;
  @JsonKey(defaultValue: false)
  String order;

  factory SbcStaffModel.fromJson(Map<String, dynamic> json) => SbcStaffModel(

    postImage: json["post_image"] == null ? null : json["post_image"],
    secretaryName: json["secretary_name"] == null ? null : json["secretary_name"],
    id: json["id"] == null ? null : json["id"],
    fullName: json["full_name"] == null ? null : json["full_name"],
    mobile: json["mobile"] == null ? null : json["mobile"],
    designation: json["designation"] == null ? null : json["designation"],
    working: json["working"] == null ? null : json["working"],
    order: json["order"] == null ? null : json["order"],
  );

  Map<String, dynamic> toJson() => {
    "post_image": postImage == null ? null : postImage,
    "secretary_name": secretaryName == null ? null : secretaryName,
    "id": id == null ? null : id,
    "full_name": fullName == null ? null : fullName,
    "mobile": mobile == null ? null : mobile,
    "designation": designation == null ? null : designation,
    "working": working == null ? null : working,
    "order": order == null ? null : order,
  };
}
