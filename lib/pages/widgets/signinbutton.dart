
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SignInButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color maincolor;
  final VoidCallback callback;

  const SignInButton(
      {Key key, this.text, this.icon, this.maincolor, this.callback})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:10.0.w,vertical: 5.0.h),
      child: Container(
        width: double.infinity,
        height: 40.h,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.blue
          ),
          onPressed: callback,
          child: Row(
            children: [
              Expanded(
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        text,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
