import 'package:flutter/material.dart';
import 'package:qrcode/Produk/produk.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:url_launcher/url_launcher.dart';
import 'package:avatar_glow/avatar_glow.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeDetail(),
    );
  }
}

class HomeDetail extends StatefulWidget {
  @override
  _HomeDetailState createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {
  String scanResult = '';
  // Future scanQR() async {
  //   String cameraScan = await scanner.scan();
  //   setState(() {
  //     scanResult = cameraScan;
  //   });
  // }

  // void initState() {
  //   scanQR();
  //   super.initState();
  // }

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
      floatingActionButton: FloatingActionButton(
        heroTag: "produk",
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Produks()),
          );
        },
        child: Icon(Icons.create_new_folder),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            scanResult == ''
                ? FloatingActionButton.extended(
                    heroTag: "scanner",
                    onPressed: scanQRSecond,
                    label: Text('This your link'),
                    backgroundColor: Colors.blueAccent,
                  )
                : FloatingActionButton.extended(
                    heroTag: "link",
                    onPressed: () => launchUrl(scanResult),
                    label: Text('Press to Link'),
                    icon: Icon(Icons.link),
                    backgroundColor: Colors.lightGreen,
                  ),
            SizedBox(
              height: 20,
            ),
            AvatarGlow(
              glowColor: Colors.blue,
              endRadius: 150.0,
              duration: Duration(milliseconds: 2000),
              repeat: true,
              showTwoGlows: true,
              repeatPauseDuration: Duration(milliseconds: 100),
              child: Material(
                elevation: 8.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Colors.blue[10],
                  child: FloatingActionButton(
                    child: Icon(Icons.add_a_photo),
                    backgroundColor: Colors.blue[10],
                    onPressed: scanQRSecond,
                  ),
                  radius: 50.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
