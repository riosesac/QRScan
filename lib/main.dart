import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:url_launcher/url_launcher.dart';
import 'package:avatar_glow/avatar_glow.dart';

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
                ? AvatarGlow(
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
                  )
                : AvatarGlow(
                    glowColor: Colors.green,
                    endRadius: 150.0,
                    duration: Duration(milliseconds: 2000),
                    repeat: true,
                    showTwoGlows: true,
                    repeatPauseDuration: Duration(milliseconds: 100),
                    child: Material(
                      elevation: 8.0,
                      shape: CircleBorder(),
                      child: CircleAvatar(
                        backgroundColor: Colors.greenAccent[100],
                        child: FloatingActionButton(
                          child: Icon(Icons.link),
                          backgroundColor: Colors.greenAccent[100],
                          onPressed: () => launchUrl(scanResult),
                        ),
                        radius: 50.0,
                      ),
                    ),
                  ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.create_new_folder),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
