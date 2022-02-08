import 'package:avt_yuwas/add_all_family.dart';
import 'package:avt_yuwas/pageroute.dart';
import 'package:avt_yuwas/sign_up_page.dart';
import 'package:avt_yuwas/signinbutton.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class pdfviweer extends StatefulWidget {
  @override
  _pdfviweerState createState() => _pdfviweerState();
}

class _pdfviweerState extends State<pdfviweer> {
  bool _isLoading = true;
  String document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = 'assests/images/DummyPDF.pdf';
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All voters'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : SfPdfViewer.asset(document // filePath: abc,),
                    ),
          ),
          Signinbutton(
            text: 'Add New Vooter',
            icon: Icons.arrow_forward,
            maincolor: Colors.blue,
            Callback: () {
              Navigator.push(context, RotationRoute(page: Signup()));
            },
          ),
          Signinbutton(
            text: 'Add New Family Vooter',
            icon: Icons.arrow_forward,
            maincolor: Colors.blue,
            Callback: () {
              Navigator.push(
                  context, RotationRoute(page: const Vooterfamily()));
            },
          ),
        ],
      ),
    );
  }
}
