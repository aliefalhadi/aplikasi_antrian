import 'package:aplikasi_antrian/pages/account.dart';
import 'package:aplikasi_antrian/pages/notifikasi.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'history.dart';
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
          // Image.asset('images/mpp1.jpg'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: _launchURL,
                child: Image.asset(
                  'images/dpmptsp.png',
                  width: 120,
                  height: 100,
                ),
              ),
              Image.asset(
                'images/dpmptsp1.png',
                width: 120,
                height: 100,
              ),
              Image.asset(
                'images/dpmptsp2.png',
                width: 120,
                height: 100,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                'images/dpmptsp4.png',
                width: 120,
                height: 100,
              ),
              Image.asset(
                'images/dpmptsp3.png',
                width: 120,
                height: 100,
              ),
              Image.asset(
                'images/dpmptsp5.png',
                width: 120,
                height: 100,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                'images/dpmptsp6.png',
                width: 120,
                height: 100,
              ),
              Image.asset(
                'images/dpmptsp7.png',
                width: 120,
                height: 100,
              ),
              Image.asset(
                'images/dpmptsp8.png',
                width: 120,
                height: 100,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                'images/dpmptsp9.png',
                width: 120,
                height: 100,
              ),
              Image.asset(
                'images/dpmptsp10.png',
                width: 120,
                height: 100,
              ),
              Image.asset(
                'images/dpmptsp11.png',
                width: 120,
                height: 100,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                'images/dpmptsp12.png',
                width: 120,
                height: 100,
              ),
              Image.asset(
                'images/dpmptsp13.png',
                width: 120,
                height: 100,
              ),
              Image.asset(
                'images/dpmptsp14.png',
                width: 120,
                height: 100,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                'images/dpmptsp15.png',
                width: 120,
                height: 100,
              ),
              Image.asset(
                'images/dpmptsp16.png',
                width: 120,
                height: 100,
              ),
              Image.asset(
                'images/dpmptsp17.png',
                width: 120,
                height: 100,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                'images/dpmptsp18.png',
                width: 120,
                height: 100,
              ),
              Image.asset(
                'images/dpmptsp19.png',
                width: 120,
                height: 100,
              ),
              Image.asset(
                'images/dpmptsp20.png',
                width: 120,
                height: 100,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                'images/dpmptsp21.png',
                width: 120,
                height: 100,
              ),
              Image.asset(
                'images/dpmptsp22.png',
                width: 120,
                height: 100,
              ),
              Image.asset(
                'images/dpmptsp23.png',
                width: 120,
                height: 100,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                'images/dpmptsp24.png',
                width: 120,
                height: 100,
              ),
              Image.asset(
                'images/dpmptsp25.png',
                width: 120,
                height: 100,
              ),
              Image.asset(
                'images/dpmptsp26.png',
                width: 120,
                height: 100,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                'images/dpmptsp27.png',
                width: 120,
                height: 100,
              ),
              Image.asset(
                'images/dpmptsp28.png',
                width: 120,
                height: 100,
              ),
            ],
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
