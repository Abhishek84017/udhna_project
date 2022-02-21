import 'dart:convert';
import 'package:voter_management/constants/global.dart';
import 'package:voter_management/mainscreens/homescreen.dart';
import 'package:voter_management/pages/widgets/circularindicator.dart';
import 'package:voter_management/pages/widgets/pageroute.dart';
import 'package:voter_management/pages/widgets/signinbutton.dart';
import 'package:voter_management/pages/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/signinbutton.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class LoginModel {
  String username;
  String password;
  String lat;
  String long;

  LoginModel({this.username, this.password, this.lat, this.long});

  LoginModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['lat'] = lat;
    data['long'] = long;
    return data;
  }
}

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool islogin = true;

  //LoginModel user;
  Future<LoginModel> checklogin() async {
    var data = <String, dynamic>{
      "username": _email.text,
      "password": _password.text,
      "lat": "21.67645",
      "long": "23.87656"
    };
    final response = await http.post(
        Uri.https('votersmanagement.com', '/api/check-boy-login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode((data)));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      //login.add(LoginModel.fromJson(jsonData));
      //var item = login;
      //print(item.status)
      //user = LoginModel.fromJson(jsonData);
      //print(user.username);
      if (jsonData['status'] == 'true') {
        Navigator.pushReplacement(
            context, RotationRoute(page: const HomeScreen()));
        await kSharedPreferences.setString('mobile', _email.text);
      } else {
        Fluttertoast.showToast(
            msg: jsonData['message'], backgroundColor: Colors.red);
        setState(() {
          islogin = true;
        });
      }
      return LoginModel.fromJson(jsonData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
              text: 'Manage Your Constituency\n',
              style: TextStyle(fontSize: 22.sp, color: Colors.blue),
            ),
            TextSpan(
                text: 'Welcome Back!\n',
                style: TextStyle(color: Colors.blue, fontSize: 18.sp)),
            TextSpan(
                text: 'Login to your existing account!',
                style: TextStyle(color: Colors.black, fontSize: 15.sp))
          ]),
        ),
        Inputtext(
          text: 'Mobile no',
          controller: _email,
          keyboardtype: TextInputType.number,
          onEditingcomplete: () => FocusScope.of(context).nextFocus(),
          obscureText: false,
        ),
        Inputtext(
          text: 'Password',
          controller: _password,
          onEditingcomplete: () => FocusScope.of(context).unfocus(),
          obscureText: true,
        ),
        SizedBox(
          height: 10.h,
        ),
        islogin == true
            ? Padding(
                padding: EdgeInsets.all(8.0.w),
                child: SignInButton(
                  text: 'Login',
                  maincolor: Colors.blue,
                  callback: () {
                    if (_password.text.isEmpty && _email.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: 'Username or Password Required');
                      return;
                    }
                    if (_email.text.isEmpty) {
                      Fluttertoast.showToast(msg: 'Username Required');
                      return;
                    }
                    if (_password.text.isEmpty) {
                      Fluttertoast.showToast(msg: 'Password Required');
                      return;
                    }
                    if (!RegExp(r"^(?:[+0]9)?[0-9]{10}$")
                        .hasMatch(_email.text)) {
                      Fluttertoast.showToast(
                          msg: 'Invalid mobile number',
                          backgroundColor: Colors.red);
                      return;
                    }
                    setState(() {
                      islogin = false;
                    });
                    checklogin();
                  },
                ),
              )
            : const CircularIndicator(),
      ],
    ));
  }
}
