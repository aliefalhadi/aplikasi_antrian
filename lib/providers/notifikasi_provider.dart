import 'dart:convert';
import 'dart:io';
import 'package:aplikasi_antrian/configs/constants/view_state.dart';
import 'package:aplikasi_antrian/locator.dart';
import 'package:aplikasi_antrian/models/daftar_notifikasi_model.dart';
import 'package:aplikasi_antrian/providers/base_provider.dart';
import 'package:aplikasi_antrian/services/notifikasi_service.dart';
import 'package:shared_preferences/shared_preferences.dart';


class NotifikasiProvider extends BaseProvider {
  DaftarNotifikasiModel daftarNotifikasiModel;
  NotifikasiService _notifikasiService = locator<NotifikasiService>();

  Future getDaftarNotifikasi() async {
    try {
      setState(ViewState.Fetching);
      daftarNotifikasiModel =
      await _notifikasiService.getDaftarNotifikasi();

      if(daftarNotifikasiModel.data.isEmpty){
        setState(ViewState.FetchNull);
      }else{
        setState(ViewState.Idle);
      }


    } on SocketException catch (e) {
      setState(ViewState.ErrConnection);
    } catch (e) {
      print('erer');
      if (e == 404 || e == 502 || e == 503) {
        setState(ViewState.ErrConnection);
      } else {
        print('erer');
        setState(ViewState.FetchNull);
      }
    }
  }

  Future bacaNotif(String idNotif) async{
    try {
      await _notifikasiService.getBacaNotif(idNotif);
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      int total = sharedPreferences.getInt('notif');


      if(total >= 1){
        await  sharedPreferences.setInt('notif', total-1);
      }else{
        await  sharedPreferences.setInt('notif', 0);
      }

      print(total);
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