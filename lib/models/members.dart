// To parse this JSON data, do
//
//     final members = membersFromJson(jsonString);

import 'dart:convert';

List<Members> membersFromJson(String str) => List<Members>.from(json.decode(str).map((x) => Members.fromJson(x)));

String membersToJson(List<Members> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Members {
  Members({
    this.id,
    this.memberName,
    this.mobile,
    this.postImage,
    this.designation,
  });

  String id;
  String memberName;
  String mobile;
  String postImage;
  String designation;

  factory Members.fromJson(Map<String, dynamic> json) => Members(
    id: json["id"],
    memberName: json["member_name"],
    mobile: json["mobile"],
    postImage: json["post_image"],
    designation: json["designation"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "member_name": memberName,
    "mobile": mobile,
    "post_image": postImage,
    "designation": designation,
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

class getmembers{
  int index;
  List<Members> members;

  getmembers(this.index, this.members);
}
