import 'package:flutter/material.dart';
import 'package:voter_management/constants/urls.dart';
import 'package:voter_management/mainscreens/pdfviewer.dart';
import 'package:voter_management/pages/widgets/pageroute.dart';
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
            zoomEnabled: true,
            initialUrl: Urls.BASE_URL,
            javascriptMode: JavascriptMode.unrestricted,
            navigationDelegate: (navigation) {
              Navigator.push(context, RotationRoute(page: PdfViewer(pdf: navigation.url,)));
              return NavigationDecision.prevent;
            },
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
