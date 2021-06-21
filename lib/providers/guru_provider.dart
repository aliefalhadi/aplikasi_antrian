import 'package:aplikasi_antrian/models/guru_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

class GuruProvider extends ChangeNotifier {
  List<GuruModel> _data = [];
  List<GuruModel> get dataGuru => _data;

  Future<List<GuruModel>> getGuru() async {
    final url = 'https://flashsoftindonesia.com/api/api_guru_read.php';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result =
          json.decode(response.body)['data'].cast<Map<String, dynamic>>();
      _data =
          result.map<GuruModel>((json) => GuruModel.fromJson(json)).toList();
      // log('data: $result');
      return _data;
    } else {
      throw Exception();
    }
  }

//   //ADD DATA
  Future<bool> storeGuru(String nip, String namaGuru) async {
    final url = 'https://flashsoftindonesia.com/api/api_guru_add.php';
    final response =
        await http.post(url, body: {'nip': nip, 'nama_guru': namaGuru});

    log('name: $nip');
    log('namaGuru: $namaGuru');

    final result = json.decode(response.body);

    log('dataStore: $result');
    if (response.statusCode == 200 && result['status'] == 'success') {
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<GuruModel> findGuru(String id) async {
    return _data.firstWhere((i) => i.idGuru == id);
  }

  Future<bool> updateGuru(idGuru, nip, namaGuru) async {
    final url = 'https://flashsoftindonesia.com/api/api_guru_update.php';
    final response = await http.post(url,
        body: {'id_guru': idGuru, 'nip': nip, 'nama_guru': namaGuru});

    final result = json.decode(response.body);
    if (response.statusCode == 200 && result['status'] == 'success') {
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> deleteGuru(String id) async {
    final url = 'https://flashsoftindonesia.com/api/api_guru_delete.php';
    await http.get(url + '?id=$id');
  }
}
