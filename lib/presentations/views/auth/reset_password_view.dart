import 'dart:convert';
import 'package:aplikasi_antrian/configs/themes/app_colors.dart';
import 'package:aplikasi_antrian/presentations/views/base_view.dart';
import 'package:aplikasi_antrian/providers/auth/ResetPasswordProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetPasswordView extends StatefulWidget {
  @override
  _ResetPasswordViewState createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  /// Control the input text field.
  TextEditingController _passBaruController = TextEditingController();
  TextEditingController _konfirmPassBaruController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey();

  String uname, noHp;

  bool isCodeSent = false;

  bool _obscureText = true;
  bool _obscureText1 = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggle1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return BaseView<ResetPasswordProvider>(
      builder: (context, ResetPasswordProvider provider, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.10),
                              child: Center(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Masukkan Password Baru",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 54,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(bottom: 18.0),
                              child: TextFormField(
                                obscureText: _obscureText,
                                controller: _passBaruController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Password tidak boleh kosong';
                                  }
                                  if (value.length < 8) {
                                    return 'Password minimal 8 karakter';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.lock_outline,
                                      color: primaryColor,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscureText
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: primaryColor,
                                      ),
                                      onPressed: _toggle,
                                    ),
                                    labelText: "Password Baru",
                                    helperText:"Password minimal 8 karakter"
                                ),
                                onChanged: (val) {
                                  setState(() {
                                    provider.password = val;
                                  });
                                },
                              )),
                          Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: TextFormField(
                                obscureText: _obscureText1,
                                controller: _konfirmPassBaruController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Ulangi password tidak boleh kosong';
                                  }
                                  if (value != _passBaruController.text) {
                                    return 'Konfirmasi password tidak sama';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                    color: primaryColor,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscureText1
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: primaryColor,
                                    ),
                                    onPressed: _toggle1,
                                  ),
                                  labelText: "Konfirmasi Password Baru",
                                ),
                                onChanged: (val) {
                                  setState(() {
                                    provider.phoneNumber = val;
                                  });
                                },
                              )),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(30),
                    padding: EdgeInsets.symmetric(),
                    child:  SizedBox(
                      width: MediaQuery.of(context).size.width ,
                      child: RaisedButton(
                        padding: EdgeInsets.all(16),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        color: primaryColor,
                        child: Text(
                          "Simpan",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          if(_formKey.currentState.validate()){
                            EasyLoading.show(status: "Loading...",maskType: EasyLoadingMaskType.black,dismissOnTap: false);
                            provider.password =
                                _passBaruController.text;
                            bool res = await provider.ubahPassword();
                            EasyLoading.dismiss();
                            if (res) {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return WillPopScope(
                                      onWillPop: () async => false,
                                      child: AlertDialog(
                                        content: Column(
                                          mainAxisSize:
                                          MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                                "Ubah Password berhasil, silahkan login dengan nik dan password yang telah diubah"),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              width: double.infinity,
                                              child: FlatButton(
                                                color: primaryColor,
                                                onPressed: () {
                                                  Navigator.pushNamedAndRemoveUntil(
                                                      context,
                                                      'login',
                                                          (route) => route
                                                          .isFirst);
                                                },
                                                child: Text(
                                                  "Login",
                                                  style: TextStyle(
                                                      color: Colors
                                                          .white),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            } else {
                              EasyLoading.showToast('Reset password gagal, silahkan coba lagi');
                            }
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}