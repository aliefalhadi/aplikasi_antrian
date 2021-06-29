import 'dart:convert';
import 'dart:io';

import 'package:aplikasi_antrian/configs/constants/view_state.dart';
import 'package:aplikasi_antrian/locator.dart';
import 'package:aplikasi_antrian/models/detail_user_model.dart';
import 'package:aplikasi_antrian/providers/base_provider.dart';
import 'package:aplikasi_antrian/services/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider extends BaseProvider{
  DetailUserModel detailUserModel;
  AuthService _authService = locator<AuthService>();
  Map dataUser = {
    'nik' : '',
    'no_kk' : '',
    'nama' : '',
    'email' : '',
    'no_hp' : '',
    'alamat' : '',
  };

  void changedDataUser({String field, String value}){
    this.dataUser[field] = value;
  }

  Future getDetailUser() async {
    try {
      setState(ViewState.Fetching);
      detailUserModel  = await _authService.getDetailUser();

      dataUser['nik'] = detailUserModel.data.pgKtp;
      dataUser['no_kk'] = detailUserModel.data.pgKk;
      dataUser['nama'] = detailUserModel.data.pgNama;
      dataUser['email'] = detailUserModel.data.pgEmail;
      dataUser['no_hp'] = detailUserModel.data.pgHp;
      dataUser['alamat'] = detailUserModel.data.pgAlamat;

      setState(ViewState.Idle);
    }  on SocketException catch(e){
      setState(ViewState.ErrConnection);
    }
    catch (e) {
      if(e == 404 || e == 502 || e == 503){
        setState(ViewState.ErrConnection);
      }else{
        setState(ViewState.FetchNull);
      }
    }
  }

  Future<bool> postEditDataUser() async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      dataUser['id'] = sharedPreferences.getString('idUser');
      Response res = await _authService.postEditDataUser(jsonEncode(this.dataUser));
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