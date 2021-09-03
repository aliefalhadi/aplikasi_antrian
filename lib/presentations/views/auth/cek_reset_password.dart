import 'package:aplikasi_antrian/configs/constants/app_router_strings.dart';
import 'package:aplikasi_antrian/configs/themes/app_colors.dart';
import 'package:aplikasi_antrian/presentations/views/base_view.dart';
import 'package:aplikasi_antrian/providers/auth/ResetPasswordProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CekResetPassword extends StatefulWidget {
  @override
  _CekResetPasswordState createState() => _CekResetPasswordState();
}

class _CekResetPasswordState extends State<CekResetPassword> {
  /// Control the input text field.
  TextEditingController _pinEditingController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  final _focusNode = FocusNode();
  bool _validate = false;
  // String phoneNumber, otp, authStatus, verificationId;
  // bool isFetching = false;

  /// Decorate the outside of the Pin.
  // PinDecoration _pinDecoration =
  // UnderlineDecoration(enteredColor: Colors.black, hintText: '333333');

  bool isCodeSent = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus == false) {
        String nomorValidation = validationInput2(_pinEditingController.text);
        if (nomorValidation == null) {
          setState(() {
            _validate = true;
          });
        } else {
          setState(() {
            _pinEditingController.text = nomorValidation;
          });
        }
      }
    });
  }

  String validationInput2(String value) {
    if (value.isEmpty) {
      return null;
    }
    String awal = value[0];
    if (awal == '0') {
      if (value.length >= 11 && value.length <= 13) {
        return value;
      } else {
        return null;
      }
    } else {
      if (value.length > 10) {
        String awal = value.substring(0, 2);
        if (awal == '62') {
          String text = value;
          if (text[2] != '8') {
            text = text.replaceFirst(value[2], '');
          }
          text = text.replaceFirst('62', '0');
          if (text.length >= 11 && text.length <= 13) {
            return text;
          }
        }
      }
    }
    return null;
  }

//  controller input

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
                                      "Lupa Password",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 18,
                                    ),
                                    Text(
                                      "Harap Masukkan NIK dan Nomor Hp Anda",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14),
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
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 18.0),
                          child: TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: primaryColor,
                                ),
                                labelStyle: TextStyle(color: primaryColor),
                                labelText: "NIK"),
                            onChanged: (val) {
                              setState(() {
                                provider.username = val;
                              });
                            },
                          ),
                        ),
                        TextFormField(
                          controller: _pinEditingController,
                          keyboardType: TextInputType.phone,
                          focusNode: _focusNode,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone_android,
                              color: primaryColor,
                            ),
                            labelStyle: TextStyle(color: primaryColor),
                            labelText: "Nomor HP",
                            hintText: "Masukkan nomor hp \"082xx...\"",
                            errorText:
                            _validate ? 'Format nomor anda salah' : null,
                          ),
                          onChanged: (val) {
                            if (val.isEmpty) {
                              setState(() {
                                _validate = true;
                              });
                            } else {
                              if (_validate) {
                                setState(() {
                                  _validate = false;
                                });
                              }
                            }
                            setState(() {
                              provider.phoneNumber = val;
                            });
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        padding: EdgeInsets.all(16),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        color: primaryColor,
                        child: Text(
                          "Kirim Kode",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          await Future.delayed(Duration(seconds: 0));
                          if (provider.username != null && provider.phoneNumber != null && _validate == false) {
                            EasyLoading.show(status: "Loading...", dismissOnTap: false, maskType: EasyLoadingMaskType.black);
                            var res = await provider.cekUsernameNoHP(
                                noHp: _pinEditingController.text,
                                username: _usernameController.text
                            );
                            EasyLoading.dismiss();
                            if(res){
                              Navigator.pushNamed(context, AppRouterStrings.cekResetPasswordOtp,arguments: _pinEditingController.text.replaceFirst('0', '62'));
                            }else{
                              if(provider.errMessage != null){
                                EasyLoading.showError(provider.errMessage);
                              }else{
                                EasyLoading.showError('Maaf terjadi kesalahan, silahkan coba lagi');
                              }
                            }
                          } else {
                            if(_validate == false){
                              EasyLoading.showInfo(
                                  'username dan nomor hp tidak boleh kosong');
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