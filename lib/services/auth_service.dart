import 'dart:convert';
import 'dart:io';

import 'package:aplikasi_antrian/models/detail_user_model.dart';
import 'package:dio/dio.dart';
import 'package:aplikasi_antrian/services/Service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends Service{
  Future<Response> postLogin(var data) async {
    try {
      var url = '/auths/login';

      var response = await postLogin2(url, data);

      if (response.statusCode == 200) {
        return response;
      } else {
        throw ('data tidak ditemukan');
      }
    } on SocketException catch (_) {
      throw SocketException('no_internet');
    } catch (error) {
      if (error is DioError) {
        print(error.response.statusCode);
        throw (error.response.statusCode);
      }
    }
  }

  Future<Response> postRegister(var data) async {
    try {
      var url = '/auths/register';
      print(data);
      var response = await postLogin2(url, data);

      if (response.statusCode == 201) {
        return response;
      } else {
        throw ('data tidak ditemukan');
      }
    } on SocketException catch (_) {
      throw SocketException('no_internet');
    } catch (error) {
      if (error is DioError) {
        print(error.response.statusCode);
        throw (error.response.statusCode);
      }
    }
  }

  Future getDetailUser() async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      String idUser = sharedPreferences.getString('idUser');
      var url = '/auths/detail-user/'+idUser;

      var response = await get(url);

      print(response.statusCode.toString());

      if (response.statusCode == 200) {
        DetailUserModel detailUserModel =
        detailUserModelFromJson(jsonEncode(response.data));


        return detailUserModel;
      } else {
        throw ('data tidak ditemukan');
      }
    } on SocketException catch (_) {
      throw SocketException('no_internet');
    } catch (error) {
      if (error is DioError) {
        print(error.response.statusCode);
        throw (error.response.statusCode);
      }
    }
  }

  Future<Response> postEditDataUser(var data) async {
    try {
      var url = '/auths/edit-data-user';
      print(data);
      var response = await post(url, data);

      if (response.statusCode == 200) {
        return response;
      } else {
        throw ('data tidak ditemukan');
      }
    } on SocketException catch (_) {
      throw SocketException('no_internet');
    } catch (error) {
      if (error is DioError) {
        print(error.response.statusCode);
        throw (error.response.statusCode);
      }
    }
  }

  Future lupaPassword(var data) async {
    try {
      var url = '/auths/cek-reset-password';
      print(jsonEncode(data));
      var response = await post(url, jsonEncode(data));

      if (response.statusCode == 200) {
        return true;
      } else {
        throw (response.data['message']);
        return false;

      }
    }catch (error) {
      if(error is DioError){
        throw(error.response.data['message']);
      }
    }
  }

  Future resetPasswordByPhone(var data) async {
    try {
      var url = '/auths/reset-password';
      print(jsonEncode(data));
      var response = await post(url, jsonEncode(data));
      print(response.data);
      if (response.statusCode == 200) {
        print("ini throw");
        return true;
      } else {
        throw (response.data['message']);
        return false;

      }
    }catch (error) {
      if(error is DioError){
        print("ini dio");
        print(error.response.data['message']);
        throw(error.response.data['message']);
      }
    }
  }
}