// To parse this JSON data, do
//
//     final daftarAllInstansiModel = daftarAllInstansiModelFromJson(jsonString);

import 'dart:convert';

DaftarAllInstansiModel daftarAllInstansiModelFromJson(String str) => DaftarAllInstansiModel.fromJson(json.decode(str));

String daftarAllInstansiModelToJson(DaftarAllInstansiModel data) => json.encode(data.toJson());

class DaftarAllInstansiModel {
  DaftarAllInstansiModel({
    this.status,
    this.data,
  });

  String status;
  List<Datum> data;

  factory DaftarAllInstansiModel.fromJson(Map<String, dynamic> json) => DaftarAllInstansiModel(
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
    this.instansiId,
    this.instansiNama,
    this.instansiLogo,
  });

  int instansiId;
  String instansiNama;
  String instansiLogo;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    instansiId: json["instansiID"] == null ? null : json["instansiID"],
    instansiNama: json["instansiNama"] == null ? null : json["instansiNama"],
    instansiLogo: json["instansiLogo"] == null ? null : json["instansiLogo"],
  );

  Map<String, dynamic> toJson() => {
    "instansiID": instansiId == null ? null : instansiId,
    "instansiNama": instansiNama == null ? null : instansiNama,
    "instansiLogo": instansiLogo == null ? null : instansiLogo,
  };
}
