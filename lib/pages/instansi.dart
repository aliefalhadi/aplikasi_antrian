import 'package:flutter/material.dart';
import 'home.dart';
import 'history.dart';
import 'notifikasi.dart';
import 'account.dart';
import 'package:aplikasi_antrian/presentations/views/home/home_app.dart';
import 'package:aplikasi_antrian/url_launcher.dart';

class InstansiScreen extends StatelessWidget {
  int _activeScreenIndex = 0;
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

  _launchURL() async {
    const url = 'https://mpp.pekanbaru.go.id/detail.php?id=1';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
          child: Column(
        children: <Widget>[
          Text(
            'Daftar Instansi dan Layanan yang ada di MPP Kota Pekanbaru',
            style: TextStyle(fontSize: 17, fontFamily: "Serif"),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
          ),

        ],
      )),
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
  PageItem(this.title, this.icon, this.screen);

  final IconData icon;
  final Widget screen;
  final String title;
}
