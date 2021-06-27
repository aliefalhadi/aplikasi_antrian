import 'package:aplikasi_antrian/configs/router/app_router.dart';
import 'package:aplikasi_antrian/locator.dart';
import 'package:aplikasi_antrian/pages/home.dart';
import 'package:aplikasi_antrian/presentations/views/auth/login_view.dart';
import 'package:aplikasi_antrian/presentations/views/home/home_app.dart';
import 'package:aplikasi_antrian/providers/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  MainProvider mainProvider = locator<MainProvider>();
  mainProvider.onStartApp().then((value){
    return runApp(App(initialRoute: value,));
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
