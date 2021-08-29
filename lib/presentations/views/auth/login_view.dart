import 'package:aplikasi_antrian/configs/constants/app_router_strings.dart';
import 'package:aplikasi_antrian/configs/themes/app_themes.dart';
import 'package:aplikasi_antrian/configs/utils/validations.dart';
import 'package:aplikasi_antrian/presentations/views/base_view.dart';
import 'package:aplikasi_antrian/providers/auth/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_antrian/constants.dart';
import 'package:aplikasi_antrian/pages/login/register_view.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  bool isSecurePass = true;
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginProvider>(
      builder: (context, provider, child){
        return Scaffold(
          key: _globalKey,
          backgroundColor: Colors.white,
          body: Container(
            child: ListView(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset("images/logo.png" ,height: 250,),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: Column(
                          children: [
                            Text("LOGIN", style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.black),),
                            vSpace(16),
                            Text(
                              "Silahkan login dengan akun yang telah terdaftar pada aplikasi antrian online",
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person, color: Colors.green,),
                              hintText: "NIK KTP"
                          ),
                          validator: (String value)=> Validations.stringNullValidation(value),
                          onChanged: (value) => provider.changedDataRegister(field: 'nik', value: value),
                        ),
                        vSpace(8),
                        TextFormField(
                          obscureText: isSecurePass,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock, color: Colors.green,),
                              hintText: "Kata Sandi",
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isSecurePass
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.green,
                                ),
                                onPressed: (){
                                  setState(() {
                                    isSecurePass = !isSecurePass;
                                  });
                                },
                              )
                          ),
                          validator: (String value)=> Validations.stringNullValidation(value),
                          onChanged: (value) => provider.changedDataRegister(field: 'password', value: value),
                        ),
                        vSpace(8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlatButton(
                                padding: EdgeInsets.zero,
                                onPressed: (){},
                                child: Text("Lupa Kata Sandi?")
                            )
                          ],
                        ),
                        vSpace(16),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: RaisedButton(
                            child: Text("Masuk"),
                            onPressed: () async{
                              FocusScope.of(context).unfocus();
                              if(_formKey.currentState.validate()){
                                EasyLoading.show(status:'Loading...', dismissOnTap: false,maskType: EasyLoadingMaskType.black);
                                bool res = await provider.loginWithCredentials();
                                EasyLoading.dismiss();
                                if(res){
                                  Navigator.pushNamedAndRemoveUntil(_globalKey.currentContext, AppRouterStrings.home, (route) => false);
                                }else{
                                  EasyLoading.showToast("Login gagal, silahkan coba lagi");
                                }
                              }
                            },
                          ),
                        ),
                        vSpace(16),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: OutlineButton(
                            child: Text("Daftar", style: TextStyle(color: Colors.green),),
                            onPressed: (){
                              Navigator.pushNamed(context, AppRouterStrings.registerNoHp);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
