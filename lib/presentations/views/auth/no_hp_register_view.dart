import 'package:aplikasi_antrian/configs/constants/app_router_strings.dart';
import 'package:aplikasi_antrian/configs/themes/app_colors.dart';
import 'package:aplikasi_antrian/presentations/views/base_view.dart';
import 'package:aplikasi_antrian/providers/auth/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class NoHpRegisterView extends StatefulWidget {
  @override
  _NoHpRegisterViewState createState() => _NoHpRegisterViewState();
}

class _NoHpRegisterViewState extends State<NoHpRegisterView> {
  /// Control the input text field.
  TextEditingController _pinEditingController = TextEditingController();

  bool isCodeSent = false;

  TextEditingController te;
  final _focusNode = FocusNode();
  bool _validate = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    te = TextEditingController();
    _focusNode.addListener(() {
      if(_focusNode.hasFocus == false){
        String nomorValidation = validationInput2(te.text);
        if(nomorValidation == null){
          setState(() {
            _validate = true;
          });
        }else{
          setState(() {
            te.text = nomorValidation;
          });
        }
      }
    });
  }

  String validationInput2(String value){
    if (value.isEmpty) {
      return null;
    }
    String awal = value[0];
    if(awal == '0'){
      if(value.length >= 11 && value.length <=13){
        return value;
      }else{
        return null;
      }
    }else{
      if(value.length > 10){
        String awal = value.substring(0,2);
        if(awal == '62'){
          String text =  value;
          if(text[2] != '8'){
            text = text.replaceFirst(value[2], '');
          }
          text = text.replaceFirst('62', '0');
          if(text.length >= 11 && text.length <=13){
            return text;
          }
        }
      }
    }
    return null;
  }

  void validationInput(String value){
    if(value.isEmpty){
      setState(() {
        _validate = true;
      });
    }else{
      if(_validate){
        setState(() {
          _validate = false;
        });
      }
    }
  }

//  controller input

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterProvider>(
      builder: (context, RegisterProvider provider, child) {
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
                                      "Verifikasi Nomor Telepon",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 18,
                                    ),
                                    Text(
                                      "Harap Masukkan Nomor Telepon Anda",
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
                        TextFormField(
                          controller: te,
                          keyboardType: TextInputType.phone,
                          focusNode: _focusNode,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone_android,
                              color: primaryColor,
                            ),
                            labelStyle: TextStyle(color: primaryColor),
                            labelText: "Nomor Telepon/HP",
                            hintText: "Masukkan nomor hp \"082xx...\"",
                            errorText: _validate ? 'Format nomor anda salah' : null,),
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
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(30),
                    padding: EdgeInsets.symmetric(),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.4,
                      child: RaisedButton(
                        padding: EdgeInsets.all(16),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        color: primaryColor,
                        child: Text(
                          "Kirim kode",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async{
                          FocusScope.of(context).unfocus();
                          await Future.delayed(Duration(seconds: 0));
                          if(te.text.isNotEmpty && _validate == false){
                            provider.saveNo(te.text);

                            String nomorHp = te.text.replaceFirst('0', '62');
                            Navigator.pushNamed(context, AppRouterStrings.registerOtp,arguments:nomorHp);
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