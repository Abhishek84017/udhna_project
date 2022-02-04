import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Data {
  String id;
  String menu;
  String text;
  String icon;
  String webviewStatus;
  String link;
  String content;
  String status;
  String position;
  String parentId;
  String webLink;
  String type;
  List<ChildMenu> childMenu;
  int hasChild;

  Data(
      {this.id,
      this.menu,
      this.text,
      this.icon,
      this.webviewStatus,
      this.link,
      this.content,
      this.status,
      this.position,
      this.parentId,
      this.webLink,
      this.type,
      this.childMenu,
      this.hasChild});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    menu = json['menu'];
    text = json['text'];
    icon = json['icon'];
    webviewStatus = json['webview_status'];
    link = json['link'];
    content = json['content'];
    status = json['status'];
    position = json['position'];
    parentId = json['parent_id'];
    webLink = json['web_link'];
    type = json['type'];
    hasChild = json['hasChild'];
  }
}

class ChildMenu {
  String id;
  String menu;
  String text;
  String icon;
  String webviewStatus;
  String link;
  String content;
  String status;
  String position;
  String parentId;
  String webLink;
  String type;
  int hasChild;

  ChildMenu(
      {this.id,
      this.menu,
      this.text,
      this.icon,
      this.webviewStatus,
      this.link,
      this.content,
      this.status,
      this.position,
      this.parentId,
      this.webLink,
      this.type,
      this.hasChild});

  ChildMenu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    menu = json['menu'];
    text = json['text'];
    icon = json['icon'];
    webviewStatus = json['webview_status'];
    link = json['link'];
    content = json['content'];
    status = json['status'];
    position = json['position'];
    parentId = json['parent_id'];
    webLink = json['web_link'];
    type = json['type'];
    hasChild = json['hasChild'];
  }
}

class Learnapi extends StatefulWidget {
  const Learnapi({Key key}) : super(key: key);

  @override
  _LearnapiState createState() => _LearnapiState();
}

class _LearnapiState extends State<Learnapi> {
  List<Data> data = <Data>[];

  Future<List<Data>> fetchdata() async {
    final response = await http
        .get(Uri.parse('https://www.avtyuwas.org/json?table=app_menu'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData['data'] != null) {
        jsonData['data'].forEach((v) {
          data.add(Data.fromJson(v));
        });
      }

      return data;
    } else {
      throw Exception('failed to data load');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Learnapi_integration',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          var item = data[index];
          return ListTile(
            title: Text(item.text),
          );
        },
        itemCount: data.length,
      ),
    );
  }
}
