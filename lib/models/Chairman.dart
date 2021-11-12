// To parse this JSON data, do
//
//     final chairmanmodel = chairmanmodelFromJson(jsonString);

import 'dart:convert';

List<Chairmanmodel> chairmanmodelFromJson(String str) => List<Chairmanmodel>.from(json.decode(str).map((x) => Chairmanmodel.fromJson(x)));

String chairmanmodelToJson(List<Chairmanmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Chairmanmodel {
  Chairmanmodel({
    this.id,
    this.chairmanName,
    this.fromDate,
    this.toDate,
    this.postImage,
    this.isActive,
  });

  String id;
  String chairmanName;
  String fromDate;
  String toDate;
  String postImage;
  String isActive;

  factory Chairmanmodel.fromJson(Map<String, dynamic> json) => Chairmanmodel(
    id: json["id"] == null ? null : json["id"],
    chairmanName: json["chairman_name"] == null ? null : json["chairman_name"],
    fromDate: json["from_date"] == null ? null : json["from_date"],
    toDate: json["to_date"] == null ? null : json["to_date"],
    postImage: json["post_image"] == null ? null : json["post_image"],
    isActive: json["is_active"] == null ? null : json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "chairman_name": chairmanName == null ? null : chairmanName,
    "from_date": fromDate == null ? null : fromDate,
    "to_date": toDate == null ? null : toDate,
    "post_image": postImage == null ? null : postImage,
    "is_active": isActive == null ? null : isActive,
  };
}
