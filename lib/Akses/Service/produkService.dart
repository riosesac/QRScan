import 'package:flutter/material.dart';
import 'package:qrcode/Akses/Model/produkModel.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

class ProdukService extends ChangeNotifier {
  List<ProdukModel> _data = [];
  List<ProdukModel> get dataProduk => _data;
  final url = 'http://tiketpintar.com/api';
  Client http = Client();

  //Search Nama Produk
  Future<ProdukModel> cariNamaProduk(String nama) async {
    return _data.firstWhere((i) => i.nama == nama);
  }

  Future<List<ProdukModel>> getProduk(String nama) async {
    final response = await http.get("$url/code/produksatu/$nama");
    if (response.statusCode == 200) {
      final result =
          json.decode(response.body)['data'].cast<Map<String, dynamic>>();
      _data = result
          .map<ProdukModel>((json) => ProdukModel.fromJson(json))
          .toList();
      return _data;
    } else {
      throw Exception();
    }
  }
}
