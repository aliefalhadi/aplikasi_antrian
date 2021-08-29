import 'package:flutter/material.dart';
import 'home.dart';
import 'history.dart';
import 'notifikasi.dart';
import 'account.dart';
import 'package:aplikasi_antrian/presentations/views/home/home_app.dart';

class FasilitasScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Fasilitas MPP Kota Pekanbaru'),
      ),
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

    );
  }
}
