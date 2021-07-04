import 'package:aplikasi_antrian/configs/constants/app_router_strings.dart';
import 'package:aplikasi_antrian/configs/constants/view_state.dart';
import 'package:aplikasi_antrian/configs/utils/convert_handlers.dart';
import 'package:aplikasi_antrian/presentations/views/base_view.dart';
import 'package:aplikasi_antrian/providers/antrian_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoriAntrian extends StatelessWidget {
  const HistoriAntrian({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AntrianProvider>(
      onModelReady: (model)=>model.getHistoriAntrian(),
      builder: (context, provider, child){
        return Scaffold(
          backgroundColor: Colors.white,
          body:
          provider.state == ViewState.Fetching ?
              Center(child: CircularProgressIndicator(),)
              :
          RefreshIndicator(
            onRefresh: ()=>provider.getHistoriAntrian(),
            child: Container(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: provider.daftarHistoriAntrianModel.data.length,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, AppRouterStrings.detailHistoriAntrian, arguments: provider.daftarHistoriAntrianModel.data[index].antrianOnline.aoId.toString());
                    },
                    child: Container(
                      margin: new EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      padding: EdgeInsets.all(10),
                      // child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Instansi: '+provider.daftarHistoriAntrianModel.data[index].instansi.namaInstansi),
                                Text('Layanan: '+provider.daftarHistoriAntrianModel.data[index].jenisLayanan.jlNama),
                                Text('Tanggal: '+ DateFormat('dd MMM yyyy').format(provider.daftarHistoriAntrianModel.data[index].antrian.antrianTgl)),
                                Text('Waktu: '+provider.daftarHistoriAntrianModel.data[index].antrianOnline.aoWaktu),
                                Text('Status: '+ConverHandlers().convertStatusAntrian(provider.daftarHistoriAntrianModel.data[index].antrian.antrianStatus.toString())),
                              ],
                            ),
                          ),

                          Column(
                            children: [
                              Image.asset(
                                'images/qrcode.png',
                                width: 80.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
