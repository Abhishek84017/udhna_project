import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RestAPI extends StatefulWidget {
  const RestAPI({Key key}) : super(key: key);

  @override
  _RestAPIState createState() => _RestAPIState();
}

class _RestAPIState extends State<RestAPI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rest API"),
      ),
      body: FutureBuilder<http.Response>(
        future:
            http.get(Uri.parse("https://www.avtyuwas.org/json?table=event")),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData && snapshot.data.statusCode == 200) {
            print(snapshot.data.body);
            final  data = jsonDecode(snapshot.data.body);
            return ListView.builder(
              itemBuilder: (context, index) {
                final element = data["data"][index];
                return ListTile(
                  title: Text(element["title"]),
                );
              },
              itemCount: data["data"].length,
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
