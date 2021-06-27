import 'package:aplikasi_antrian/configs/constants/app_router_strings.dart';
import 'package:aplikasi_antrian/configs/themes/app_themes.dart';
import 'package:aplikasi_antrian/configs/utils/validations.dart';
import 'package:aplikasi_antrian/presentations/views/base_view.dart';
import 'package:aplikasi_antrian/presentations/widgets/label_text_field.dart';
import 'package:aplikasi_antrian/providers/antrian_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CekAntrian extends StatefulWidget {
  const CekAntrian({Key key}) : super(key: key);

  @override
  _CekAntrianState createState() => _CekAntrianState();
}

class _CekAntrianState extends State<CekAntrian> {
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
            title: Text("Cek Antrian Online MPP"),
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
                                    provider.changedDataCekAntrian(field: 'id_layanan_instansi',value:  '');
                                  }
                                  provider.changedDataCekAntrian(field: 'id_instansi',value:  data['id_instansi'].toString());
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
                              var layanan = await Navigator.pushNamed(context, AppRouterStrings.pilihLayananInstansi, arguments: provider.dataCekAntrian['id_instansi'].toString());
                              if(layanan != null){
                                Map data = layanan;
                                setState(() {
                                  teLayananInstansi.text = data['nama_layanan_instansi'];
                                  provider.changedDataCekAntrian(field: 'id_layanan_instansi',value:  data['id_layanan_instansi'].toString());
                                });
                              }
                            },
                          ),
                          vSpace(16),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: RaisedButton(
                              child: Text("KIRIM"),
                              onPressed: () async{
                                if(_formKey.currentState.validate()){
                                  EasyLoading.show(status: "Loading...", maskType: EasyLoadingMaskType.black, dismissOnTap: false);
                                  var res = await provider.postCekAntrianAktif();
                                  EasyLoading.dismiss();


                                    Alert(
                                      context: _globalKey.currentContext,
                                      type: AlertType.none,
                                      image: Image.asset('images/logo.png'),
                                      title: "",
                                      content: Column(
                                        children: [
                                          Image.asset('images/logo.png',width: 150,),
                                          vSpace(16),
                                          Text("Antrian yang belum dilayani", style: TextStyle(fontWeight: FontWeight.normal),),
                                          vSpace(8),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Loket", style: TextStyle(fontWeight: FontWeight.bold),),
                                              Text("No Antrian", style: TextStyle(fontWeight: FontWeight.bold)),
                                            ],
                                          ),
                                          vSpace(8),
                                          res == null ?
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text("Belum ada antrian", style: TextStyle(color: Colors.grey, fontSize: 16),)
                                                ],
                                              )
                                              :
                                          Column(
                                            children: List.generate(provider.daftarAntrianAktifModel.data.length, (index){
                                              return Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text("Loket "+provider.daftarAntrianAktifModel.data[index].antrianLoket),
                                                  Text(provider.daftarAntrianAktifModel.data[index].antrianNo.toString()),
                                                ],
                                              );
                                            }),
                                          )
                                        ],
                                      ),
                                      buttons: [
                                        DialogButton(
                                          child: Text(
                                            "OK",
                                            style: TextStyle(color: Colors.white, fontSize: 20),
                                          ),
                                          onPressed: () => Navigator.pop(_globalKey.currentContext),
                                          width: 120,
                                        )
                                      ],
                                    ).show();

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
