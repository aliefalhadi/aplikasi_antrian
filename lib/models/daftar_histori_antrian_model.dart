// To parse this JSON data, do
//
//     final daftarHistoriAntrianModel = daftarHistoriAntrianModelFromJson(jsonString);

import 'dart:convert';

DaftarHistoriAntrianModel daftarHistoriAntrianModelFromJson(String str) => DaftarHistoriAntrianModel.fromJson(json.decode(str));

String daftarHistoriAntrianModelToJson(DaftarHistoriAntrianModel data) => json.encode(data.toJson());

class DaftarHistoriAntrianModel {
  DaftarHistoriAntrianModel({
    this.status,
    this.data,
  });

  String status;
  List<Datum> data;

  factory DaftarHistoriAntrianModel.fromJson(Map<String, dynamic> json) => DaftarHistoriAntrianModel(
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
    this.antrianOnline,
    this.antrian,
    this.jenisLayanan,
    this.instansi,
  });

  AntrianOnline antrianOnline;
  Antrian antrian;
  JenisLayanan jenisLayanan;
  Instansi instansi;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    antrianOnline: json["antrian_online"] == null ? null : AntrianOnline.fromJson(json["antrian_online"]),
    antrian: json["antrian"] == null ? null : Antrian.fromJson(json["antrian"]),
    jenisLayanan: json["jenis_layanan"] == null ? null : JenisLayanan.fromJson(json["jenis_layanan"]),
    instansi: json["instansi"] == null ? null : Instansi.fromJson(json["instansi"]),
  );

  Map<String, dynamic> toJson() => {
    "antrian_online": antrianOnline == null ? null : antrianOnline.toJson(),
    "antrian": antrian == null ? null : antrian.toJson(),
    "jenis_layanan": jenisLayanan == null ? null : jenisLayanan.toJson(),
    "instansi": instansi == null ? null : instansi.toJson(),
  };
}

class Antrian {
  Antrian({
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

  factory Antrian.fromJson(Map<String, dynamic> json) => Antrian(
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

class AntrianOnline {
  AntrianOnline({
    this.aoId,
    this.aoAntrianId,
    this.aoNamaLengkap,
    this.aoNoKtp,
    this.aoNoKk,
    this.aoNoHp,
    this.aoWaktu,
  });

  int aoId;
  int aoAntrianId;
  String aoNamaLengkap;
  String aoNoKtp;
  String aoNoKk;
  String aoNoHp;
  String aoWaktu;

  factory AntrianOnline.fromJson(Map<String, dynamic> json) => AntrianOnline(
    aoId: json["aoID"] == null ? null : json["aoID"],
    aoAntrianId: json["aoAntrianID"] == null ? null : json["aoAntrianID"],
    aoNamaLengkap: json["aoNamaLengkap"] == null ? null : json["aoNamaLengkap"],
    aoNoKtp: json["aoNoKTP"] == null ? null : json["aoNoKTP"],
    aoNoKk: json["aoNoKK"] == null ? null : json["aoNoKK"],
    aoNoHp: json["aoNoHP"] == null ? null : json["aoNoHP"],
    aoWaktu: json["aoWaktu"] == null ? null : json["aoWaktu"],
  );

  Map<String, dynamic> toJson() => {
    "aoID": aoId == null ? null : aoId,
    "aoAntrianID": aoAntrianId == null ? null : aoAntrianId,
    "aoNamaLengkap": aoNamaLengkap == null ? null : aoNamaLengkap,
    "aoNoKTP": aoNoKtp == null ? null : aoNoKtp,
    "aoNoKK": aoNoKk == null ? null : aoNoKk,
    "aoNoHP": aoNoHp == null ? null : aoNoHp,
    "aoWaktu": aoWaktu == null ? null : aoWaktu,
  };
}

class Instansi {
  Instansi({
    this.namaInstansi,
  });

  String namaInstansi;

  factory Instansi.fromJson(Map<String, dynamic> json) => Instansi(
    namaInstansi: json["nama_instansi"] == null ? null : json["nama_instansi"],
  );

  Map<String, dynamic> toJson() => {
    "nama_instansi": namaInstansi == null ? null : namaInstansi,
  };
}

class JenisLayanan {
  JenisLayanan({
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

  factory JenisLayanan.fromJson(Map<String, dynamic> json) => JenisLayanan(
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
