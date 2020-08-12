import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrcode/Akses/Service/produkService.dart';
import 'package:qrcode/Home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProdukService>(
          create: (_) => ProdukService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
        },
      ),
    );
  }
}
