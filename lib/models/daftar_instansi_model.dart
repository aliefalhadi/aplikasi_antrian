// To parse this JSON data, do
//
//     final daftarInstansiModel = daftarInstansiModelFromJson(jsonString);

import 'dart:convert';

DaftarInstansiModel daftarInstansiModelFromJson(String str) => DaftarInstansiModel.fromJson(json.decode(str));

String daftarInstansiModelToJson(DaftarInstansiModel data) => json.encode(data.toJson());

class DaftarInstansiModel {
  DaftarInstansiModel({
    this.status,
    this.data,
  });

  String status;
  List<Datum> data;

  factory DaftarInstansiModel.fromJson(Map<String, dynamic> json) => DaftarInstansiModel(
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
  });

  int instansiId;
  String instansiNama;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    instansiId: json["instansiID"] == null ? null : json["instansiID"],
    instansiNama: json["instansiNama"] == null ? null : json["instansiNama"],
  );

  Map<String, dynamic> toJson() => {
    "instansiID": instansiId == null ? null : instansiId,
    "instansiNama": instansiNama == null ? null : instansiNama,
  };
}
