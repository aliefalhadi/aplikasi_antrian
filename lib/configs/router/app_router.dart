import 'package:aplikasi_antrian/configs/constants/app_router_strings.dart';
import 'package:aplikasi_antrian/presentations/views/antrian/ambil_antrian.dart';
import 'package:aplikasi_antrian/presentations/views/antrian/cek_antrian.dart';
import 'package:aplikasi_antrian/presentations/views/antrian/detail_histori_antrian.dart';
import 'package:aplikasi_antrian/presentations/views/antrian/pilih_instansi.dart';
import 'package:aplikasi_antrian/presentations/views/antrian/pilih_layanan_instansi.dart';
import 'package:aplikasi_antrian/presentations/views/antrian/pilih_waktu_kunjungan.dart';
import 'package:aplikasi_antrian/presentations/views/auth/register_view.dart';
import 'package:aplikasi_antrian/presentations/views/home/home.dart';
import 'package:aplikasi_antrian/presentations/views/home/home_app.dart';
import 'package:flutter/material.dart';

class AppRouter {

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRouterStrings.register:
        return MaterialPageRoute(builder: (_) => RegisterView());
        break;
      case AppRouterStrings.home:
        String page = routeSettings.arguments == null ? '0' : routeSettings.arguments;
        return MaterialPageRoute(builder: (_) => HomeApp(page: int.parse(page),));
        break;
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