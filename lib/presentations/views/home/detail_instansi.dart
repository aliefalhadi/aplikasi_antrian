import 'package:aplikasi_antrian/configs/constants/view_state.dart';
import 'package:aplikasi_antrian/configs/themes/app_themes.dart';
import 'package:aplikasi_antrian/presentations/views/base_view.dart';
import 'package:aplikasi_antrian/providers/instansi_provider.dart';
import 'package:flutter/material.dart';

class DetailInstansi extends StatelessWidget {
  final String idInstansi;
  const DetailInstansi({Key key, this.idInstansi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<InstansiProvider>(
      onModelReady: (model) => model.getDetailInstansi(idInstansi),
      builder: (context, provider, child){
        return Scaffold(
          appBar: AppBar(
            title: Text("Detail Instansi"),
          ),
          body: Container(
            padding: EdgeInsets.all(16),
            child:
            provider.state == ViewState.Fetching ?
                Center(child: CircularProgressIndicator(),)
                :
            ListView(
              children: [
                Container(
                  child: Text(
                    provider.daftarLayananInstansiDetailModel.data.instansi.instansiNama,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, fontFamily: "Serif", fontWeight: FontWeight.bold),
                  ),),
                vSpace(8),
                Image.network('http://antrian-mpp.aiiviii.biz.id/images/'+provider.daftarLayananInstansiDetailModel.data.instansi.instansiLogo),
                _List(
                  icon: Icon(Icons.location_pin,color: Colors.green,),
                  title: "Alamat Kantor",
                  subtitle: provider.daftarLayananInstansiDetailModel.data.instansi.instansiAlamat,
                ),
                _List(
                  icon: Icon(Icons.call,color: Colors.green,),
                  title: "Telephone",
                  subtitle: provider.daftarLayananInstansiDetailModel.data.instansi.instansiTelp,
                ),
                _List(
                  icon: Icon(Icons.email,color: Colors.green,),
                  title: "Email",
                  subtitle: provider.daftarLayananInstansiDetailModel.data.instansi.instansiEmail,
                ),
                _List(
                  icon: Icon(Icons.web,color: Colors.green,),
                  title: "Website",
                  subtitle: provider.daftarLayananInstansiDetailModel.data.instansi.instansiUrl,
                ),
                vSpace(8),
                Text("Jenis Layanan", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),),
                vSpace(8),
                _ListLayanan(
                  provider: provider,
                ),

                vSpace(21),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ListLayanan extends StatelessWidget {
  final InstansiProvider provider;
  const _ListLayanan({
    Key key,
    this.provider
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(provider.daftarLayananInstansiDetailModel.data.layanan.length, (index){
        return Container(
          margin: EdgeInsets.only(bottom: 16),
          child: Text(provider.daftarLayananInstansiDetailModel.data.layanan[index].jlNama, style: TextStyle(
              fontSize: 16
          ),),
        );
      }),
    );
  }
}

class _List extends StatelessWidget {
  final Icon icon;
  final String title;
  final String subtitle;
  const _List({
    Key key,
    this.icon,
    this.title,
    this.subtitle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: icon,
          title: Text(title),
          subtitle: Text(subtitle),
        ),
        Divider(),
      ],
    );
  }
}
