import 'package:aplikasi_antrian/providers/auth/login_provider.dart';
import 'package:aplikasi_antrian/providers/auth/register_provider.dart';
import 'package:aplikasi_antrian/providers/main_provider.dart';
import 'package:aplikasi_antrian/services/api_interceptors.dart';
import 'package:aplikasi_antrian/services/auth_service.dart';
import 'package:get_it/get_it.dart';

import 'configs/utils/shared_preference_helper.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
    //  init injected file
    //services
    locator.registerLazySingleton(() => ApiInterceptors());
    locator.registerLazySingleton(() => SharedPreferencesHelper());
    locator.registerLazySingleton(() => AuthService());



    // provider
    locator.registerFactory(() => MainProvider());
    locator.registerFactory(() => RegisterProvider());
    locator.registerFactory(() => LoginProvider());
}