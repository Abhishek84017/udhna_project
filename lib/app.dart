
import 'package:voter_management/constants/global.dart';
import 'package:voter_management/mainscreens/homescreen.dart';
import 'package:voter_management/pages/auth/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String finalData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValidationData();
  }

  Future getValidationData() async {
    var obtainedmobile = kSharedPreferences.getString('mobile');
    setState(() {
      finalData = obtainedmobile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      title: 'Voter System',
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ScreenUtilInit(builder: () {
          return child;
        });
      },
      home: finalData == null ? const SignIn() : const HomeScreen()
    ));
  }
}
