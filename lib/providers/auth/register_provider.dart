import 'dart:convert';

import 'package:aplikasi_antrian/configs/constants/app_router_strings.dart';
import 'package:aplikasi_antrian/configs/constants/view_state.dart';
import 'package:aplikasi_antrian/locator.dart';
import 'package:aplikasi_antrian/providers/base_provider.dart';
import 'package:aplikasi_antrian/services/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterProvider extends BaseProvider{
  AuthService _authService = locator<AuthService>();
  String phoneNumber, username, otp, authStatus, verificationId, password;
  String errMessage;
  Map dataRegister = {
    "nik" : "",
    "no_kk" : "",
    "nama" : "",
    "no_hp" : "",
    "email" : "",
    "alamat" : "",
    "password" : "",
  };

  void init() async{
    setState(ViewState.Fetching);
    SharedPreferences sp = await SharedPreferences.getInstance();
    dataRegister['no_hp'] = sp.getString('nomor-daftar');
    setState(ViewState.Idle);
  }


  void changedDataRegister({String field, String value}){
    this.dataRegister[field] = value;
  }

  Future<bool> registerWithCredentials() async {
    try {
      Response res = await _authService.postRegister(jsonEncode(this.dataRegister));
      if(res.data != null){
        return true;
      }else{
        return false;
      }
    } on Exception catch (e) {
      // emit(state.copyWith(status: FormzStatus.submissionFailure, exceptionError: e.toString()));
      return false;
    }
  }

  void saveNo(String noHp) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    print("simpan shared $noHp");
    sp.setString('nomor-daftar', noHp);
  }

  Future sendCode(String noHp, {BuildContext context})async{
    this.phoneNumber = noHp;
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: '+$phoneNumber',
      timeout: Duration(seconds: 120),
      verificationCompleted: (AuthCredential authCredential) async{

        // user sudah pernah verified
        // lngsng alihkan ke halaman selanjutnya
        Navigator.pushReplacementNamed(context, AppRouterStrings.register);
      },
      verificationFailed: (FirebaseAuthException authException) {
        // setState(()

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