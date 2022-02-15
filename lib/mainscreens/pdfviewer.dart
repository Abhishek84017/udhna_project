import 'package:avt_yuwas/mainscreens/add_all_family.dart';
import 'package:avt_yuwas/pages/widgets/pageroute.dart';
import 'package:avt_yuwas/pages/auth/sign_up_page.dart';
import 'package:avt_yuwas/pages/widgets/signinbutton.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class pdfviweer extends StatefulWidget {
  String pdf;
  List<Map<String,dynamic>> id;

  pdfviweer({Key key, this.pdf,this.id}) : super(key: key);

  @override
  _pdfviweerState createState() => _pdfviweerState();
}

class _pdfviweerState extends State<pdfviweer> {
  String document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = 'https://votersmanagement.com/${widget.pdf}';
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
            child: widget.pdf.isEmpty  ? const Center(child: Text('Voters List not Found'),) : SfPdfViewer.network(document,),
            //child: _isLoading ? const Center(child: CircularProgressIndicator()) : document == null ? const Center(child: Text('No Voters List Find'),) : SfPdfViewer.network(document),
          ),
          Signinbutton(
            text: 'Add New Vooter',
            icon: Icons.arrow_forward,
            maincolor: Colors.blue,
            Callback: () {
              Navigator.push(context, RotationRoute(page: const Signup()));
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
