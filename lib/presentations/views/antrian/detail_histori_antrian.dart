import 'package:aplikasi_antrian/configs/constants/view_state.dart';
import 'package:aplikasi_antrian/configs/themes/app_themes.dart';
import 'package:aplikasi_antrian/configs/utils/convert_handlers.dart';
import 'package:aplikasi_antrian/presentations/views/base_view.dart';
import 'package:aplikasi_antrian/providers/antrian_provider.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailHistoriAntrian extends StatelessWidget {
  final String idAntrian;
  const DetailHistoriAntrian({Key key, this.idAntrian}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AntrianProvider>(
      onModelReady: (model)=> model.getDetailHistoriAntrian(idAntrian),
      builder: (context, provider, child){
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Detail Antrian"),
          ),
          body:
          provider.state == ViewState.Fetching ?
              Center(child: CircularProgressIndicator(),)
              :
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey.withOpacity(0.2))
                      )
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Instansi", style: TextStyle(fontSize: 14, color: Colors.grey),),
                    subtitle: Text(provider.detailHistoriAntrianModel.data.instansi.namaInstansi, style: TextStyle(fontSize: 16,color: Colors.black)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey.withOpacity(0.2))
                      )
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Layanan", style: TextStyle(fontSize: 14, color: Colors.grey),),
                    subtitle: Text(provider.detailHistoriAntrianModel.data.jenisLayanan.jlNama, style: TextStyle(fontSize: 16,color: Colors.black)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey.withOpacity(0.2))
                      )
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Tanggal", style: TextStyle(fontSize: 14, color: Colors.grey),),
                    subtitle: Text(DateFormat('dd MMM yyyy').format(provider.detailHistoriAntrianModel.data.antrian.antrianTgl), style: TextStyle(fontSize: 16,color: Colors.black)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey.withOpacity(0.2))
                      )
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Waktu Kunjungan", style: TextStyle(fontSize: 14, color: Colors.grey),),
                    subtitle: Text(provider.detailHistoriAntrianModel.data.antrianOnline.aoWaktu, style: TextStyle(fontSize: 16,color: Colors.black)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey.withOpacity(0.2))
                      )
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Status", style: TextStyle(fontSize: 14, color: Colors.grey),),
                    subtitle: Text(ConverHandlers().convertStatusAntrian(provider.detailHistoriAntrianModel.data.antrian.antrianStatus.toString()), style: TextStyle(fontSize: 16,color: Colors.black)),
                  ),
                ),
                vSpace(16),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  padding: EdgeInsets.all(8),
                  child: Text("Silahkan datang tepat waktu sesuai jam kunjungan anda dan scan qrcode di bawah ini.", style: TextStyle(color: Colors.white),),
                ),
                vSpace(32),
                BarcodeWidget(
                  barcode: Barcode.qrCode(),
                  data: "Hello word",
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
