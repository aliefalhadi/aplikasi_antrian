import 'dart:isolate';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:aplikasi_antrian/locator.dart';
import 'package:aplikasi_antrian/services/notifikasi_service.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainProvider {
  Future<String> onStartApp() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    OneSignal.shared.init(
        "ba92b786-284f-4aee-b4bf-cbaa78b719b7",
        iOSSettings: null
    );
    OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);
    //
    // await this.checkLatestVersion();
    if (sharedPreferences.containsKey('isLogin')) {
      print('asd');
      bool isLogin = sharedPreferences.getBool('isLogin');
      if (isLogin) {
        DateTime now = new DateTime.now();
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        if(sharedPreferences.containsKey('jam_cek_antrian')){
          int jamCache = sharedPreferences.getInt('jam_cek_antrian');
          if(jamCache != now.hour){
            locator<NotifikasiService>().getCekAntrian();
            sharedPreferences.setInt('jam_cek_antrian', now.hour);
          }
        }else{
          locator<NotifikasiService>().getCekAntrian();
          sharedPreferences.setInt('jam_cek_antrian', now.hour);
        }
        return 'home';
      } else {
        return 'login';
      }
    } else {
      return 'login';
    }
  }
}