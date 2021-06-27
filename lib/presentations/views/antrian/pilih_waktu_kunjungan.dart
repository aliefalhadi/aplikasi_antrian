import 'package:aplikasi_antrian/configs/constants/view_state.dart';
import 'package:aplikasi_antrian/presentations/views/base_view.dart';
import 'package:aplikasi_antrian/providers/antrian_provider.dart';
import 'package:flutter/material.dart';

class PilihWaktuKunjungan extends StatelessWidget {
  final String idLayanan;
  const PilihWaktuKunjungan({Key key, this.idLayanan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AntrianProvider>(
      onModelReady: (model)=>model.getCekDaftarAntrian(idLayanan: idLayanan),
      builder: (context, provider, child){
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Pilih Waktu Kunjungan"),
          ),
          body:
          provider.state == ViewState.Fetching ?
              Center(child: CircularProgressIndicator(),)
              :
          provider.state == ViewState.FetchNull ?
          Center(child: Text("Maaf, antrian layanan tidak tersedia"),)
              :
          Container(
            padding: EdgeInsets.all(8),
            child: ListView.builder(
              itemCount: provider.cekDaftarAntrianModel.data.length,
              itemBuilder: (context, index){
                return  InkWell(
                  onTap: (){
                    Navigator.pop(context, {
                      'waktu_kunjungan' :provider.cekDaftarAntrianModel.data[index],
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
                      title: Text("Jam "+provider.cekDaftarAntrianModel.data[index]),
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
