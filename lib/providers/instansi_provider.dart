import 'dart:io';

import 'package:aplikasi_antrian/configs/constants/view_state.dart';
import 'package:aplikasi_antrian/locator.dart';
import 'package:aplikasi_antrian/models/daftar_all_instansi_model.dart';
import 'package:aplikasi_antrian/models/daftar_layanan_instansi_detail_model.dart';
import 'package:aplikasi_antrian/providers/base_provider.dart';
import 'package:aplikasi_antrian/services/antrian_service.dart';

class InstansiProvider extends BaseProvider{
  AntrianService _antrianService = locator<AntrianService>();
  DaftarAllInstansiModel daftarAllInstansiModel;
  DaftarLayananInstansiDetailModel daftarLayananInstansiDetailModel;

  Future getDaftarInstansi() async {
    try {
      setState(ViewState.Fetching);
      daftarAllInstansiModel  = await _antrianService.getDaftarAllInstansi();

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

  Future getDetailInstansi(String idInstansi) async {
    try {
      setState(ViewState.Fetching);
      daftarLayananInstansiDetailModel  = await _antrianService.getDaftarLayananInstansiDetail(idInstansi: idInstansi);

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