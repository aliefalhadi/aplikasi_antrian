import 'package:flutter/material.dart';
// import 'package:aplikasi_antrian/pages/home.dart';
import 'screen.dart';

import './pages/home.dart';
import './pages/history.dart';
import './pages/notifikasi.dart';
import './pages/account.dart';
import './pages/fasilitas.dart';

class HomeApp extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<HomeApp> {
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
      appBar: AppBar(
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
