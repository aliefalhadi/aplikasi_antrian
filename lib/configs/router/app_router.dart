import 'package:aplikasi_antrian/configs/constants/app_router_strings.dart';
import 'package:aplikasi_antrian/presentations/views/antrian/ambil_antrian.dart';
import 'package:aplikasi_antrian/presentations/views/antrian/cek_antrian.dart';
import 'package:aplikasi_antrian/presentations/views/antrian/detail_histori_antrian.dart';
import 'package:aplikasi_antrian/presentations/views/antrian/pilih_instansi.dart';
import 'package:aplikasi_antrian/presentations/views/antrian/pilih_layanan_instansi.dart';
import 'package:aplikasi_antrian/presentations/views/antrian/pilih_waktu_kunjungan.dart';
import 'package:aplikasi_antrian/presentations/views/auth/login_view.dart';
import 'package:aplikasi_antrian/presentations/views/auth/no_hp_register_view.dart';
import 'package:aplikasi_antrian/presentations/views/auth/otp_register_view.dart';
import 'package:aplikasi_antrian/presentations/views/auth/register_view.dart';
import 'package:aplikasi_antrian/presentations/views/home/detail_instansi.dart';
import 'package:aplikasi_antrian/presentations/views/home/home.dart';
import 'package:aplikasi_antrian/presentations/views/home/home_app.dart';
import 'package:flutter/material.dart';

class AppRouter {
  // daftar routing aplikasi
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRouterStrings.login:
        return MaterialPageRoute(builder: (_) => LoginView());
        break;
      case AppRouterStrings.register:
        return MaterialPageRoute(builder: (_) => RegisterView());
        break;
      case AppRouterStrings.registerNoHp:
        return MaterialPageRoute(builder: (_) => NoHpRegisterView());
        break;
      case AppRouterStrings.registerOtp:
        var noHp = routeSettings.arguments;
        return MaterialPageRoute(builder: (_) => OtpRegisterView(noHp: noHp,));
        break;
      case AppRouterStrings.home:
        //routeSettings.arguments itu paramater untuk pindah halaman
        //apabila halamannya memiliki beberapa tab view
        // nanti bisa di panggil dengan
        // Navigator.pushNamed(context, 'home',arguments:'1');
        // Navigator.pushNamed(context, 'home');
        // cara panjang
        // String page;
        // if(routeSettings.arguments == null){
        //    page = '0';
        // }else{
        //   page = routeSettings.arguments;
        // }
        String page = routeSettings.arguments == null ? '0' : routeSettings.arguments;
        return MaterialPageRoute(builder: (_) => HomeApp(page: int.parse(page),));
        break;
      case AppRouterStrings.detailInstansi:
        String idInstansi = routeSettings.arguments;
        return MaterialPageRoute(builder: (_) => DetailInstansi(idInstansi: idInstansi,));
      case AppRouterStrings.ambilAntrian:
        return MaterialPageRoute(builder: (_) => AmbilAntrian());
        break;
      case AppRouterStrings.cekAntrian:
        return MaterialPageRoute(builder: (_) => CekAntrian());
        break;
      case AppRouterStrings.detailHistoriAntrian:
        String idAntrian = routeSettings.arguments;
        return MaterialPageRoute(builder: (_) => DetailHistoriAntrian(idAntrian: idAntrian,));
        break;
      case AppRouterStrings.pilihInstansi:
        return MaterialPageRoute(builder: (_) => PilihInstansi());
        break;
      case AppRouterStrings.pilihLayananInstansi:
        String idInstansi = routeSettings.arguments;
        return MaterialPageRoute(builder: (_) => PilihLayananInstansi(idInstansi: idInstansi,));
        break;
      case AppRouterStrings.pilihWaktuKunjungan:
        String idLayanan = routeSettings.arguments;
        return MaterialPageRoute(builder: (_) => PilihWaktuKunjungan(idLayanan: idLayanan,));
        break;
      default:
        return null;
    }
  }
}