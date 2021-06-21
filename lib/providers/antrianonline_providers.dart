import 'package:aplikasi_antrian/models/antrianonline_model.dart';
import 'package:http/io_client.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';
// import '../models/antrianonline_model.dart';

class AntrianOnlineProvider extends ChangeNotifier {
  List<AntrianOnlineModel> _data = [];
  List<AntrianOnlineModel> get dataAntrianOnline => _data;

  Future<List<AntrianOnlineModel>> getAO() async {
    final url = 'http://192.168.43.109/ps/khika/api_antrianonline_read.php';
    final response = await http.get(url);

    log('data2: test');
    print('hello world');
    if (response.statusCode == 200) {
      final result =
          json.decode(response.body)['data'].cast<Map<String, dynamic>>();
      _data = result
          .map<AntrianOnlineModel>((json) => AntrianOnlineModel.fromJson(json))
          .toList();
      log('data: $result');
      return _data;
    } else {
      throw Exception();
    }
  }

  Future<bool> storeAntrianOnline(
      String aoAntrianID,
      String aoNamaLengkap,
      String aoNoKTP,
      String aoNoKK,
      String aoNoHP,
      String aoWaktu,
      String aoInstansi) async {
    print('aoAntrianID: $aoAntrianID');
    print('aoNamaLengkap: $aoNamaLengkap');
    print('aoNoKTP: $aoNoKTP');
    print('aoNoKK: $aoNoKK');
    print('aoNoHP: $aoNoHP');
    print('aoWaktu: $aoWaktu');
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    final url = 'https://192.168.43.109/ps/khika/api_antrianonline_add.php';
    final response = await http.post(url, body: {
      'aoAntrianID': aoAntrianID,
      'aoNamaLengkap': aoNamaLengkap,
      'aoNoKTP': aoNoKTP,
      'aoNoKK': aoNoKK,
      'aoNoHP': aoNoHP,
      'aoWaktu': aoWaktu,
      'aoInstansi': aoInstansi
    });

    final result = json.decode(response.body);

    log('dataStore: $result');
    if (response.statusCode == 200 && result['status'] == 'success') {
      notifyListeners();
      return true;
    }
    return false;
  }
}
