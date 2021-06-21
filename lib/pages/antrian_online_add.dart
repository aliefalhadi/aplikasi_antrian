import 'package:aplikasi_antrian/pages/antrian_online.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/antrianonline_providers.dart';

class AntrianOnlineAdd extends StatefulWidget {
  @override
  _AntrianOnlineAddState createState() => _AntrianOnlineAddState();
}

class _AntrianOnlineAddState extends State<AntrianOnlineAdd> {
  final TextEditingController _aoAntrianID = TextEditingController();
  final TextEditingController _aoNamaLengkap = TextEditingController();
  final TextEditingController _aoNoKTP = TextEditingController();
  final TextEditingController _aoNoKK = TextEditingController();
  final TextEditingController _aoNoHP = TextEditingController();
  final TextEditingController _aoWaktu = TextEditingController();
  final TextEditingController _aoInstansi = TextEditingController();
  bool _isLoading = false;
  String _instansi;
  String _layanan;

  final snackbarKey = GlobalKey<ScaffoldState>();

  FocusNode namaNode = FocusNode();
  FocusNode noKTPNode = FocusNode();
  FocusNode noKKNode = FocusNode();
  FocusNode noHpNode = FocusNode();
  FocusNode waktuNode = FocusNode();
  FocusNode instansiNode = FocusNode();

  void submit(BuildContext context) {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<AntrianOnlineProvider>(context, listen: false)
          .storeAntrianOnline(
              _aoAntrianID.text,
              _aoNamaLengkap.text,
              _aoNoKTP.text,
              _aoNoKK.text,
              _aoNoHP.text,
              _aoWaktu.text,
              _instansi)
          .then((res) {
        if (res) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => AntrianOnlineScreen()),
              (route) => false);
        } else {
          var snackbar = SnackBar(
            content: Text('Ops, Error. Hubungi Admin'),
          );
          snackbarKey.currentState.showSnackBar(snackbar);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: snackbarKey,
      appBar: AppBar(
        title: Text('Tambah Antrian'),
        actions: <Widget>[
          FlatButton(
            child: _isLoading
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
            onPressed: () => submit(context),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: _aoAntrianID,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pinkAccent,
                  ),
                ),
                hintText: 'AntrianID',
              ),
              onSubmitted: (_) {
                FocusScope.of(context).requestFocus(namaNode);
              },
            ),
            TextField(
              controller: _aoNamaLengkap,
              focusNode: namaNode,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pinkAccent,
                  ),
                ),
                hintText: 'Nama Lengkap',
              ),
            ),
            TextField(
              controller: _aoNoKTP,
              focusNode: noKTPNode,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pinkAccent,
                  ),
                ),
                hintText: 'No KTP',
              ),
            ),
            TextField(
              controller: _aoNoKK,
              focusNode: noKKNode,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pinkAccent,
                  ),
                ),
                hintText: 'No KK',
              ),
            ),
            TextField(
              controller: _aoNoHP,
              focusNode: noHpNode,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pinkAccent,
                  ),
                ),
                hintText: 'No HP',
              ),
            ),
            TextField(
              controller: _aoWaktu,
              focusNode: waktuNode,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pinkAccent,
                  ),
                ),
                hintText: 'Waktu',
              ),
            ),
            DropdownButton(
              hint: _instansi == null
                  ? Text('Pilih Instansi')
                  : Text(
                      _instansi,
                      style: TextStyle(color: Colors.black),
                    ),
              isExpanded: true,
              items: ['DPMPTSP', 'DPMPTSP', 'Three'].map(
                (val) {
                  return DropdownMenuItem<String>(
                    value: val,
                    child: Text(val),
                  );
                },
              ).toList(),
              onChanged: (value) {
                setState(
                  () {
                    _instansi = value;
                  },
                );
              },
            ),
            DropdownButton(
              hint: _layanan == null
                  ? Text('Pilih Layanan')
                  : Text(
                      _layanan,
                      style: TextStyle(color: Colors.black),
                    ),
              isExpanded: true,
              items: ['DPMPTSP', 'Bantuan', 'Promo'].map(
                (val) {
                  return DropdownMenuItem<String>(
                    value: val,
                    child: Text(val),
                  );
                },
              ).toList(),
              onChanged: (value) {
                setState(
                  () {
                    _layanan = value;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
