import 'dart:convert';
import 'dart:io';

import 'package:avt_yuwas/pages/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:avt_yuwas/pages/widgets/signinbutton.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Vooterfamily extends StatefulWidget {
  const Vooterfamily({Key key}) : super(key: key);

  @override
  _VooterfamilyState createState() => _VooterfamilyState();
}

class _VooterfamilyState extends State<Vooterfamily> {
  final TextEditingController _houseno = TextEditingController();
  final TextEditingController _personname = TextEditingController();
  final TextEditingController _contact = TextEditingController();
  final TextEditingController _alternatecontact = TextEditingController();

  void familyVooter() async {
    if (_houseno.text.isEmpty ||
        _personname.text.isEmpty ||
        _contact.text.isEmpty ||
        _alternatecontact.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'All fields are requiredd', backgroundColor: Colors.red);
      return;
    }
    if (!RegExp(r"^(?:[+0]9)?[0-9]{10}$").hasMatch(_contact.text)) {
      Fluttertoast.showToast(
          msg: 'Invalid mobile number', backgroundColor: Colors.red);
      return;
    }
    if (!RegExp(r"^(?:[+0]9)?[0-9]{10}$").hasMatch(_alternatecontact.text)) {
      Fluttertoast.showToast(
          msg: 'Invalid Alternata mobile number', backgroundColor: Colors.red);
      return;
    }

    var data = <String, dynamic>{
      "id": 3,
      "assembly": 1,
      "booth": 1,
      "society": 1,
      "house_number": _houseno.text,
      "name": _personname.text,
      "contact": _contact.text,
      "alternate": _alternatecontact.text,
    };

    final response = await http.post(
        Uri.https('votersmanagement.com', 'api/create-family-contacts'),
        headers: {'Content-Type': "application/json"},
        body: jsonEncode(data));

    try {
      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: 'Family Vooter Detaile Added ', backgroundColor: Colors.black);
        _houseno.clear();
        _personname.clear();
        _contact.clear();
        _alternatecontact.clear();
      }
    } on SocketException catch (e) {
      Fluttertoast.showToast(
          msg: 'Internet Connection Failed', backgroundColor: Colors.black);
    } catch (_) {
      Fluttertoast.showToast(
          msg: 'Something went wrong', backgroundColor: Colors.black);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: 50.h),
                child:Text('Add New Family voter',style: TextStyle(color: Colors.blue,fontSize:18.sp),),
              ),
              Inputtext(
                text: 'House No',
                controller: _houseno,
                onEditingcomplete: () => FocusScope.of(context).nextFocus(),
                obscureText: false,
              ),
              Inputtext(
                text: 'Person Name',
                controller: _personname,
                onEditingcomplete: () => FocusScope.of(context).nextFocus(),
                obscureText: false,
              ),
              Inputtext(
                text: 'Contact',
                controller: _contact,
                keyboardtype: TextInputType.number,
                onEditingcomplete: () => FocusScope.of(context).nextFocus(),
                obscureText: false,
              ),
              Inputtext(
                text: 'Alternate Contact',
                controller: _alternatecontact,
                onEditingcomplete: () => FocusScope.of(context).nextFocus(),
                obscureText: false,
              ),
              Padding(
                padding:  EdgeInsets.all(8.0.w),
                child: Signinbutton(
                  text: 'Add Voter Family',
                  icon: Icons.arrow_forward,
                  maincolor: Colors.blue,
                  Callback: () {
                    familyVooter();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
