import 'package:aplikasi_antrian/configs/constants/view_state.dart';
import 'package:aplikasi_antrian/presentations/views/base_view.dart';
import 'package:aplikasi_antrian/providers/antrian_provider.dart';
import 'package:flutter/material.dart';

class PilihLayananInstansi extends StatelessWidget {
  final String idInstansi;
  const PilihLayananInstansi({Key key, this.idInstansi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AntrianProvider>(
      onModelReady: (model)=>model.getDaftarLayananInstansi(idInstansi: idInstansi),
      builder: (context, provider, child){
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Pilih Layanan Instansi"),
          ),
          body:
          provider.state == ViewState.Fetching ?
              Center(child: CircularProgressIndicator(),)
              :
          Container(
            padding: EdgeInsets.all(8),
            child: ListView.builder(
              itemCount: provider.daftarLayananInstansiModel.data.length,
              itemBuilder: (context, index){
                return  InkWell(
                  onTap: (){
                    Navigator.pop(context, {
                      'id_layanan_instansi' :provider.daftarLayananInstansiModel.data[index].jlId,
                      'nama_layanan_instansi' :provider.daftarLayananInstansiModel.data[index].jlNama,
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.withOpacity(0.2))
                        )
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(provider.daftarLayananInstansiModel.data[index].jlNama),
                      trailing: Icon(Icons.arrow_forward_ios_sharp, size: 16,),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
