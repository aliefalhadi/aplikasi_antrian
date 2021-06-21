import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/guru_model.dart';
import '../providers/guru_provider.dart';
// import './guru_add.dart';
// import './guru_edit.dart';

// void main() => runApp(GuruScreen());

class GuruScreen extends StatelessWidget {
//DUMMY DATA YANG AKAN DITAMPILKAN SEBELUM MELAKUKAN HIT KE API
  //ADAPUN FORMAT DATANYA MENGIKUTI STRUKTU YANG SUDAH DITETAPKAN PADA EMPLOYEEMODEL
  final data = [
    GuruModel(
      idGuru: "1",
      nip: "1151101010",
      namaGuru: "Tiger Nixon",
    ),
    GuruModel(
      idGuru: "2",
      nip: "11151101693",
      namaGuru: "Yura",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guru'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: Text('+'),
        onPressed: () {
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => GuruAdd()));
        },
      ),
      //ADAPUN UNTUK LOOPING DATA PEGAWAI, KITA GUNAKAN LISTVIEW BUILDER
      //KARENA WIDGET INI SUDAH DILENGKAPI DENGAN FITUR SCROLLING
      body: RefreshIndicator(
        onRefresh: () =>
            Provider.of<GuruProvider>(context, listen: false).getGuru(),
        color: Colors.red,
        child: Container(
          margin: EdgeInsets.all(10),
          child: FutureBuilder(
            future: Provider.of<GuruProvider>(context, listen: false).getGuru(),
            builder: (BuildContext context2, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Consumer<GuruProvider>(
                builder: (context, data, _) {
                  return ListView.builder(
                    itemCount: data.dataGuru.length,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => GuruEdit(
                          //       id: data.dataGuru[i].idGuru,
                          //     ),
                          //   ),
                          // );
                        },
                        child: Dismissible(
                          key: UniqueKey(),
                          direction: DismissDirection.endToStart,
                          confirmDismiss: (DismissDirection direction) async {
                            final bool res = await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Konfirmasi'),
                                    content: Text('Kamu Yakin?'),
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(true),
                                        child: Text('HAPUS'),
                                      ),
                                      FlatButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(false),
                                        child: Text('BATALKAN'),
                                      )
                                    ],
                                  );
                                });
                            return res;
                          },
                          onDismissed: (value) {
                            Provider.of<GuruProvider>(context, listen: false)
                                .deleteGuru(data.dataGuru[i].idGuru);
                          },
                          child: Card(
                            elevation: 8,
                            child: ListTile(
                              title: Text(
                                data.dataGuru[i].namaGuru,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('NIP: ${data.dataGuru[i].nip}'),
                              trailing: Text("\$${data.dataGuru[i].namaGuru}"),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
      // body: ListView.builder(
      //   itemCount: data.length, //MENGHITUNG JUMLAH DATA YANG AKAN DITAMPILKAN
      //   //LOOPING DATA
      //   itemBuilder: (context, i) {
      //     //KEMUDIAN TAMPILKAN DATA PEGAWAI BERDASARKAN INDEX YANG DISIMPAN DI DALAM VARIABLE I
      //     return Card(
      //       elevation: 8,
      //       child: ListTile(
      //         title: Text(
      //           data[i].namaGuru,
      //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //         ),
      //         subtitle: Text('NIP: ${data[i].nip}'),
      //         trailing: Text("\$${data[i].namaGuru}"),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
