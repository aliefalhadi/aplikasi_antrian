// To parse this JSON data, do
//
//     final cekDaftarAntrianModel = cekDaftarAntrianModelFromJson(jsonString);

import 'dart:convert';

CekDaftarAntrianModel cekDaftarAntrianModelFromJson(String str) => CekDaftarAntrianModel.fromJson(json.decode(str));

String cekDaftarAntrianModelToJson(CekDaftarAntrianModel data) => json.encode(data.toJson());

class CekDaftarAntrianModel {
  CekDaftarAntrianModel({
    this.status,
    this.data,
  });

  String status;
  List<String> data;

  factory CekDaftarAntrianModel.fromJson(Map<String, dynamic> json) => CekDaftarAntrianModel(
    status: json["status"] == null ? null : json["status"],
    data: json["data"] == null ? null : List<String>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x)),
  };
}
