import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Client;
import 'package:qrcode/Akses/Model/listModel.dart';

class ListService extends ChangeNotifier {
  List<ListModel> _data = [];
  List<ListModel> get dataList => _data;
  final url = 'http://tiketpintar.com/api';
  Client http = Client();

  Future<List<ListModel>> getList() async {
    final response = await http.get("$url/produk");
    if (response.statusCode == 200) {
      final result =
          json.decode(response.body)['data'].cast<Map<String, dynamic>>();
      _data =
          result.map<ListModel>((json) => ListModel.fromJson(json)).toList();
      return _data;
    } else {
      throw Exception();
    }
  }
}
