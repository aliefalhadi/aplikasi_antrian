import 'package:aplikasi_antrian/providers/base_provider.dart';

class RegisterProvider extends BaseProvider{
  Map dataRegister = {
    "nik" : "",
    "nama" : "",
    "nomor_hp" : "",
    "email" : "",
    "password" : "",
  };


  void changedDataRegister({String field, String value}){
    this.dataRegister[field] = value;
  }
}