// To parse this JSON data, do
//
//     final daftarLayananInstansiDetailModel = daftarLayananInstansiDetailModelFromJson(jsonString);

import 'dart:convert';

DaftarLayananInstansiDetailModel daftarLayananInstansiDetailModelFromJson(String str) => DaftarLayananInstansiDetailModel.fromJson(json.decode(str));

String daftarLayananInstansiDetailModelToJson(DaftarLayananInstansiDetailModel data) => json.encode(data.toJson());

class DaftarLayananInstansiDetailModel {
  DaftarLayananInstansiDetailModel({
    this.status,
    this.data,
  });

  String status;
  Data data;

  factory DaftarLayananInstansiDetailModel.fromJson(Map<String, dynamic> json) => DaftarLayananInstansiDetailModel(
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
    this.instansi,
    this.layanan,
  });

  Instansi instansi;
  List<Layanan> layanan;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    instansi: json["instansi"] == null ? null : Instansi.fromJson(json["instansi"]),
    layanan: json["layanan"] == null ? null : List<Layanan>.from(json["layanan"].map((x) => Layanan.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "instansi": instansi == null ? null : instansi.toJson(),
    "layanan": layanan == null ? null : List<dynamic>.from(layanan.map((x) => x.toJson())),
  };
}

class Instansi {
  Instansi({
    this.instansiId,
    this.instansiStatus,
    this.instansiNama,
    this.instansiNamaKet,
    this.instansiAlamat,
    this.instansiKet,
    this.instansiLogo,
    this.instansiUrl,
    this.instansiPhoto,
    this.instansiJl,
    this.instansiDh,
    this.instansiPp,
    this.instansiBiaya,
    this.instansiLw,
    this.instansiAp,
    this.instansiDes,
    this.instansiTelp,
    this.instansiEmail,
    this.instansiTracking,
    this.instansiGedung,
  });

  int instansiId;
  int instansiStatus;
  String instansiNama;
  String instansiNamaKet;
  String instansiAlamat;
  String instansiKet;
  String instansiLogo;
  String instansiUrl;
  String instansiPhoto;
  String instansiJl;
  String instansiDh;
  String instansiPp;
  String instansiBiaya;
  String instansiLw;
  String instansiAp;
  String instansiDes;
  String instansiTelp;
  String instansiEmail;
  String instansiTracking;
  String instansiGedung;

  factory Instansi.fromJson(Map<String, dynamic> json) => Instansi(
    instansiId: json["instansiID"] == null ? null : json["instansiID"],
    instansiStatus: json["instansiStatus"] == null ? null : json["instansiStatus"],
    instansiNama: json["instansiNama"] == null ? null : json["instansiNama"],
    instansiNamaKet: json["instansiNamaKet"] == null ? null : json["instansiNamaKet"],
    instansiAlamat: json["instansiAlamat"] == null ? null : json["instansiAlamat"],
    instansiKet: json["instansiKet"] == null ? null : json["instansiKet"],
    instansiLogo: json["instansiLogo"] == null ? null : json["instansiLogo"],
    instansiUrl: json["instansiURL"] == null ? null : json["instansiURL"],
    instansiPhoto: json["instansiPhoto"] == null ? null : json["instansiPhoto"],
    instansiJl: json["instansiJL"] == null ? null : json["instansiJL"],
    instansiDh: json["instansiDH"] == null ? null : json["instansiDH"],
    instansiPp: json["instansiPP"] == null ? null : json["instansiPP"],
    instansiBiaya: json["instansiBiaya"] == null ? null : json["instansiBiaya"],
    instansiLw: json["instansiLW"] == null ? null : json["instansiLW"],
    instansiAp: json["instansiAP"] == null ? null : json["instansiAP"],
    instansiDes: json["instansiDes"] == null ? null : json["instansiDes"],
    instansiTelp: json["instansiTelp"] == null ? null : json["instansiTelp"],
    instansiEmail: json["instansiEmail"] == null ? null : json["instansiEmail"],
    instansiTracking: json["instansiTracking"] == null ? null : json["instansiTracking"],
    instansiGedung: json["instansiGedung"] == null ? null : json["instansiGedung"],
  );

  Map<String, dynamic> toJson() => {
    "instansiID": instansiId == null ? null : instansiId,
    "instansiStatus": instansiStatus == null ? null : instansiStatus,
    "instansiNama": instansiNama == null ? null : instansiNama,
    "instansiNamaKet": instansiNamaKet == null ? null : instansiNamaKet,
    "instansiAlamat": instansiAlamat == null ? null : instansiAlamat,
    "instansiKet": instansiKet == null ? null : instansiKet,
    "instansiLogo": instansiLogo == null ? null : instansiLogo,
    "instansiURL": instansiUrl == null ? null : instansiUrl,
    "instansiPhoto": instansiPhoto == null ? null : instansiPhoto,
    "instansiJL": instansiJl == null ? null : instansiJl,
    "instansiDH": instansiDh == null ? null : instansiDh,
    "instansiPP": instansiPp == null ? null : instansiPp,
    "instansiBiaya": instansiBiaya == null ? null : instansiBiaya,
    "instansiLW": instansiLw == null ? null : instansiLw,
    "instansiAP": instansiAp == null ? null : instansiAp,
    "instansiDes": instansiDes == null ? null : instansiDes,
    "instansiTelp": instansiTelp == null ? null : instansiTelp,
    "instansiEmail": instansiEmail == null ? null : instansiEmail,
    "instansiTracking": instansiTracking == null ? null : instansiTracking,
    "instansiGedung": instansiGedung == null ? null : instansiGedung,
  };
}

class Layanan {
  Layanan({
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

  factory Layanan.fromJson(Map<String, dynamic> json) => Layanan(
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
