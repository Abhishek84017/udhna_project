import 'package:avt_yuwas/pageroute.dart';
import 'package:avt_yuwas/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:avt_yuwas/signinbutton.dart';

class Signup extends StatefulWidget {
  const Signup({Key key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
                  padding: const EdgeInsets.only(top:50),
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Create A New Account\n',
                            style: TextStyle(
                                color: Colors.blue, fontSize: 18.sp)),
                      ]),
                    ),
                  ),
                ),
                Inputtext(
                  text: 'Reg.Number',
                  controller: _Email,
                  onEditingcomplete: () => FocusScope.of(context).nextFocus(),
                  obscureText: false,
                ),
                Inputtext(
                  text: 'Votter Name',
                  controller: _Email,
                  onEditingcomplete: () => FocusScope.of(context).nextFocus(),
                  obscureText: false,
                ),
                Inputtext(
                  text: 'Father Name',
                  controller: _Email,
                  onEditingcomplete: () => FocusScope.of(context).nextFocus(),
                  obscureText: false,
                ),
                Inputtext(
                  text: 'House Number',
                  controller: _Email,
                  onEditingcomplete: () => FocusScope.of(context).nextFocus(),
                  obscureText: false,
                ),
                Inputtext(
                  text: 'Age',
                  controller: _Email,
                  onEditingcomplete: () => FocusScope.of(context).nextFocus(),
                  obscureText: false,
                ),
                Signinbutton(
                  text: 'Create Voter',
                  icon: Icons.arrow_forward,
                  maincolor: Colors.blue,
                  Callback: () {
                    Navigator.push(context, RotationRoute());
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
