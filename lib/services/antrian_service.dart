import 'dart:convert';
import 'dart:io';
import 'package:aplikasi_antrian/models/cek_daftar_antrian_model.dart';
import 'package:aplikasi_antrian/models/daftar_instansi_model.dart';
import 'package:aplikasi_antrian/models/daftar_layanan_instansi_model.dart';
import 'package:aplikasi_antrian/services/service.dart';
import 'package:dio/dio.dart';

class AntrianService extends Service{
  Future getDaftarInstansi() async {
    try {
      var url = '/antrians/daftar-instansi';

      var response = await get(url);

      if (response.statusCode == 200) {
        DaftarInstansiModel daftarInstansiModel =
        daftarInstansiModelFromJson(jsonEncode(response.data));
        return daftarInstansiModel;
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

  Future getDaftarLayananInstansi({String idInstansi}) async {
    try {
      var url = '/antrians/daftar-layanan-instansi/'+idInstansi;

      var response = await get(url);

      if (response.statusCode == 200) {
        DaftarLayananInstansiModel daftarLayananInstansiModel =
        daftarLayananInstansiModelFromJson(jsonEncode(response.data));
        return daftarLayananInstansiModel;
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

  Future geCekDaftarAntrian({String idLayanan}) async {
    try {
      var url = '/antrians/check-daftar-antrian/'+idLayanan;

      var response = await get(url);

      if (response.statusCode == 200) {
        CekDaftarAntrianModel cekDaftarAntrianModel =
        cekDaftarAntrianModelFromJson(jsonEncode(response.data));

        if(cekDaftarAntrianModel.data.isEmpty){
          throw ('data tidak ditemukan');
        }

        return cekDaftarAntrianModel;
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

  Future<Response> postAmbilAntrian(var data) async {
    try {
      var url = '/antrians/ambil-antrian';
      print(data);
      var response = await post(url, data);

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
}