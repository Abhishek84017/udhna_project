import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SeachSociety extends StatefulWidget {
  const SeachSociety({Key key}) : super(key: key);

  @override
  _SeachSocietyState createState() => _SeachSocietyState();
}

class _SeachSocietyState extends State<SeachSociety> {
  bool isloading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Society'),
      ),
      body: Stack(
        children: [
          WebView(
            backgroundColor: Colors.white,
            initialUrl: 'https://votersmanagement.com',
            javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (finish) {
              setState(() {
                isloading = false;
              });
            },
          ),
          isloading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ],
      ),
    );
  }
}
