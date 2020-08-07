import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Scanner'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String scanResult = '';
  Future scanQR() async {
    String cameraScan = await scanner.scan();
    setState(() {
      scanResult = cameraScan;
    });
  }

  void initState() {
    scanQR();
    super.initState();
  }

  Future scanQRSecond() async {
    String cameraScan = await scanner.scan();
    setState(() {
      scanResult = cameraScan;
    });
  }

  Future<void> launchUrl(String urls) async {
    if (await canLaunch(urls)) {
      await launch(urls);
    } else {
      await launch("https://www.google.com/search?q=$urls");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            scanResult == ''
                ? Text("Tampil Hasil Scan")
                : RaisedButton(
                    child: Text(
                      'Click To $scanResult',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onPressed: () => launchUrl(scanResult),
                  ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text(
                'Click To Scan',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: scanQRSecond,
            )
          ],
        ),
      ),
    );
  }
}
