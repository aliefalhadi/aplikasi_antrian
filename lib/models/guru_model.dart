class GuruModel {
  String idGuru;
  String nip;
  String namaGuru;

  GuruModel({this.idGuru, this.nip, this.namaGuru});

  //FORMAT TO JSON
  factory GuruModel.fromJson(Map<String, dynamic> json) => GuruModel(
      idGuru: json['id_guru'], nip: json['nip'], namaGuru: json['nama_guru']);

  //PARSE JSON
}
