import 'dart:convert';

import 'package:aplikasi_antrian/configs/utils/shared_preference_helper.dart';
import 'package:aplikasi_antrian/locator.dart';
import 'package:aplikasi_antrian/models/data_token_login_model.dart';
import 'package:aplikasi_antrian/providers/base_provider.dart';
import 'package:aplikasi_antrian/services/auth_service.dart';
import 'package:dio/dio.dart';

class LoginProvider extends BaseProvider{
  AuthService _authService = locator<AuthService>();
  Map dataLogin = {
    "nik" : "",
    "password" : "",
  };


  void changedDataRegister({String field, String value}){
    this.dataLogin[field] = value;
  }

  Future<bool> loginWithCredentials() async {
    try {
      Response res = await _authService.postLogin(jsonEncode(this.dataLogin));
      print(res);
      if(res != null){
        await locator<SharedPreferencesHelper>().storeValueBool('isLogin', true);
        await locator<SharedPreferencesHelper>().storeValueString('token', res.data['token']);

        DataTokenLoginModel dataTokenLoginModel = dataTokenLoginModelFromJson(ascii.decode(base64.decode(base64.normalize(res.data['token'].split(".")[1]))));
        await locator<SharedPreferencesHelper>().storeValueString('dataTokenLogin', jsonEncode(dataTokenLoginModel));

        await locator<SharedPreferencesHelper>().storeValueString('idUser', dataTokenLoginModel.data.idUser.toString());
        await locator<SharedPreferencesHelper>().storeValueString('nik', dataTokenLoginModel.data.nik.toString());
        await locator<SharedPreferencesHelper>().storeValueString('no_kk', dataTokenLoginModel.data.noKk.toString());
        await locator<SharedPreferencesHelper>().storeValueString('alamat', dataTokenLoginModel.data.alamat.toString());
        await locator<SharedPreferencesHelper>().storeValueString('email', dataTokenLoginModel.data.email.toString());
        await locator<SharedPreferencesHelper>().storeValueString('nama', dataTokenLoginModel.data.nama.toString());
        await locator<SharedPreferencesHelper>().storeValueString('no_hp', dataTokenLoginModel.data.noHp.toString());


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