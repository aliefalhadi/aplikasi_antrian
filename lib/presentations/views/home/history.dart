import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Center(
    //     child: Text('Welcome to History'),
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
                Text('Instansi: '),
                Text('Layanan: '),
                Text('Waktu: '),
              ],
            ),
            Column(
              children: [],
            ),
            Column(
              children: [],
            ),
            Column(
              children: [
                Image.asset(
                  'images/qrcode.png',
                  width: 80.0,
                ),
              ],
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
                Text('Instansi: '),
                Text('Layanan: '),
                Text('Waktu: '),
              ],
            ),
            Column(
              children: [],
            ),
            Column(
              children: [],
            ),
            Column(
              children: [
                Image.asset(
                  'images/qrcode.png',
                  width: 80.0,
                ),
              ],
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
                Text('Instansi: '),
                Text('Layanan: '),
                Text('Waktu: '),
              ],
            ),
            Column(
              children: [],
            ),
            Column(
              children: [],
            ),
            Column(
              children: [
                Image.asset(
                  'images/qrcode.png',
                  width: 80.0,
                ),
              ],
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
                Text('Instansi: '),
                Text('Layanan: '),
                Text('Waktu: '),
              ],
            ),
            Column(
              children: [],
            ),
            Column(
              children: [],
            ),
            Column(
              children: [
                Image.asset(
                  'images/qrcode.png',
                  width: 80.0,
                ),
              ],
            ),
          ],
        ),
      ),
      // ),
    );

    final FifthList = DefaultTextStyle.merge(
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
                Text('Instansi: '),
                Text('Layanan: '),
                Text('Waktu: '),
              ],
            ),
            Column(
              children: [],
            ),
            Column(
              children: [],
            ),
            Column(
              children: [
                Image.asset(
                  'images/qrcode.png',
                  width: 80.0,
                ),
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
          FirstList,
          SecondList,
          ThirdList,
          FourthList,
          FifthList,
        ],
      ),
    );

    return new Scaffold(
      // appBar: AppBar(
      // title: Text(title),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: leftColumn,
      ),
    );
  }
}
