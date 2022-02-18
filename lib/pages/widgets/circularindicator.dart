import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top:20.h),
      child: const Center(child: CircularProgressIndicator(strokeWidth: 2.0,),),
    );
  }
}
