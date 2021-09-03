import 'package:aplikasi_antrian/providers/antrian_provider.dart';
import 'package:aplikasi_antrian/providers/auth/ResetPasswordProvider.dart';
import 'package:aplikasi_antrian/providers/auth/login_provider.dart';
import 'package:aplikasi_antrian/providers/auth/register_provider.dart';
import 'package:aplikasi_antrian/providers/instansi_provider.dart';
import 'package:aplikasi_antrian/providers/main_provider.dart';
import 'package:aplikasi_antrian/providers/notifikasi_provider.dart';
import 'package:aplikasi_antrian/providers/profile_provider.dart';
import 'package:aplikasi_antrian/services/antrian_service.dart';
import 'package:aplikasi_antrian/services/api_interceptors.dart';
import 'package:aplikasi_antrian/services/auth_service.dart';
import 'package:aplikasi_antrian/services/notifikasi_service.dart';
import 'package:get_it/get_it.dart';
import 'configs/utils/shared_preference_helper.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
    //  init injected file
    //services
    locator.registerLazySingleton(() => ApiInterceptors());
    locator.registerLazySingleton(() => SharedPreferencesHelper());
    locator.registerLazySingleton(() => AuthService());
    locator.registerLazySingleton(() => AntrianService());
    locator.registerLazySingleton(() => NotifikasiService());



    // provider
    locator.registerFactory(() => MainProvider());
    locator.registerFactory(() => ResetPasswordProvider());
    locator.registerFactory(() => InstansiProvider());
    locator.registerFactory(() => RegisterProvider());
    locator.registerFactory(() => LoginProvider());
    locator.registerFactory(() => AntrianProvider());
    locator.registerFactory(() => ProfileProvider());
    locator.registerFactory(() => NotifikasiProvider());
}