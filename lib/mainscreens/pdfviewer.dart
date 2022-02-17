

import 'package:avt_yuwas/pages/widgets/pageroute.dart';
import 'package:avt_yuwas/pages/auth/add_new_voter.dart';
import 'package:avt_yuwas/pages/widgets/signinbutton.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatefulWidget {
  String pdf;

  PdfViewer({Key key, this.pdf}) : super(key: key);

  @override
  _PdfViewerState createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  String document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = 'https://votersmanagement.com/${widget.pdf}';
  }

 Future<bool> _onbackpress() async {
    return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Do you want to back'),
              actions: [
                TextButton(
                    onPressed: (){
                     Navigator.pop(context,true);
                    },
                    child: const Text('Yes')),
                TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text('No')),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onbackpress,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('All voters'),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Expanded(
              child: widget.pdf.isEmpty
                  ? const Center(
                      child: Text('Voters List not Found on this society'),
                    )
                  : SfPdfViewer.network(
                      document,
                    ),
              //child: _isLoading ? const Center(child: CircularProgressIndicator()) : document == null ? const Center(child: Text('No Voters List Find'),) : SfPdfViewer.network(document),
            ),
            SignInButton(
              text: 'Add New Voter',
              icon: Icons.arrow_forward,
              maincolor: Colors.blue,
              callback: () {
                Navigator.push(
                    context, RotationRoute(page: const AddNewVoter()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
