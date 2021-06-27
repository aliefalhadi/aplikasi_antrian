// To parse this JSON data, do
//
//     final daftarAntrianAktifModel = daftarAntrianAktifModelFromJson(jsonString);

import 'dart:convert';

DaftarAntrianAktifModel daftarAntrianAktifModelFromJson(String str) => DaftarAntrianAktifModel.fromJson(json.decode(str));

String daftarAntrianAktifModelToJson(DaftarAntrianAktifModel data) => json.encode(data.toJson());

class DaftarAntrianAktifModel {
  DaftarAntrianAktifModel({
    this.status,
    this.data,
  });

  String status;
  List<Datum> data;

  factory DaftarAntrianAktifModel.fromJson(Map<String, dynamic> json) => DaftarAntrianAktifModel(
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
    this.antrianLoket,
    this.antrianNo,
  });

  String antrianLoket;
  int antrianNo;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    antrianLoket: json["antrianLoket"] == null ? null : json["antrianLoket"],
    antrianNo: json["antrianNo"] == null ? null : json["antrianNo"],
  );

  Map<String, dynamic> toJson() => {
    "antrianLoket": antrianLoket == null ? null : antrianLoket,
    "antrianNo": antrianNo == null ? null : antrianNo,
  };
}
