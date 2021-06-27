// To parse this JSON data, do
//
//     final daftarLayananInstansiModel = daftarLayananInstansiModelFromJson(jsonString);

import 'dart:convert';

DaftarLayananInstansiModel daftarLayananInstansiModelFromJson(String str) => DaftarLayananInstansiModel.fromJson(json.decode(str));

String daftarLayananInstansiModelToJson(DaftarLayananInstansiModel data) => json.encode(data.toJson());

class DaftarLayananInstansiModel {
  DaftarLayananInstansiModel({
    this.status,
    this.data,
  });

  String status;
  List<Datum> data;

  factory DaftarLayananInstansiModel.fromJson(Map<String, dynamic> json) => DaftarLayananInstansiModel(
    status: json["status"] == null ? null : json["status"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.jlId,
    this.jlInstansiId,
    this.jlNama,
    this.jlKet,
    this.jlMaxAntrian,
    this.jlMaxOnline,
    this.jlStatus,
    this.jlKode,
    this.jlTipe,
  });

  int jlId;
  int jlInstansiId;
  String jlNama;
  String jlKet;
  int jlMaxAntrian;
  int jlMaxOnline;
  int jlStatus;
  String jlKode;
  int jlTipe;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    jlId: json["jlID"] == null ? null : json["jlID"],
    jlInstansiId: json["jlInstansiID"] == null ? null : json["jlInstansiID"],
    jlNama: json["jlNama"] == null ? null : json["jlNama"],
    jlKet: json["jlKet"] == null ? null : json["jlKet"],
    jlMaxAntrian: json["jlMaxAntrian"] == null ? null : json["jlMaxAntrian"],
    jlMaxOnline: json["jlMaxOnline"] == null ? null : json["jlMaxOnline"],
    jlStatus: json["jlStatus"] == null ? null : json["jlStatus"],
    jlKode: json["jlKode"] == null ? null : json["jlKode"],
    jlTipe: json["jlTipe"] == null ? null : json["jlTipe"],
  );

  Map<String, dynamic> toJson() => {
    "jlID": jlId == null ? null : jlId,
    "jlInstansiID": jlInstansiId == null ? null : jlInstansiId,
    "jlNama": jlNama == null ? null : jlNama,
    "jlKet": jlKet == null ? null : jlKet,
    "jlMaxAntrian": jlMaxAntrian == null ? null : jlMaxAntrian,
    "jlMaxOnline": jlMaxOnline == null ? null : jlMaxOnline,
    "jlStatus": jlStatus == null ? null : jlStatus,
    "jlKode": jlKode == null ? null : jlKode,
    "jlTipe": jlTipe == null ? null : jlTipe,
  };
}
