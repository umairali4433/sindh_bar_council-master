// To parse this JSON data, do
//
//     final registeredfirms = registeredfirmsFromJson(jsonString);

import 'dart:convert';

List<Registeredfirms> registeredfirmsFromJson(String str) => List<Registeredfirms>.from(json.decode(str).map((x) => Registeredfirms.fromJson(x)));

String registeredfirmsToJson(List<Registeredfirms> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Registeredfirms {
  Registeredfirms({
    this.id,
    this.firmNumber,
    this.lawFirmsName,
    this.certficateIssuedOn,
    this.address,
  });

  String id;
  String firmNumber;
  String lawFirmsName;
  String certficateIssuedOn;
  String address;

  factory Registeredfirms.fromJson(Map<String, dynamic> json) => Registeredfirms(
    id: json["id"] == null ? null : json["id"],
    firmNumber: json["firm_number"] == null ? null : json["firm_number"],
    lawFirmsName: json["law_firms_name"] == null ? null : json["law_firms_name"],
    certficateIssuedOn: json["certficate_issued_on"] == null ? null : json["certficate_issued_on"],
    address: json["address"] == null ? null : json["address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "firm_number": firmNumber == null ? null : firmNumber,
    "law_firms_name": lawFirmsName == null ? null : lawFirmsName,
    "certficate_issued_on": certficateIssuedOn == null ? null : certficateIssuedOn,
    "address": address == null ? null : address,
  };
}
