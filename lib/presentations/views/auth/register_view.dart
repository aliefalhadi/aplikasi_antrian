import 'package:aplikasi_antrian/configs/themes/app_themes.dart';
import 'package:aplikasi_antrian/configs/utils/validations.dart';
import 'package:aplikasi_antrian/presentations/views/base_view.dart';
import 'package:aplikasi_antrian/presentations/widgets/label_text_field.dart';
import 'package:aplikasi_antrian/providers/auth/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_antrian/constants.dart';
import 'package:aplikasi_antrian/pages/login/register_view.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordTE;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordTE = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    passwordTE.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterProvider>(
      builder: (context, provider, child){
        return  Scaffold(
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
                        LabelTextField(label: "NIK KTP",),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Nomor Induk Kependudukan"
                          ),
                          validator: (String value)=> Validations.stringNullValidation(value),
                        ),
                        LabelTextField(label: "Nama Lengkap",),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Nama Lengkap"
                          ),
                          validator: (String value)=> Validations.stringNullValidation(value),
                        ),
                        LabelTextField(label: "Nomor Handphone",),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Nomor Handphone"
                          ),
                          validator: (String value)=> Validations.stringNullValidation(value),
                        ),
                        LabelTextField(label: "Email",),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Email"
                          ),
                          validator: (String value)=> Validations.stringNullValidation(value),
                        ),
                        LabelTextField(label: "Kata Sandi",),
                        TextFormField(
                          controller: passwordTE,
                          decoration: InputDecoration(
                              hintText: "Kata Sandi"
                          ),
                          validator: (String value)=> Validations.stringNullValidation(value),
                        ),

                        LabelTextField(label: "Ulangi Kata Sandi",),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Ulangi Kata Sandi"
                          ),
                          validator: (String value)=> Validations.ulangiPasswordValidation(
                              valueParent: passwordTE.text,
                              value: value
                          ),
                        ),

                        vSpace(16),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: RaisedButton(
                            child: Text("Daftar"),
                            onPressed: (){
                              if(_formKey.currentState.validate()){

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
