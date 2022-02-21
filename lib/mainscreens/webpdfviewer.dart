import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class WebPdfViewer extends StatefulWidget {
  final String webpdf;

  const WebPdfViewer({Key key, this.webpdf}) : super(key: key);

  @override
  _WebPdfViewerState createState() => _WebPdfViewerState();
}

class _WebPdfViewerState extends State<WebPdfViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Society Voter List '),
      ),
      body: Column(
        children: [
          Expanded(
            child: widget.webpdf.isEmpty
                ? const Center(
                    child: Text('Voters List not Found on this society'),
                  )
                : SfPdfViewer.network(widget.webpdf),
          ),
        ],
      ),
    );
  }
}
