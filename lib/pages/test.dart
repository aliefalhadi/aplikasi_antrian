import 'package:flutter/material.dart';
// import 'package:aplikasi_antrian/home_app.dart';
// import 'home_app.dart';
import 'fasilitas.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key key}) : super(key: key);

// @override
// Widget build(BuildContext context) {
//   return new FutureBuilder(
//     initialData: "Loading text..",
//     builder: (BuildContext context, AsyncSnapshot<String> text) {
//       return new Scaffold(
//         backgroundColor: Colors.white,
// body: Column(
//   children: <Widget>[
//     Text(
//       'Tentang Mal Pelayanan Publik Pekanbaru',
//       style: TextStyle(fontSize: 15, fontFamily: "Times New Roman"),
//     ),
//     Image.asset('images/mpp1.jpg'),
//     Text(
//       'MPP dirancang oleh KEMEPAN RB sebagai bagian dari perbaikan menyeluruh dan transformasi tata kelola pelayanan publik. Menggabungkan berbagai jenis pelayanan pada satu tempat, penyederhanaan dan prosedur serta integrasi pelayanan pada Mal Pelayanan Publik akan memudahkan akses masyarakat dalam mendapat berbagai jenis pelayanan, serta meningkatkan kepercayaan masyarakat kepada penyelenggara pelayanan publik',
//       style: TextStyle(
//         fontSize: 13,
//         fontFamily: "Times New Roman",
//       ),
//     ),

// body: Container(
//   padding: EdgeInsets.all(2.0),
//   child:
//    Row(
//         children: [
//           Text('khika'),
//         ],
//       ),
//   Row(
//     // mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Column(
//         children: [
//           Text('khika'),
//         ],
//       ),
//     ],
//   ),
//       Column(
//         children: [
// GridView.count(
//   crossAxisCount: 2,
//   children: <Widget>[
//     MyMenu(
//       title: "Instansi & Layanan",
//       icon: Icons.apartment,
//       warna: Colors.blueGrey,
//       //screen: GuruScreen(),
//     ),
//     MyMenu(
//       title: "Fasilitas",
//       icon: Icons.library_books,
//       warna: Colors.blueGrey,
//       screen: FasilitasScreen(),
//     ),
//     MyMenu(
//       title: "Antrian Online",
//       icon: Icons.qr_code,
//       warna: Colors.blueGrey,
//       //screen: AbsenMasukScreen(),
//     ),
//     MyMenu(
//       title: "Cek Antrian",
//       icon: Icons.format_list_numbered,
//       warna: Colors.blueGrey,
//       //screen: MyApp(),
//     )
//   ],
// ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   },
// );
//   }
// }

// class MyMenu extends StatefulWidget {
//   MyMenu({this.title, this.icon, this.warna, this.screen});

//   final IconData icon;
//   final Widget screen;
//   final String title;
//   final MaterialColor warna;

//   @override
//   _MyMenuState createState() => _MyMenuState();
// }

// class _MyMenuState extends State<MyMenu> {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(5.0),
//       child: InkWell(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => widget.screen),
//           );
//         },
//         splashColor: widget.warna,
//         child: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               Icon(
//                 widget.icon,
//                 color: widget.warna,
//                 size: 70.0,
//               ),
//               Text(widget.title,
//                   style: new TextStyle(fontSize: 17.0, color: widget.warna))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//     }
