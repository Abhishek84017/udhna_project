import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'splash_screen_1.dart';



class MyApp extends StatelessWidget {
  const MyApp ({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () =>  const MaterialApp(//l003
        title: 'Voter System',
        debugShowCheckedModeBanner: false,
        home: Splashscreen1(),
      ),
    );
  }
}
