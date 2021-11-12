// To parse this JSON data, do
//
//     final vicechairmanmodel = vicechairmanmodelFromJson(jsonString);

import 'dart:convert';

List<Vicechairmanmodel> vicechairmanmodelFromJson(String str) => List<Vicechairmanmodel>.from(json.decode(str).map((x) => Vicechairmanmodel.fromJson(x)));

String vicechairmanmodelToJson(List<Vicechairmanmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Vicechairmanmodel {
  Vicechairmanmodel({
    this.id,
    this.chairmanName,
    this.fromDate,
    this.toDate,
    this.postImage,
    this.isActive,
  });

  dynamic id;
  String chairmanName;
  String fromDate;
  String toDate;
  String postImage;
  dynamic isActive;

  factory Vicechairmanmodel.fromJson(Map<String, dynamic> json) => Vicechairmanmodel(
    id: json["id"],
    chairmanName: json["chairman_name"] == null ? null : json["chairman_name"],
    fromDate: json["from_date"] == null ? null : json["from_date"],
    toDate: json["to_date"] == null ? null : json["to_date"],
    postImage: json["post_image"] == null ? null : json["post_image"],
    isActive: json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "chairman_name": chairmanName == null ? null : chairmanName,
    "from_date": fromDate == null ? null : fromDate,
    "to_date": toDate == null ? null : toDate,
    "post_image": postImage == null ? null : postImage,
    "is_active": isActive,
  };
}
