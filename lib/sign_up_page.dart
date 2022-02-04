import 'package:avt_yuwas/homescreen.dart';
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
  final TextEditingController _vottername = TextEditingController();
  final TextEditingController _fathername = TextEditingController();
  final TextEditingController _mobile = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _age = TextEditingController();

  String genderValue = '';

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
                  padding: const EdgeInsets.only(top: 50),
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Add A New Vooter\n',
                            style:
                                TextStyle(color: Colors.blue, fontSize: 18.sp)),
                      ]),
                    ),
                  ),
                ),
                Inputtext(
                  text: 'Votter Name',
                  controller: _vottername,
                  onEditingcomplete: () => FocusScope.of(context).nextFocus(),
                  obscureText: false,
                ),
                Inputtext(
                  text: 'Father Name',
                  controller: _fathername,
                  onEditingcomplete: () => FocusScope.of(context).nextFocus(),
                  obscureText: false,
                ),
                Inputtext(
                  text: 'Mobile Number',
                  controller: _mobile,
                  onEditingcomplete: () => FocusScope.of(context).nextFocus(),
                  obscureText: false,
                ),
                Inputtext(
                  text: 'House Number',
                  controller: _email,
                  onEditingcomplete: () => FocusScope.of(context).nextFocus(),
                  obscureText: false,
                ),
                Inputtext(
                  text: 'Age',
                  controller: _age,
                  onEditingcomplete: () => FocusScope.of(context).nextFocus(),
                  obscureText: false,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.w),
                  width: double.infinity,
                  child: const Text(
                    'Gender',
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 5.0.h),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Row(
                      children: [
                        Radio(
                            value: 'Male',
                            groupValue: genderValue,
                            onChanged: (val) {
                              genderValue = val;
                              setState(() {});
                            }),
                        const Text('Male'),
                        Radio(
                            value: 'Female',
                            groupValue: genderValue,
                            onChanged: (val) {
                              genderValue = val;
                              setState(() {});
                            }),
                        const Text('Female'),
                      ],
                    ),
                  ),
                ),
                Signinbutton(
                  text: 'Add Voter',
                  icon: Icons.arrow_forward,
                  maincolor: Colors.blue,
                  Callback: () {
                    Navigator.push(
                        context, RotationRoute(page: const HomeScreen()));
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
