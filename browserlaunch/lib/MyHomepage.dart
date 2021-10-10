import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  Future<void>? C;
  var Z = "https://www.youtube.com/";

  Future<void> X(String url) async {
    if (await canLaunch(url)) {
      await launch(url,
          forceSafariVC: false,
          forceWebView: false,
          headers: <String, String>{'header_key': 'header_value'});
    } else {
      throw 'Cant launch $url';
    }
  }

  Future<void> B(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        universalLinksOnly: true,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      await launch(
        url,
        forceSafariVC: true,
        // headers: <String, String>{'header_key': 'header_value'},
      );
    }
  }

  Future<void> Y(String url) async {
    if (await canLaunch(url)) {
      await launch(url,
          forceSafariVC: true,
          forceWebView: true,
          headers: <String, String>{'header_key': 'header_value'});
    } else {
      throw 'Cant launch $url';
    }
  }

  Future<void> A(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Cant make a Call';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                    onPressed: () {
                      setState(() {
                        C = X("https://www.facebook.com/");
                      });
                    },
                    child: Text("Launch Browser")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        C = B(Z);
                      });
                    },
                    child: Text("Launch in Universal")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        C = A('tel:9716588403');
                      });
                    },
                    child: Text("Call the Developer")),
                FutureBuilder(
                    future: C,
                    builder:
                        (BuildContext context, AsyncSnapshot<void> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return Text('launched');
                      }
                    })
              ],
            ),
          ),
        ));
  }
}
