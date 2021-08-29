import 'package:aplikasi_antrian/configs/constants/view_state.dart';
import 'package:aplikasi_antrian/configs/themes/app_themes.dart';
import 'package:aplikasi_antrian/configs/utils/validations.dart';
import 'package:aplikasi_antrian/presentations/views/base_view.dart';
import 'package:aplikasi_antrian/presentations/widgets/label_text_field.dart';
import 'package:aplikasi_antrian/providers/auth/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_antrian/constants.dart';
import 'package:aplikasi_antrian/pages/login/register_view.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  bool isSecurePass = true;
  bool isSecureUlangiPass = true;
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  String nom;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterProvider>(
      onModelReady: (model) => model.init(),
      builder: (context, provider, child){
        return  Scaffold(
          key: _globalKey,
          backgroundColor: Colors.white,
          body: provider.state == ViewState.Fetching ?
              Center(child: CircularProgressIndicator(),)
              :
          Container(
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
                            Text("Registrasi Akun", style: Theme.of(context).textTheme.headline5,),
                            vSpace(16),
                            Text(
                              "Silahkan daftar untuk dapat menggunakan aplikasi antrian online",
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LabelTextField(label: "Nomor KK",),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              hintText: "Nomor kartu Keluarga"
                          ),
                          validator: (String value) => Validations.stringNullValidation(value),
                          onChanged: (value) => provider.changedDataRegister(field: 'no_kk', value: value),
                        ),
                        LabelTextField(label: "NIK KTP",),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              hintText: "Nomor Induk Kependudukan"
                          ),
                          validator: (String value)=> Validations.stringNullValidation(value),
                          onChanged: (value) => provider.changedDataRegister(field: 'nik', value: value),
                        ),
                        LabelTextField(label: "Nama Lengkap",),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Nama Lengkap"
                          ),
                          validator: (String value)=> Validations.stringNullValidation(value),
                          onChanged: (value) => provider.changedDataRegister(field: 'nama', value: value),
                        ),
                        LabelTextField(label: "Alamat",),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Alamat"
                          ),
                          validator: (String value)=> Validations.stringNullValidation(value),
                          onChanged: (value) => provider.changedDataRegister(field: 'alamat', value: value),
                        ),
                        LabelTextField(label: "Nomor Handphone",),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          initialValue: provider.dataRegister['no_hp'],
                          readOnly: true,
                          decoration: InputDecoration(
                              hintText: "Nomor Handphone"
                          ),
                          validator: (String value)=> Validations.stringNullValidation(value),
                          onChanged: (value) => provider.changedDataRegister(field: 'no_hp', value: value),
                        ),
                        LabelTextField(label: "Email",),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: "Email"
                          ),
                          validator: (String value)=> Validations.stringNullValidation(value),
                          onChanged: (value) => provider.changedDataRegister(field: 'email', value: value),
                        ),
                        LabelTextField(label: "Kata Sandi",),
                        TextFormField(
                          obscureText: isSecurePass,
                          decoration: InputDecoration(
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

                        LabelTextField(label: "Ulangi Kata Sandi",),
                        TextFormField(
                          obscureText: isSecureUlangiPass,
                          decoration: InputDecoration(
                              hintText: "Ulangi Kata Sandi",
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isSecureUlangiPass
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.green,
                                ),
                                onPressed: (){
                                  setState(() {
                                    isSecureUlangiPass = !isSecureUlangiPass;
                                  });
                                },
                              )
                          ),
                          validator: (String value)=> Validations.ulangiPasswordValidation(
                              valueParent: provider.dataRegister['password'],
                              value: value
                          ),
                        ),

                        vSpace(16),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: RaisedButton(
                            child: Text("Daftar"),
                            onPressed: () async{
                              FocusScope.of(context).unfocus();
                              if(_formKey.currentState.validate()){
                                EasyLoading.show(status:'Loading...', dismissOnTap: false,maskType: EasyLoadingMaskType.black);
                                bool res = await provider.registerWithCredentials();
                                EasyLoading.dismiss();
                                if(res){
                                  Alert(
                                    context: _globalKey.currentContext,
                                    type: AlertType.success,
                                    title: "Registrasi Akun Berhasil",
                                    desc: "Silahkan login menggunakan nik dan password yang telah didaftarkan",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "Login",
                                          style: TextStyle(color: Colors.white, fontSize: 20),
                                        ),
                                        onPressed: () => Navigator.popUntil(_globalKey.currentContext, (route) => route.isFirst),
                                        width: 120,
                                      )
                                    ],
                                  ).show();
                                }else{
                                  EasyLoading.showToast("Registrasi akun gagal, silahkan coba lagi");
                                }
                              }
                            },
                          ),
                        ),
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
