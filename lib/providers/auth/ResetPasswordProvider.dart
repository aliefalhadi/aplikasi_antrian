import 'package:aplikasi_antrian/configs/constants/app_router_strings.dart';
import 'package:aplikasi_antrian/locator.dart';
import 'package:aplikasi_antrian/providers/base_provider.dart';
import 'package:aplikasi_antrian/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetPasswordProvider extends BaseProvider{
  String phoneNumber, username, otp, authStatus, verificationId, password;
  String errMessage;
  bool isError = false;
  AuthService _authService = locator<AuthService>();


  Future cekUsernameNoHP({String noHp, String username}) async {
    try {
      Map data = Map();
      data["nik"] = username;
      data["no_hp"] = noHp;

      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      // print(jsonEncode(data));
      bool res = await _authService.lupaPassword(data);
      if (res) {
        sharedPreferences.setString('nik', username);
        sharedPreferences.setString('no_hp', data["no_hp"]);
        isError = false;

        // verifyPhoneNumber(context);
        // notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("sddjsndj"+e);
      errMessage = e;
      return false;
    }
  }

  Future<bool> ubahPassword() async {
    try {

      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

      Map data = Map();
      data["nik"] = sharedPreferences.getString('nik');
      data["passwordBaru"] = password;


      bool res = await _authService.resetPasswordByPhone(data);
      if (res) {
        print("berhasil ubah password");
        return true;
      } else {
        print("ini provider error");
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future sendCode(String noHp, {BuildContext context})async{
    this.phoneNumber = noHp;
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: '+$phoneNumber',
      timeout: Duration(seconds: 120),
      verificationCompleted: (AuthCredential authCredential) async{
        authStatus = "Your account is successfully verified";
        print(authStatus);

        // user sudah pernah verified
        // lngsng alihkan ke halaman selanjutnya
        Navigator.pushReplacementNamed(context, AppRouterStrings.resetPassword);
      },
      verificationFailed: (FirebaseAuthException authException) {
        // setState(() {
        authStatus = "Gagal mengirim kode, harap periksa kembali nomor anda";
        errMessage = "Anda sudah melebihi batas pengiriman. Silahkan coba lagi setelah 4 jam";

        print(authException);
        EasyLoading.showError(authException.message,duration: Duration(seconds: 3),dismissOnTap: true,maskType: EasyLoadingMaskType.clear);
        // });
      },
      codeSent: (String verId, [int forceCodeResent]) async{
        print('asdasd');
        verificationId = verId;
        print(verId);
        authStatus = "Kode berhasil dikirimkan ke nomor $phoneNumber";
      },
      codeAutoRetrievalTimeout: (String verId) {
        verificationId = verId;
        authStatus = "Waktu Habis";
        return false;
      },
    );

  }

  Future validationOtp(
      {@required String verificationId, @required String otp}) async {
    try {
      print(verificationId);
      print(otp);
      var user = await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp));

      if (user != null) {
        print("berhasil login");
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}