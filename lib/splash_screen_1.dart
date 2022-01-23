import 'dart:async';
import 'package:avt_yuwas/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'pageroute.dart';

class Splashscreen1 extends StatefulWidget {
  const Splashscreen1({Key key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen1> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, RotationRoute(page: const Signin())));
  }

  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:Text('Voter System',style:TextStyle(fontWeight:FontWeight.bold,fontSize:35),),                                                                                                                                                                                                                   ),
    );
  }
}
