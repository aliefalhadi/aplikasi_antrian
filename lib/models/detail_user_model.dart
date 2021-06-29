// To parse this JSON data, do
//
//     final detailUserModel = detailUserModelFromJson(jsonString);

import 'dart:convert';

DetailUserModel detailUserModelFromJson(String str) => DetailUserModel.fromJson(json.decode(str));

String detailUserModelToJson(DetailUserModel data) => json.encode(data.toJson());

class DetailUserModel {
  DetailUserModel({
    this.status,
    this.data,
  });

  String status;
  Data data;

  factory DetailUserModel.fromJson(Map<String, dynamic> json) => DetailUserModel(
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
    this.pgId,
    this.pgEmail,
    this.pgNama,
    this.pgPassword,
    this.pgAlamat,
    this.pgHp,
    this.pgKtp,
    this.pgKk,
    this.pgTglDaftar,
  });

  int pgId;
  String pgEmail;
  String pgNama;
  String pgPassword;
  String pgAlamat;
  String pgHp;
  String pgKtp;
  String pgKk;
  DateTime pgTglDaftar;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    pgId: json["pgID"] == null ? null : json["pgID"],
    pgEmail: json["pgEmail"] == null ? null : json["pgEmail"],
    pgNama: json["pgNama"] == null ? null : json["pgNama"],
    pgPassword: json["pgPassword"] == null ? null : json["pgPassword"],
    pgAlamat: json["pgAlamat"] == null ? null : json["pgAlamat"],
    pgHp: json["pgHP"] == null ? null : json["pgHP"],
    pgKtp: json["pgKTP"] == null ? null : json["pgKTP"],
    pgKk: json["pgKK"] == null ? null : json["pgKK"],
    pgTglDaftar: json["pgTglDaftar"] == null ? null : DateTime.parse(json["pgTglDaftar"]),
  );

  Map<String, dynamic> toJson() => {
    "pgID": pgId == null ? null : pgId,
    "pgEmail": pgEmail == null ? null : pgEmail,
    "pgNama": pgNama == null ? null : pgNama,
    "pgPassword": pgPassword == null ? null : pgPassword,
    "pgAlamat": pgAlamat == null ? null : pgAlamat,
    "pgHP": pgHp == null ? null : pgHp,
    "pgKTP": pgKtp == null ? null : pgKtp,
    "pgKK": pgKk == null ? null : pgKk,
    "pgTglDaftar": pgTglDaftar == null ? null : pgTglDaftar.toIso8601String(),
  };
}
