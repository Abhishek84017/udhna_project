import 'package:avt_yuwas/homescreen.dart';
import 'package:avt_yuwas/pageroute.dart';
import 'package:avt_yuwas/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'signinbutton.dart';

class Signin extends StatefulWidget {
  const Signin({Key key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final TextEditingController _Email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 200.h),
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Welcome Back!\n',
                              style: TextStyle(
                                  color: Colors.blue, fontSize: 18.sp)),
                          TextSpan(
                              text: 'Login to your existing account!',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15.sp))
                        ]),
                      ),
                    )),
                Inputtext(
                  text: 'Email & Mobile no',
                  controller: _Email,
                  onEditingcomplete: () => FocusScope.of(context).nextFocus(),
                  obscureText: false,
                ),
                Inputtext(
                  text: 'Password',
                  controller: _password,
                  keyboardtype: TextInputType.number,
                  onEditingcomplete: () => FocusScope.of(context).unfocus(),
                  obscureText: true,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 25.w),
                      child: Text(
                        'Forget Password!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        ),
                      ),
                    )
                ),

                Signinbutton(
                  text: 'Login',
                  maincolor: Colors.blue,
                  Callback: () {
                    Navigator.push(context, RotationRoute(page:const Homescreen()));
                  },
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Dont have an account?'),
            SizedBox(
              width: 5.w,
            ),
            Text(
              'Sing Up',
              style: TextStyle(color: Colors.blue, fontSize: 16.sp),
            ),
          ],
        )
      ],
    ));
  }
}
