import 'package:flutter/material.dart';
import 'home.dart';
import 'history.dart';
import 'notifikasi.dart';
import 'account.dart';
import 'package:aplikasi_antrian/home_app.dart';

class FasilitasScreen extends StatelessWidget {
  final PageStorageBucket _bucket = PageStorageBucket();
  final List<PageItem> _items = [
    PageItem('Home', Icons.home, HomeScreen(key: PageStorageKey('key--home'))),
    PageItem('History', Icons.history,
        HistoryScreen(key: PageStorageKey('key--history'))),
    PageItem('Notifications', Icons.notifications,
        NotificationsScreen(key: PageStorageKey('key--notifications'))),
    PageItem('Account', Icons.account_circle,
        AccountScreen(key: PageStorageKey('key--account'))),
  ];

  int _activeScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Antrian Online MPP'),
      ),
      // return Scaffold(
      //   body: new Container(
      //       child: ListView(children: <Widget>[
      // body: Container(
      //   child: Row(
      //     children: <Widget>[
      //       Align(
      //         alignment: Alignment.topCenter,
      //         child: Text(
      //           "Fasilitas yang ada di MPP Kota Pekanbaru",
      //           style: TextStyle(
      //             fontSize: 17,
      //             fontFamily: "Times New Roman",
      //           ),
      //         ),
      //       ),
      //     ],
      //   )
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
        Text(
          'Fasilitas yang ada di MPP Kota Pekanbaru',
          style: TextStyle(fontSize: 17, fontFamily: "Serif"),
        ),
        // Image.asset('images/mpp1.jpg'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              'images/anak.jpg',
              width: 150,
              height: 150,
            ),
            Image.asset(
              'images/ibu.jpg',
              width: 150,
              height: 150,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Ruang Bermain Anak',
              style: TextStyle(fontSize: 12, fontFamily: "Serif"),
            ),
            Text(
              'Ruang Menyusui',
              style: TextStyle(fontSize: 12, fontFamily: "Serif"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              'images/disabilitas.jpg',
              width: 150,
              height: 150,
            ),
            Image.asset(
              'images/perbankan.jpg',
              width: 150,
              height: 150,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Fasilitas Disabilitas',
              style: TextStyle(fontSize: 12, fontFamily: "Serif"),
            ),
            Text(
              'Fasilitas Perbankan',
              style: TextStyle(fontSize: 12, fontFamily: "Serif"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              'images/layananmandiri.jpg',
              width: 150,
              height: 150,
            ),
            Image.asset(
              'images/digital_library.jpeg',
              width: 150,
              height: 150,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Layanan Mandiri',
              style: TextStyle(fontSize: 12, fontFamily: "Serif"),
            ),
            Text(
              'Library',
              style: TextStyle(fontSize: 12, fontFamily: "Serif"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              'images/cafetaria.jpeg',
              width: 150,
              height: 150,
            ),
            Image.asset(
              'images/gallery_charger.jpg',
              width: 150,
              height: 150,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Cafetaria',
              style: TextStyle(fontSize: 12, fontFamily: "Serif"),
            ),
            Text(
              'Gallery Charger',
              style: TextStyle(fontSize: 12, fontFamily: "Serif"),
            ),
          ],
        ),
      ])),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _activeScreenIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        // onTap: (index) {
        //   setState(() {
        //     _activeScreenIndex = index;
        //   });
        // },
        onTap: (index) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeApp()),
            (Route<dynamic> route) => false,
          );
        },
        items: _items.map((item) {
          return BottomNavigationBarItem(
            title: Text(item.title),
            icon: Icon(item.icon),
          );
        }).toList(),
      ),
    );
  }
}

class PageItem {
  final String title;
  final IconData icon;
  final Widget screen;

  PageItem(this.title, this.icon, this.screen);
}
