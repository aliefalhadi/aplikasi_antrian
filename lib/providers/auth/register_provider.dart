import 'dart:convert';

import 'package:aplikasi_antrian/locator.dart';
import 'package:aplikasi_antrian/providers/base_provider.dart';
import 'package:aplikasi_antrian/services/auth_service.dart';
import 'package:dio/dio.dart';

class RegisterProvider extends BaseProvider{
  AuthService _authService = locator<AuthService>();
  Map dataRegister = {
    "nik" : "",
    "no_kk" : "",
    "nama" : "",
    "no_hp" : "",
    "email" : "",
    "alamat" : "",
    "password" : "",
  };


  void changedDataRegister({String field, String value}){
    this.dataRegister[field] = value;
  }

  Future<bool> registerWithCredentials() async {
    try {
      Response res = await _authService.postRegister(jsonEncode(this.dataRegister));
      if(res.data != null){
        return true;
      }else{
        return false;
      }
    } on Exception catch (e) {
      // emit(state.copyWith(status: FormzStatus.submissionFailure, exceptionError: e.toString()));
      return false;
    }
  }
}