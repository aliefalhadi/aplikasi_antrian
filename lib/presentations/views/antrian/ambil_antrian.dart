import 'package:aplikasi_antrian/configs/constants/app_router_strings.dart';
import 'package:aplikasi_antrian/configs/themes/app_themes.dart';
import 'package:aplikasi_antrian/configs/utils/validations.dart';
import 'package:aplikasi_antrian/presentations/views/base_view.dart';
import 'package:aplikasi_antrian/presentations/widgets/label_text_field.dart';
import 'package:aplikasi_antrian/providers/antrian_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AmbilAntrian extends StatefulWidget {
  const AmbilAntrian({Key key}) : super(key: key);

  @override
  _AmbilAntrianState createState() => _AmbilAntrianState();
}

class _AmbilAntrianState extends State<AmbilAntrian> {
  TextEditingController teInstansi = TextEditingController();
  TextEditingController teLayananInstansi = TextEditingController();
  TextEditingController teWaktuKunjungan = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    teInstansi.clear();
    teLayananInstansi.clear();
    teWaktuKunjungan.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<AntrianProvider>(
      builder: (context, provider, child){
        return Scaffold(
          key: _globalKey,
          appBar: AppBar(
            title: Text("Ambil Antrian Online MPP"),
          ),
          body: Container(
            padding: EdgeInsets.all(16),
            child: ListView(
              children: [
                Card(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LabelTextField(
                            label: "Pilih Instansi",
                          ),
                          TextFormField(
                            controller: teInstansi,
                            readOnly: true,
                            validator: (String value)=> Validations.stringNullValidation(value),
                            onTap: () async{
                              var instansi = await Navigator.pushNamed(context, AppRouterStrings.pilihInstansi);
                              if(instansi != null){
                                Map data = instansi;
                                setState(() {
                                  teInstansi.text = data['nama_instansi'];
                                  if(teLayananInstansi.text != ''){
                                    teLayananInstansi.text = '';
                                    provider.changedDataAntrian(field: 'id_layanan_instansi',value:  '');
                                  }
                                  provider.changedDataAntrian(field: 'id_instansi',value:  data['id_instansi'].toString());
                                });
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "Pilih instansi",
                                suffixIcon: Icon(Icons.arrow_drop_down_outlined)
                            ),
                          ),
                          LabelTextField(
                            label: "Pilih Layanan Instansi",
                          ),
                          TextFormField(
                            controller: teLayananInstansi,
                            readOnly: true,
                            validator: (String value)=> Validations.stringNullValidation(value),
                            decoration: InputDecoration(
                                hintText: "Pilih layanan instansi",
                                suffixIcon: Icon(Icons.arrow_drop_down_outlined)
                            ),
                            onTap: () async{
                              var layanan = await Navigator.pushNamed(context, AppRouterStrings.pilihLayananInstansi, arguments: provider.dataAntrian['id_instansi'].toString());
                              if(layanan != null){
                                Map data = layanan;
                                setState(() {
                                  teLayananInstansi.text = data['nama_layanan_instansi'];
                                  provider.changedDataAntrian(field: 'id_layanan_instansi',value:  data['id_layanan_instansi'].toString());
                                  if(teWaktuKunjungan.text != ''){
                                    teWaktuKunjungan.text = '';
                                    provider.changedDataAntrian(field: 'waktu_kunjungan',value:  '');
                                  }
                                });
                              }
                            },
                          ),
                          LabelTextField(
                            label: "Waktu Kunjungan",
                          ),
                          TextFormField(
                            controller: teWaktuKunjungan,
                            readOnly: true,
                            validator: (String value)=> Validations.stringNullValidation(value),
                            decoration: InputDecoration(
                                hintText: "Pilih waktu kunjungan",
                                suffixIcon: Icon(Icons.arrow_drop_down_outlined)
                            ),
                            onTap: () async{
                              var waktu = await Navigator.pushNamed(context, AppRouterStrings.pilihWaktuKunjungan, arguments: provider.dataAntrian['id_layanan_instansi'].toString());
                              if(waktu != null){
                                Map data = waktu;
                                setState(() {
                                  teWaktuKunjungan.text = data['waktu_kunjungan'];
                                  provider.changedDataAntrian(field: 'waktu_kunjungan',value:  data['waktu_kunjungan'].toString());
                                });
                              }
                            },
                          ),
                          vSpace(16),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: RaisedButton(
                              child: Text("KIRIM"),
                              onPressed: (){
                                if(_formKey.currentState.validate()){
                                  showDialog(
                                    context: _globalKey.currentContext,
                                    builder: (context){
                                      return AlertDialog(
                                        content: Text("Apakah anda yakin?"),
                                        actions: [
                                          FlatButton(
                                              child: Text("Tidak"),
                                              onPressed: (){
                                                Navigator.pop(_globalKey.currentContext);
                                              },
                                          ),
                                          FlatButton(
                                            child: Text("Ya"),
                                            onPressed: () async{
                                              Navigator.pop(_globalKey.currentContext);
                                              EasyLoading.show(status: "Loading...", maskType: EasyLoadingMaskType.black, dismissOnTap: false);
                                              bool res = await provider.postAmbilAntrian();
                                              EasyLoading.dismiss();
                                              if(res){
                                                Alert(
                                                  context: _globalKey.currentContext,
                                                  type: AlertType.success,
                                                  title: "Ambil Antrian Berhasil",
                                                  desc: "Silahkan scan nomor antrian pada menu histori antrian",
                                                  buttons: [
                                                    DialogButton(
                                                      child: Text(
                                                        "OK",
                                                        style: TextStyle(color: Colors.white, fontSize: 20),
                                                      ),
                                                      onPressed: () => Navigator.pushNamedAndRemoveUntil(_globalKey.currentContext, AppRouterStrings.home, (route) => false),
                                                      width: 120,
                                                    )
                                                  ],
                                                ).show();
                                              }else{
                                                EasyLoading.showToast("Ambil antrian gagal, silahkan coba lagi");
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
