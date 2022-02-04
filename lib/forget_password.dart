import 'package:avt_yuwas/pageroute.dart';
import 'package:avt_yuwas/sign_in_page.dart';
import 'package:avt_yuwas/signinbutton.dart';
import 'package:flutter/material.dart';
import 'package:avt_yuwas/text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _forgetasswordmobilenumber =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 250.h),
        child: Column(
          children: [
            Inputtext(
              text: 'Mobile no',
              controller: _forgetasswordmobilenumber,
              keyboardtype: TextInputType.number,
              onEditingcomplete: () => FocusScope.of(context).nextFocus(),
              obscureText: false,
            ),
            Signinbutton(
              text: 'Forget Password',
              maincolor: Colors.blue,
              Callback: () {
                Navigator.push(context, RotationRoute(page: const Signin()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
