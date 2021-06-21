import 'package:shared_preferences/shared_preferences.dart';

class MainProvider {
  Future<String> onStartApp() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // OneSignal.shared.init(
    //     "14c55d81-1c95-4205-b483-3446a5e15e47",
    //     iOSSettings: null
    // );
    // OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);
    //
    // await this.checkLatestVersion();
    print('asd');
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