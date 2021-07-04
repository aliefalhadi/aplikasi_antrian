// To parse this JSON data, do
//
//     final cekAntrianHarianModel = cekAntrianHarianModelFromJson(jsonString);

import 'dart:convert';

CekAntrianHarianModel cekAntrianHarianModelFromJson(String str) => CekAntrianHarianModel.fromJson(json.decode(str));

String cekAntrianHarianModelToJson(CekAntrianHarianModel data) => json.encode(data.toJson());

class CekAntrianHarianModel {
  CekAntrianHarianModel({
    this.status,
    this.data,
  });

  String status;
  Data data;

  factory CekAntrianHarianModel.fromJson(Map<String, dynamic> json) => CekAntrianHarianModel(
    status: json["status"] == null ? null : json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "data": data == null ? null : data.toJson(),
  };
}

class Data {
  Data({
    this.antrianId,
    this.antrianTgl,
    this.antrianLoket,
    this.antrianNo,
    this.antrianPanggil,
    this.antrianStatus,
    this.antrianUpdatedUser,
    this.antrianUpdateDate,
    this.antrianJlid,
    this.antrianJenis,
    this.antrianGedung,
    this.antrianJlKode,
  });

  int antrianId;
  DateTime antrianTgl;
  String antrianLoket;
  int antrianNo;
  String antrianPanggil;
  String antrianStatus;
  int antrianUpdatedUser;
  DateTime antrianUpdateDate;
  int antrianJlid;
  int antrianJenis;
  String antrianGedung;
  String antrianJlKode;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    antrianId: json["antrianID"] == null ? null : json["antrianID"],
    antrianTgl: json["antrianTgl"] == null ? null : DateTime.parse(json["antrianTgl"]),
    antrianLoket: json["antrianLoket"] == null ? null : json["antrianLoket"],
    antrianNo: json["antrianNo"] == null ? null : json["antrianNo"],
    antrianPanggil: json["antrianPanggil"] == null ? null : json["antrianPanggil"],
    antrianStatus: json["antrianStatus"] == null ? null : json["antrianStatus"],
    antrianUpdatedUser: json["antrianUpdatedUser"] == null ? null : json["antrianUpdatedUser"],
    antrianUpdateDate: json["antrianUpdateDate"] == null ? null : DateTime.parse(json["antrianUpdateDate"]),
    antrianJlid: json["antrianJLID"] == null ? null : json["antrianJLID"],
    antrianJenis: json["antrianJenis"] == null ? null : json["antrianJenis"],
    antrianGedung: json["antrianGedung"] == null ? null : json["antrianGedung"],
    antrianJlKode: json["antrianJlKode"] == null ? null : json["antrianJlKode"],
  );

  Map<String, dynamic> toJson() => {
    "antrianID": antrianId == null ? null : antrianId,
    "antrianTgl": antrianTgl == null ? null : "${antrianTgl.year.toString().padLeft(4, '0')}-${antrianTgl.month.toString().padLeft(2, '0')}-${antrianTgl.day.toString().padLeft(2, '0')}",
    "antrianLoket": antrianLoket == null ? null : antrianLoket,
    "antrianNo": antrianNo == null ? null : antrianNo,
    "antrianPanggil": antrianPanggil == null ? null : antrianPanggil,
    "antrianStatus": antrianStatus == null ? null : antrianStatus,
    "antrianUpdatedUser": antrianUpdatedUser == null ? null : antrianUpdatedUser,
    "antrianUpdateDate": antrianUpdateDate == null ? null : antrianUpdateDate.toIso8601String(),
    "antrianJLID": antrianJlid == null ? null : antrianJlid,
    "antrianJenis": antrianJenis == null ? null : antrianJenis,
    "antrianGedung": antrianGedung == null ? null : antrianGedung,
    "antrianJlKode": antrianJlKode == null ? null : antrianJlKode,
  };
}
