import 'package:avt_yuwas/homescreen.dart';
import 'package:avt_yuwas/sign_in_page.dart';
import 'package:avt_yuwas/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'add_all_family.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      title: 'Voter System',
      debugShowCheckedModeBanner: false,
      home: ScreenUtilInit(
        builder: () {
          return const HomeScreen();
        },
      ),
    ));
  }
}
