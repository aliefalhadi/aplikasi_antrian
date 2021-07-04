import 'dart:isolate';

import 'package:android_alarm_manager/android_alarm_manager.dart';
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
        return 'home';
      } else {
        return 'login';
      }
    } else {
      return 'login';
    }
  }
}