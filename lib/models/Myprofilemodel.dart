// To parse this JSON data, do
//
//     final myprofilemodel = myprofilemodelFromJson(jsonString);

import 'dart:convert';

Myprofilemodel myprofilemodelFromJson(String str) => Myprofilemodel.fromJson(json.decode(str));

String myprofilemodelToJson(Myprofilemodel data) => json.encode(data.toJson());

class Myprofilemodel {
  Myprofilemodel({
    this.preRegNo,
    this.salutation,
    this.advName,
    this.kin,
    this.advFname,
    this.gender,
    this.disName,
    this.divName,
    this.dob,
    this.subdisName,
    this.enrollType,
    this.enrollLcDate,
    this.enrollHcDate,
    this.status,
    this.appLogin,
    this.advImage,
  });

  String preRegNo;
  String salutation;
  String advName;
  String kin;
  String advFname;
  String gender;
  String disName;
  String divName;
  DateTime dob;
  String subdisName;
  String enrollType;
  String enrollLcDate;
  String enrollHcDate;
  String status;
  String appLogin;
  String advImage;

  factory Myprofilemodel.fromJson(Map<String, dynamic> json) => Myprofilemodel(
    preRegNo: json["pre_reg_no"] == null ? null : json["pre_reg_no"],
    salutation: json["salutation"] == null ? null : json["salutation"],
    advName: json["adv_name"] == null ? null : json["adv_name"],
    kin: json["kin"] == null ? null : json["kin"],
    advFname: json["adv_fname"] == null ? null : json["adv_fname"],
    gender: json["gender"] == null ? null : json["gender"],
    disName: json["dis_name"] == null ? null : json["dis_name"],
    divName: json["div_name"] == null ? null : json["div_name"],
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    subdisName: json["subdis_name"] == null ? null : json["subdis_name"],
    enrollType: json["enroll_type"] == null ? null : json["enroll_type"],
    enrollLcDate: json["enroll_lc_date"] == null ? null : json["enroll_lc_date"],
    enrollHcDate: json["enroll_hc_date"] == null ? null : json["enroll_hc_date"],
    status: json["status"] == null ? null : json["status"],
    appLogin: json["app_login"] == null ? null : json["app_login"],
    advImage: json["adv_image"] == null ? null : json["adv_image"],
  );

  Map<String, dynamic> toJson() => {
    "pre_reg_no": preRegNo == null ? null : preRegNo,
    "salutation": salutation == null ? null : salutation,
    "adv_name": advName == null ? null : advName,
    "kin": kin == null ? null : kin,
    "adv_fname": advFname == null ? null : advFname,
    "gender": gender == null ? null : gender,
    "dis_name": disName == null ? null : disName,
    "div_name": divName == null ? null : divName,
    "dob": dob == null ? null : "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "subdis_name": subdisName == null ? null : subdisName,
    "enroll_type": enrollType == null ? null : enrollType,
    "enroll_lc_date": enrollLcDate == null ? null : enrollLcDate,
    "enroll_hc_date": enrollHcDate == null ? null : enrollHcDate,
    "status": status == null ? null : status,
    "app_login": appLogin == null ? null : appLogin,
    "adv_image": advImage == null ? null : advImage,
  };
}
