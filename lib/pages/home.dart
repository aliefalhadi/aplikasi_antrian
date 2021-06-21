import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
// import 'package:aplikasi_antrian/home_app.dart';
// import 'home_app.dart';
import 'fasilitas.dart';
import 'antrian_online.dart';
import './antrian_online_add.dart';
import 'instansi.dart';
import 'guru.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  // Widget buildHomePage(String title) {
  Widget build(BuildContext context) {
//     return Scaffold(
//         body: new Container(
//             child: ListView(children: <Widget>[
//       Container(
//           // padding: EdgeInsets.all(10),
//           child: Row(children: <Widget>[
//         Container(
//           child: Image.asset('images/mpp1.jpg', width: 380),
//         ),
//       ])),
//       Container(
//           padding: EdgeInsets.all(10),
//           child: Row(children: <Widget>[
//             Container(
//               child: Text("Mall Pelayanan Publik Pekanbaru"),
//             ),
//           ]))
//     ])));
//   }
// }

// final titleText = Container(
//   padding: EdgeInsets.all(10),
//   child: Text(
//     'Mal Pelayanan Publik Pekanbaru',
//     style: TextStyle(
//       fontWeight: FontWeight.w600,
//       letterSpacing: 0.1,
//       fontSize: 18,
//       fontFamily: 'Times New Roman',
//     ),
//   ),
// );

    final pictures = Container(
      // padding: EdgeInsets.all(10),
      child: Image.asset(
        'images/mpp1.jpg',
        width: 360.0,
      ),
    );

    // final subTitle = Container(
    //   // color: Colors.green,
    //   margin: new EdgeInsets.all(12.0),
    //   decoration: BoxDecoration(
    //     color: Colors.grey[200],
    //     borderRadius: BorderRadius.circular(5.0),
    //   ),
    //   // child: Card(
    //   child: Text(
    //     'MPP dirancang oleh KEMEPAN RB dengan menggabungkan berbagai jenis pelayanan pada satu tempat, penyederhanaan dan prosedur serta integrasi pelayanan pada Mal Pelayanan Publik akan memudahkan akses masyarakat dalam mendapat berbagai jenis pelayanan, serta meningkatkan kepercayaan masyarakat kepada penyelenggara pelayanan publik',
    //     // textAlign: TextAlign.center,
    //     style: TextStyle(
    //       fontFamily: 'Times New Roman',
    //       fontSize: 13,
    //       letterSpacing: 0.5,
    //     ),
    //   ),
    //   // ),
    // );

    final descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w300,
      fontFamily: 'Times New Roman',
      letterSpacing: 0.5,
      fontSize: 13,
      height: 2,
    );

    final pictures1 = Container(
      // margin: new EdgeInsets.all(12.0),
      // padding: EdgeInsets.all(10),
      child: Image.asset(
        'images/alur.png',
        width: 380.0,
      ),
    );

    final FirstList = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container(
        margin: new EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.green[300],
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: EdgeInsets.all(10),
        // child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => InstansiScreen()));
                  },
                  child: Image.asset(
                    'images/apartment.png',
                    width: 60.0,
                  ),
                ),
                Text('Instansi'),
              ],
              // },
            ),
            //   ],
            // ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => FasilitasScreen()));
                  },
                  child: Image.asset(
                    'images/library.png',
                    width: 60.0,
                  ),
                ),
                Text('Fasilitas'),
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => AntrianOnlineAdd()));
                  },
                  child: Image.asset(
                    'images/qr.png',
                    width: 60.0,
                  ),
                ),
                Text('Antrian'),
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            AntrianOnlineScreen()));
                  },
                  child: Image.asset(
                    'images/list.png',
                    width: 60.0,
                  ),
                ),
                Text('Cek Antrian'),
              ],
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
          // titleText,
          pictures,
          pictures1,
          // subTitle,
          // ratings,
          FirstList,
          // SecondList,
        ],
      ),
    );

    return new Scaffold(
      // appBar: AppBar(
      // title: Text(title),
      backgroundColor: Colors.white,
      body: Container(
        child: leftColumn,
      ),
    );
  }
}

// // @override
// // Widget build(BuildContext context) {
// //   return MaterialApp(
// //     title: 'Flutter layout demo',
// //     home: buildHomePage('Antrian Online MPP'),
// //   );
// // }

// //   void tmpFunction() {
// //     @override
// //     Widget build(BuildContext context) {
// //       Navigator.push(
// //         context,
// //         MaterialPageRoute(builder: (context) => FasilitasScreen()),
// //       );
// //     }
// //   }
// // }
