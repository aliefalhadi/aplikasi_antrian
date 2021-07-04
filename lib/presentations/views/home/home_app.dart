import 'package:aplikasi_antrian/presentations/views/home/histori_antrian.dart';
import 'package:aplikasi_antrian/presentations/views/home/home.dart';
import 'package:aplikasi_antrian/presentations/views/home/notifikasi.dart';
import 'package:aplikasi_antrian/presentations/views/home/profile.dart';
import 'package:flutter/material.dart';


class HomeApp extends StatefulWidget {
  final int page;
  HomeApp({this.page = 0});
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<HomeApp> {
  final PageStorageBucket _bucket = PageStorageBucket();
  final List<PageItem> _items = [
    PageItem('Home', Icons.home, HomeScreen(key: PageStorageKey('key--home'))),
    PageItem('History', Icons.history,
        HistoriAntrian(key: PageStorageKey('key--history'))),
    PageItem('Notifications', Icons.notifications,
        NotificationsScreen(key: PageStorageKey('key--notifications'))),
    PageItem('Account', Icons.account_circle,
        Profile(key: PageStorageKey('key--account'))),
  ];

  int _activeScreenIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _activeScreenIndex = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Antrian Online MPP'),
      ),
      body: PageStorage(
        child: _items[_activeScreenIndex].screen,
        bucket: _bucket,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _activeScreenIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _activeScreenIndex = index;
          });
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
