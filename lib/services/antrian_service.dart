import 'dart:convert';
import 'dart:io';
import 'package:aplikasi_antrian/models/cek_antrian_harian_model.dart';
import 'package:aplikasi_antrian/models/cek_daftar_antrian_model.dart';
import 'package:aplikasi_antrian/models/daftar_all_instansi_model.dart';
import 'package:aplikasi_antrian/models/daftar_antrian_aktif_model.dart';
import 'package:aplikasi_antrian/models/daftar_histori_antrian_model.dart';
import 'package:aplikasi_antrian/models/daftar_instansi_model.dart';
import 'package:aplikasi_antrian/models/daftar_layanan_instansi_detail_model.dart';
import 'package:aplikasi_antrian/models/daftar_layanan_instansi_model.dart';
import 'package:aplikasi_antrian/models/detail_histori_antrian_model.dart';
import 'package:aplikasi_antrian/services/service.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AntrianService extends Service{
  Future getDaftarInstansi() async {
    try {
      var url = '/antrians/daftar-instansi';

      //pos, get, put, delete

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

  Future getDaftarAllInstansi() async {
    try {
      var url = '/antrians/daftar-all-instansi';

      var response = await get(url);

      if (response.statusCode == 200) {
        DaftarAllInstansiModel daftarAllInstansiModel =
        daftarAllInstansiModelFromJson(jsonEncode(response.data));
        return daftarAllInstansiModel;
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

  Future getDaftarLayananInstansiDetail({String idInstansi}) async {
    try {
      var url = '/antrians/daftar-layanan-instansi2/'+idInstansi;

      var response = await get(url);

      if (response.statusCode == 200) {
        DaftarLayananInstansiDetailModel daftarLayananInstansiDetailModel =
        daftarLayananInstansiDetailModelFromJson(jsonEncode(response.data));
        return daftarLayananInstansiDetailModel;
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

  Future postDaftarAntrianAktif(var data) async {
    try {
      var url = '/antrians/cek-antrian';

      print(data);

      var response = await post(url, data);

      if (response.statusCode == 200) {
        DaftarAntrianAktifModel daftarAntrianAktifModel =
        daftarAntrianAktifModelFromJson(jsonEncode(response.data));

        if(daftarAntrianAktifModel.data.isEmpty){
          throw ('data tidak ditemukan');
        }

        return daftarAntrianAktifModel;
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

  Future getDaftarHistoriAntrian() async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      String nik = sharedPreferences.getString('nik');
      var url = '/antrians/histori-antrian/'+nik;

      var response = await get(url);

      if (response.statusCode == 200) {
        DaftarHistoriAntrianModel daftarHistoriAntrianModel =
        daftarHistoriAntrianModelFromJson(jsonEncode(response.data));

        if(daftarHistoriAntrianModel.data.isEmpty){
          throw ('data tidak ditemukan');
        }

        return daftarHistoriAntrianModel;
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

  Future getDetailHistoriAntrian({String idAntrian}) async {
    try {
      var url = '/antrians/detail-histori-antrian/'+idAntrian;

      var response = await get(url);

      if (response.statusCode == 200) {
        DetailHistoriAntrianModel detailHistoriAntrianModel =
        detailHistoriAntrianModelFromJson(jsonEncode(response.data));

        return detailHistoriAntrianModel;
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


  Future getCekAntrianHarian() async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      String nik = sharedPreferences.getString('nik');

      var url = '/antrians/cek-antrian-harian/'+nik;

      var response = await get(url);

      if (response.statusCode == 200) {
        CekAntrianHarianModel cekAntrianHarianModel =
        cekAntrianHarianModelFromJson(jsonEncode(response.data));
        return cekAntrianHarianModel;
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