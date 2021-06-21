import 'package:aplikasi_antrian/configs/constants/app_router_strings.dart';
import 'package:aplikasi_antrian/configs/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_antrian/constants.dart';
import 'package:aplikasi_antrian/pages/login/register_view.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        Text("Login", style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.white),),
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
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "NIK KTP"
                    ),
                  ),
                  vSpace(8),
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: "Kata Sandi"
                    ),
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
                      onPressed: (){},
                    ),
                  ),
                  vSpace(16),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: OutlineButton(
                      child: Text("Daftar", style: TextStyle(color: Colors.green),),
                      onPressed: (){
                        Navigator.pushNamed(context, AppRouterStrings.register);
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
