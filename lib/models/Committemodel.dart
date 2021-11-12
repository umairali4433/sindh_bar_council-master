// To parse this JSON data, do
//
//     final committee = committeeFromJson(jsonString);

import 'dart:convert';

List<Committee> committeeFromJson(String str) => List<Committee>.from(json.decode(str).map((x) => Committee.fromJson(x)));

String committeeToJson(List<Committee> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Committee {
  Committee({
    this.committeeId,
    this.committeeName,
    this.committeeData,
  });

  String committeeId;
  String committeeName;
  List<CommitteeDatum> committeeData;

  factory Committee.fromJson(Map<String, dynamic> json) => Committee(
    committeeId: json["committee_id"] == null ? null : json["committee_id"],
    committeeName: json["committee_name"] == null ? null : json["committee_name"],
    committeeData: json["committee_data"] == null ? null : List<CommitteeDatum>.from(json["committee_data"].map((x) => CommitteeDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "committee_id": committeeId == null ? null : committeeId,
    "committee_name": committeeName == null ? null : committeeName,
    "committee_data": committeeData == null ? null : List<dynamic>.from(committeeData.map((x) => x.toJson())),
  };
}

class CommitteeDatum {
  CommitteeDatum({
    this.memberName,
    this.image,
    this.mobile,
    this.title,
  });

  String memberName;
  String image;
  String mobile;
  String title;

  factory CommitteeDatum.fromJson(Map<String, dynamic> json) => CommitteeDatum(
    memberName: json["member_name"] == null ? null : json["member_name"],
    image: json["image"] == null ? null : json["image"],
    mobile: json["mobile"] == null ? null : json["mobile"],
    title: json["title"] == null ? null : json["title"],
  );

  Map<String, dynamic> toJson() => {
    "member_name": memberName == null ? null : memberName,
    "image": image == null ? null : image,
    "mobile": mobile == null ? null : mobile,
    "title": title == null ? null : title,
  };
}


class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
