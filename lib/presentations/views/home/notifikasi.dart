import 'package:aplikasi_antrian/configs/constants/app_router_strings.dart';
import 'package:aplikasi_antrian/configs/constants/view_state.dart';
import 'package:aplikasi_antrian/configs/themes/app_themes.dart';
import 'package:aplikasi_antrian/presentations/views/base_view.dart';
import 'package:aplikasi_antrian/providers/notifikasi_provider.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Center(
    //     child: Text('Welcome to Notifications!'),
    //   ),
    // );
    final descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w300,
      fontFamily: 'Times New Roman',
      letterSpacing: 0.5,
      fontSize: 13,
      height: 2,
    );

    final FirstList = DefaultTextStyle.merge(
      style: descTextStyle,
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
            Column(
              children: [
                Image.asset(
                  'images/bell.png',
                  width: 40.0,
                ),
              ],
            ),
            Column(
              children: [
                Text('Silahkan datang ke Mal Pelayanan Publik'),
                Text('Pekanbaru pada pukul 09.00 WIB'),
              ],
            ),
            Column(
              children: [],
            ),
            Column(
              children: [],
            ),
          ],
        ),
      ),
      // ),
    );

    final SecondList = DefaultTextStyle.merge(
      style: descTextStyle,
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
            Column(
              children: [
                Image.asset(
                  'images/bell.png',
                  width: 40.0,
                ),
              ],
            ),
            Column(
              children: [
                Text('Lakukan scan nomor antrian anda'),
                Text('untuk dapat melakukan pelayanan'),
              ],
            ),
            Column(
              children: [],
            ),
            Column(
              children: [],
            ),
          ],
        ),
      ),
      // ),
    );

    final ThirdList = DefaultTextStyle.merge(
      style: descTextStyle,
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
            Column(
              children: [
                Image.asset(
                  'images/bell.png',
                  width: 40.0,
                ),
              ],
            ),
            Column(
              children: [
                Text('Waktu anda tersisa 10 menit lagi untuk'),
                Text('dapat melakukan scan nomor antrian'),
              ],
            ),
            Column(
              children: [],
            ),
            Column(
              children: [],
            ),
          ],
        ),
      ),
      // ),
    );

    final FourthList = DefaultTextStyle.merge(
      style: descTextStyle,
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
            Column(
              children: [
                Image.asset(
                  'images/bell.png',
                  width: 40.0,
                ),
              ],
            ),
            Column(
              children: [
                Text('Waktu anda habis. Silahkan ambil'),
                Text('nomor antrian pada mesin antrian'),
              ],
            ),
            Column(
              children: [],
            ),
            Column(
              children: [],
            ),
          ],
        ),
      ),
      // ),
    );

    final leftColumn = Container(
      // padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Column(
        children: [
          FirstList,
          SecondList,
          ThirdList,
          FourthList,
          // FifthList,
        ],
      ),
    );

    return BaseView<NotifikasiProvider>(
      onModelReady: (model)=>model.getDaftarNotifikasi(),
      builder: (context, provider, child){
        return Scaffold(
          backgroundColor: Colors.white,
          body:
          provider.state == ViewState.Fetching ?
              Center(child: CircularProgressIndicator(),)
              :
          provider.state == ViewState.FetchNull ?
          Center(child: Text("Belum ada notifikasi terbaru"),)
              :
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: ListView.builder(
              itemCount: provider.daftarNotifikasiModel.data.length,
              itemBuilder: (context, index){
                return InkWell(
                  onTap: () async{
                    await provider.bacaNotif(provider.daftarNotifikasiModel.data[index].id.toString());
                    Navigator.pushNamed(context, AppRouterStrings.detailHistoriAntrian, arguments: provider.daftarNotifikasiModel.data[index].keterangan.toString()).then((value) => provider.getDaftarNotifikasi());
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
                        Image.asset(
                          'images/bell.png',
                          width: 40.0,
                        ),
                        hSpace(8),
                        Expanded(
                          child: Container(
                            child: Text(provider.daftarNotifikasiModel.data[index].notifikasi, textAlign: TextAlign.center,),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          ),
        );
      },
    );
  }
}
