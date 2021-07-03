import 'package:aplikasi_antrian/configs/constants/app_router_strings.dart';
import 'package:aplikasi_antrian/configs/constants/view_state.dart';
import 'package:aplikasi_antrian/configs/themes/app_themes.dart';
import 'package:aplikasi_antrian/configs/utils/validations.dart';
import 'package:aplikasi_antrian/presentations/views/base_view.dart';
import 'package:aplikasi_antrian/presentations/widgets/label_text_field.dart';
import 'package:aplikasi_antrian/providers/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileProvider>(
      onModelReady: (model)=>model.getDetailUser(),
      builder: (context, provider, child){
        return
          provider.state == ViewState.Fetching ?
              Center(child: CircularProgressIndicator(),)
              :
          Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                LabelTextField(label: "NIK"),
                TextFormField(
                  initialValue: provider.dataUser['nik'],
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      hintText: "NIK"
                  ),
                  validator: (String value)=> Validations.stringNullValidation(value),
                  onChanged: (value) => provider.changedDataUser(field: 'nik', value: value),
                ),

                LabelTextField(label: "Nomor Kartu Keluarga"),
                TextFormField(
                  initialValue: provider.dataUser['no_kk'],
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      hintText: "Nomor Kartu Keluarga"
                  ),
                  validator: (String value)=> Validations.stringNullValidation(value),
                  onChanged: (value) => provider.changedDataUser(field: 'no_kk', value: value),
                ),

                LabelTextField(label: "Nama Lengkap"),
                TextFormField(
                  initialValue: provider.dataUser['nama'],
                  decoration: InputDecoration(
                      hintText: "Nama Lengkap"
                  ),
                  validator: (String value)=> Validations.stringNullValidation(value),
                  onChanged: (value) => provider.changedDataUser(field: 'nama', value: value),
                ),

                LabelTextField(label: "Nomor Handphone"),
                TextFormField(
                  initialValue: provider.dataUser['no_hp'],
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      hintText: "Nomor Handphone"
                  ),
                  validator: (String value)=> Validations.stringNullValidation(value),
                  onChanged: (value) => provider.changedDataUser(field: 'no_hp', value: value),
                ),

                LabelTextField(label: "Email"),
                TextFormField(
                  initialValue: provider.dataUser['email'],
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Email"
                  ),
                  validator: (String value)=> Validations.stringNullValidation(value),
                  onChanged: (value) => provider.changedDataUser(field: 'email', value: value),
                ),

                LabelTextField(label: "Alamat"),
                TextFormField(
                  initialValue: provider.dataUser['alamat'],
                  decoration: InputDecoration(
                      hintText: "Alamat"
                  ),
                  validator: (String value)=> Validations.stringNullValidation(value),
                  onChanged: (value) => provider.changedDataUser(field: 'alamat', value: value),
                ),
                vSpace(16),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    child: Text("SIMPAN"),
                    onPressed: (){
                      if(_formKey.currentState.validate()){
                        showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                content: Text("Apakah anda yakin?"),
                                actions: [
                                  FlatButton(
                                    child: Text("Tidak"),
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                  ),
                                  FlatButton(
                                    child: Text("Ya"),
                                    onPressed: () async{
                                      Navigator.pop(context);
                                      EasyLoading.show(status: "Loading...", maskType: EasyLoadingMaskType.black, dismissOnTap: false);
                                      bool res = await provider.postEditDataUser();
                                      EasyLoading.dismiss();
                                      if(res){
                                        EasyLoading.showToast("Edit data berhasil");
                                      }else{
                                        EasyLoading.showToast("Edit data gagal, silahkan coba lagi");
                                      }
                                    },
                                  )
                                ],
                              );
                            }
                        );
                      }
                    },
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
