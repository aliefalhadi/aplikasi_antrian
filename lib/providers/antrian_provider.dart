import 'dart:convert';
import 'dart:io';

import 'package:aplikasi_antrian/configs/constants/app_router_strings.dart';
import 'package:aplikasi_antrian/configs/constants/view_state.dart';
import 'package:aplikasi_antrian/configs/utils/shared_preference_helper.dart';
import 'package:aplikasi_antrian/locator.dart';
import 'package:aplikasi_antrian/models/cek_antrian_harian_model.dart';
import 'package:aplikasi_antrian/models/cek_daftar_antrian_model.dart';
import 'package:aplikasi_antrian/models/daftar_antrian_aktif_model.dart';
import 'package:aplikasi_antrian/models/daftar_histori_antrian_model.dart';
import 'package:aplikasi_antrian/models/daftar_instansi_model.dart';
import 'package:aplikasi_antrian/models/daftar_layanan_instansi_model.dart';
import 'package:aplikasi_antrian/models/data_token_login_model.dart';
import 'package:aplikasi_antrian/models/detail_histori_antrian_model.dart';
import 'package:aplikasi_antrian/providers/base_provider.dart';
import 'package:aplikasi_antrian/services/antrian_service.dart';
import 'package:aplikasi_antrian/services/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AntrianProvider extends BaseProvider{
  AntrianService _antrianService = locator<AntrianService>();
  DaftarInstansiModel daftarInstansiModel;
  DaftarLayananInstansiModel daftarLayananInstansiModel;
  CekDaftarAntrianModel cekDaftarAntrianModel;
  DaftarAntrianAktifModel daftarAntrianAktifModel;
  CekAntrianHarianModel cekAntrianHarianModel;
  Map dataAntrian = {
    "id_instansi" : "",
    "id_layanan_instansi" : "",
    "waktu_kunjungan" : "",
    "id_pengunjung" : ""
  };

  Map dataCekAntrian = {
    "id_instansi" : "",
    "id_layanan_instansi" : ""
  };

  bool isFormLengkap = false;

  DaftarHistoriAntrianModel daftarHistoriAntrianModel;
  DetailHistoriAntrianModel detailHistoriAntrianModel;


  void changedDataAntrian({String field, String value}){
    this.dataAntrian[field] = value;
  }

  void changedDataCekAntrian({String field, String value}){
    this.dataCekAntrian[field] = value;
  }

  Future<CekAntrianHarianModel> getCekAntrianHarianUser(BuildContext context) async {
    try {
      setState(ViewState.Fetching);
      cekAntrianHarianModel  = await _antrianService.getCekAntrianHarian();

      if(cekAntrianHarianModel.data != null){
        Navigator.pushNamedAndRemoveUntil(context, AppRouterStrings.home, (route) => false, arguments: '1');
        EasyLoading.showToast('Anda telah mengambil antrian hari ini');
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

  Future postCekAntrianAktif() async {
    try {
      daftarAntrianAktifModel  = await _antrianService.postDaftarAntrianAktif(jsonEncode(this.dataCekAntrian));

      return daftarAntrianAktifModel;
    } on Exception catch (e) {
      // emit(state.copyWith(status: FormzStatus.submissionFailure, exceptionError: e.toString()));
      return null;
    }
  }


  Future getHistoriAntrian() async {
    try {
      setState(ViewState.Fetching);
      daftarHistoriAntrianModel  = await _antrianService.getDaftarHistoriAntrian();
      if(daftarHistoriAntrianModel.data.isEmpty){
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


  Future getDetailHistoriAntrian(String idAntrian) async {
    try {
      setState(ViewState.Fetching);
      detailHistoriAntrianModel  = await _antrianService.getDetailHistoriAntrian(idAntrian: idAntrian);
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
}