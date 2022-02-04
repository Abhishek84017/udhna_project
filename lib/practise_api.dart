import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Practiseapi extends StatefulWidget {
  const Practiseapi({Key key}) : super(key: key);

  @override
  _PractiseapiState createState() => _PractiseapiState();
}

class _PractiseapiState extends State<Practiseapi> {
  Future<int> fetchdata() async {
    final response = await http.get(Uri.parse('https://www.avtyuwas.org/json?table=app_menu'));
        print(response.body);
        if(response.statusCode == 200)
          {
            final jsonData = jsonDecode(response.body);
          }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      fetchdata();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('practise api'),
      ),
      body:ListView.builder(itemBuilder:(contex,index)
          {
            return const ListTile(
              title: Text('hello'),
            );
          },

      ),
    );
  }
}
