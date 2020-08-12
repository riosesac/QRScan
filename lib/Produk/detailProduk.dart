import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrcode/Akses/Model/listModel.dart';
import 'package:qrcode/Akses/Service/listService.dart';

class DetailProduk extends StatefulWidget {
  @override
  _DetailProdukState createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  ListModel _namaList;
  @override
  Widget build(BuildContext context) {
    final a = Provider.of<ListService>(context, listen: false);
    final _getList = a.getList();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: "create qr code",
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: Text('+'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            FutureBuilder<List<ListModel>>(
                future: _getList,
                builder: (BuildContext context,
                    AsyncSnapshot<List<ListModel>> snapshot) {
                  if (!snapshot.hasData) return CircularProgressIndicator();
                  return DropdownButton<ListModel>(
                    icon: Icon(Icons.list),
                    isDense: true,
                    items: snapshot.data.map((dataList) {
                      return DropdownMenuItem(
                        value: dataList,
                        child: Text(dataList.nama),
                      );
                    }).toList(),
                    onChanged: (values) {
                      setState(() {
                        this._namaList = values;
                      });
                    },
                    isExpanded: true,
                    hint: Text('Select List'),
                  );
                }),
            SizedBox(
              height: 50.0,
            ),
            _namaList != null
                ? Text("Produk :" + _namaList.nama)
                : Text("Produk Belum Ada"),
          ],
        ),
      ),
    );
  }
}
