import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:aplikasi_antrian/configs/router/app_router.dart';
import 'package:aplikasi_antrian/configs/utils/shared_preference_helper.dart';
import 'package:aplikasi_antrian/locator.dart';
import 'package:aplikasi_antrian/presentations/views/auth/login_view.dart';
import 'package:aplikasi_antrian/presentations/views/home/home_app.dart';
import 'package:aplikasi_antrian/providers/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

void cekAntrian() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  if (sharedPreferences.containsKey('isLogin')) {
    String nik = sharedPreferences.getString('nik');
    String baseUrl = 'http://192.168.1.12/antrian_backend/api/v1';
    var url = baseUrl+ '/notifications/cek-antrian/'+nik;

    var  response = await get(url);

    print('send API cron');
  }

}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final int helloAlarmID = 0;
  await AndroidAlarmManager.initialize();

  setupLocator();
  MainProvider mainProvider = locator<MainProvider>();
  mainProvider.onStartApp().then((value) async{
     runApp(App(initialRoute: value,));
     await AndroidAlarmManager.periodic(const Duration(minutes: 1), helloAlarmID, cekAntrian);
  });
}

class App extends StatelessWidget {
  final String initialRoute;
  App({this.initialRoute});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.green,
            textTheme: ButtonTextTheme.primary,
            padding: EdgeInsets.all(16)
        ),
        inputDecorationTheme: InputDecorationTheme(
            contentPadding: EdgeInsets.all(8),
            border: OutlineInputBorder(
                borderSide: const BorderSide()),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
            )
        ),
      ),
      home: initialRoute == 'login' ? LoginView() : HomeApp(),
      onGenerateRoute: AppRouter().onGenerateRoute,
      builder: EasyLoading.init(),
    );
  }
}
