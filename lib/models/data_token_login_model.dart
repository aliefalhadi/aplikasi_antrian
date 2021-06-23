// To parse this JSON data, do
//
//     final dataTokenLoginModel = dataTokenLoginModelFromJson(jsonString);

import 'dart:convert';

DataTokenLoginModel dataTokenLoginModelFromJson(String str) => DataTokenLoginModel.fromJson(json.decode(str));

String dataTokenLoginModelToJson(DataTokenLoginModel data) => json.encode(data.toJson());

class DataTokenLoginModel {
  DataTokenLoginModel({
    this.iat,
    this.iss,
    this.data,
  });

  int iat;
  String iss;
  Data data;

  factory DataTokenLoginModel.fromJson(Map<String, dynamic> json) => DataTokenLoginModel(
    iat: json["iat"] == null ? null : json["iat"],
    iss: json["iss"] == null ? null : json["iss"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "iat": iat == null ? null : iat,
    "iss": iss == null ? null : iss,
    "data": data == null ? null : data.toJson(),
  };
}

class Data {
  Data({
    this.idUser,
    this.nik,
    this.noKk,
    this.nama,
    this.noHp,
    this.alamat,
    this.email,
  });

  int idUser;
  String nik;
  String noKk;
  String nama;
  String noHp;
  String alamat;
  String email;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    idUser: json["id_user"] == null ? null : json["id_user"],
    nik: json["nik"] == null ? null : json["nik"],
    noKk: json["no_kk"] == null ? null : json["no_kk"],
    nama: json["nama"] == null ? null : json["nama"],
    noHp: json["no_hp"] == null ? null : json["no_hp"],
    alamat: json["alamat"] == null ? null : json["alamat"],
    email: json["email"] == null ? null : json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id_user": idUser == null ? null : idUser,
    "nik": nik == null ? null : nik,
    "no_kk": noKk == null ? null : noKk,
    "nama": nama == null ? null : nama,
    "no_hp": noHp == null ? null : noHp,
    "alamat": alamat == null ? null : alamat,
    "email": email == null ? null : email,
  };
}
