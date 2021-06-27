import 'dart:convert';
import 'dart:io';

import 'package:aplikasi_antrian/configs/constants/view_state.dart';
import 'package:aplikasi_antrian/configs/utils/shared_preference_helper.dart';
import 'package:aplikasi_antrian/locator.dart';
import 'package:aplikasi_antrian/models/cek_daftar_antrian_model.dart';
import 'package:aplikasi_antrian/models/daftar_instansi_model.dart';
import 'package:aplikasi_antrian/models/daftar_layanan_instansi_model.dart';
import 'package:aplikasi_antrian/models/data_token_login_model.dart';
import 'package:aplikasi_antrian/providers/base_provider.dart';
import 'package:aplikasi_antrian/services/antrian_service.dart';
import 'package:aplikasi_antrian/services/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AntrianProvider extends BaseProvider{
  AntrianService _antrianService = locator<AntrianService>();
  DaftarInstansiModel daftarInstansiModel;
  DaftarLayananInstansiModel daftarLayananInstansiModel;
  CekDaftarAntrianModel cekDaftarAntrianModel;
  Map dataAntrian = {
    "id_instansi" : "",
    "id_layanan_instansi" : "",
    "waktu_kunjungan" : "",
    "id_pengunjung" : ""
  };
  bool isFormLengkap = false;


  void changedDataAntrian({String field, String value}){
    this.dataAntrian[field] = value;
  }

  Future getDaftarInstansi() async {
    try {
      setState(ViewState.Fetching);
      daftarInstansiModel  = await _antrianService.getDaftarInstansi();

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

  Future getDaftarLayananInstansi({String idInstansi}) async {
    try {
      setState(ViewState.Fetching);
      daftarLayananInstansiModel  = await _antrianService.getDaftarLayananInstansi(idInstansi: idInstansi);

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

  Future getCekDaftarAntrian({String idLayanan}) async {
    try {
      setState(ViewState.Fetching);
      cekDaftarAntrianModel  = await _antrianService.geCekDaftarAntrian(idLayanan: idLayanan);
      if(cekDaftarAntrianModel.data.isEmpty){
        setState(ViewState.FetchNull);
      }
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

  Future<bool> postAmbilAntrian() async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      this.dataAntrian['id_pengunjung'] = sharedPreferences.getString('idUser');
      Response res = await _antrianService.postAmbilAntrian(jsonEncode(this.dataAntrian));
      print(res);
      if(res != null){
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