class AntrianOnlineModel {
  String aoID;
  String aoAntrianID;
  String aoNamaLengkap;
  String aoNoKTP;
  String aoNoKK;
  String aoNoHP;
  String aoWaktu;

  AntrianOnlineModel(
      {this.aoID,
      this.aoAntrianID,
      this.aoNamaLengkap,
      this.aoNoKTP,
      this.aoNoKK,
      this.aoNoHP,
      this.aoWaktu});

  //FORMAT TO JSON
  factory AntrianOnlineModel.fromJson(Map<String, dynamic> json) =>
      AntrianOnlineModel(
          aoID: json['aoID'],
          aoAntrianID: json['aoAntrianID'],
          aoNamaLengkap: json['aoNamaLengkap'],
          aoNoKTP: json['aoNoKTP'],
          aoNoKK: json['aoNoKK'],
          aoNoHP: json['aoNoHP'],
          aoWaktu: json['aoWaktu']);

  //PARSE JSON
}
