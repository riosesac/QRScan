import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:qrcode/Akses/Service/listService.dart';

class DetailProduk extends StatefulWidget {
  @override
  _DetailProdukState createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  @override
  Widget build(BuildContext context) {
    // final a = Provider.of<ListService>(context, listen: false);
    // final _getList = a.getList();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: "create qr code",
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: Text('+'),
      ),
      // body: RefreshIndicator(),
    );
  }
}
