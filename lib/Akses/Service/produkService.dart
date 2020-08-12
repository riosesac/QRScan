import 'package:flutter/material.dart';
import 'package:qrcode/Akses/Model/produkModel.dart';
import 'package:http/http.dart' show Client;

class ProdukService extends ChangeNotifier {
  List<ProdukModel> _data = [];
  List<ProdukModel> get dataProduk => _data;
  final url = 'http://tiketpintar.com/api';
  Client http = Client();

}