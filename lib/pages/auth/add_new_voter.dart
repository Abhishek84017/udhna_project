import 'dart:convert';
import 'dart:io';
import 'package:avt_yuwas/pages/widgets/circularindicator.dart';
import 'package:avt_yuwas/pages/widgets/signinbutton.dart';
import 'package:avt_yuwas/pages/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import '../../constants/global.dart';


class AddVoterModel {
  int assembly;
  int booth;
  int society;
  String regNumber;
  String name;
  String fatherName;
  String houseNumber;
  int age;
  String gender;

  AddVoterModel(
      {this.assembly,
      this.booth,
      this.society,
      this.regNumber,
      this.name,
      this.fatherName,
      this.houseNumber,
      this.age,
      this.gender});

  AddVoterModel.fromJson(Map<String, dynamic> json) {
    assembly = json['assembly'];
    booth = json['booth'];
    society = json['society'];
    regNumber = json['reg_number'];
    name = json['name'];
    fatherName = json['father_name'];
    houseNumber = json['house_number'];
    age = json['age'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['assembly'] = assembly;
    data['booth'] = booth;
    data['society'] = society;
    data['reg_number'] = regNumber;
    data['name'] = name;
    data['father_name'] = fatherName;
    data['house_number'] = houseNumber;
    data['age'] = age;
    data['gender'] = gender;
    return data;
  }
}

class AddNewVoter extends StatefulWidget {
  const AddNewVoter({Key key}) : super(key: key);

  @override
  _AddNewVoterState createState() => _AddNewVoterState();
}

class _AddNewVoterState extends State<AddNewVoter> {


  void addVoter() async {
     final List<String> items = kSharedPreferences.getStringList('AllId');
     if (_vottername.text.isEmpty ||
        _fathername.text.isEmpty ||
        _mobile.text.isEmpty ||
        _housenumber.text.isEmpty ||
        _age.text.isEmpty ||
        genderValue.isEmpty) {
      Fluttertoast.showToast(
          msg: 'All fields are requiredd', backgroundColor: Colors.red);
      addvoter = true;
      return;
    }

    if (!RegExp(r"^(?:[+0]9)?[0-9]{10}$").hasMatch(_mobile.text)) {
      Fluttertoast.showToast(
          msg: 'Invalid mobile number', backgroundColor: Colors.red);
      addvoter = true;
      return;
    }
    var b = int.parse(_age.text);
    if(b < 18 )
      {
        Fluttertoast.showToast(msg: 'Age must be 18',backgroundColor: Colors.black);
        addvoter = true;
        return;
      }
    var data = <String, dynamic>{
      "assembly": items[0],
      "booth": items[1],
      "society": items[2],
      "reg_number": _mobile.text,
      "name": _vottername.text,
      "father_name": _fathername.text,
      "house_number": _housenumber.text,
      "age": _age.text,
      "gender": genderValue,
    };
    final response = await http.post(
        Uri.https('votersmanagement.com', '/api/create-voter'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data));

    try {
      if (response.statusCode == 200) {
        setState(() {
          addvoter = true;
        });
        Fluttertoast.showToast(
            msg: 'New Vooter ADDED', backgroundColor: Colors.black);
        _vottername.clear();
        _fathername.clear();
        _mobile.clear();
        _housenumber.clear();
        _age.clear();
      }
    } on SocketException catch (_) {
      Fluttertoast.showToast(
          msg: 'no internet connection', backgroundColor: Colors.black);
    } catch (_) {

      Fluttertoast.showToast(msg: 'something went worng');
    }
  }

  final TextEditingController _vottername = TextEditingController();
  final TextEditingController _fathername = TextEditingController();
  final TextEditingController _mobile = TextEditingController();
  final TextEditingController _housenumber = TextEditingController();
  final TextEditingController _age = TextEditingController();

  String genderValue = '';

  bool addvoter = true;

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
                  keyboardtype: TextInputType.number,
                  onEditingcomplete: () => FocusScope.of(context).nextFocus(),
                  obscureText: false,
                ),
                Inputtext(
                  text: 'House Number',
                  controller: _housenumber,
                  onEditingcomplete: () => FocusScope.of(context).nextFocus(),
                  obscureText: false,
                ),
                Inputtext(
                  text: 'Age',
                  controller: _age,
                  keyboardtype: TextInputType.number,
                  onEditingcomplete: () => FocusScope.of(context).unfocus(),
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
             addvoter == true ?   Padding(
                  padding:  EdgeInsets.all(8.0.w),
                  child: SignInButton(
                    text: 'Add Voter',
                    icon: Icons.arrow_forward,
                    maincolor: Colors.blue,
                    callback: () {
                      setState(() {
                        addvoter = false;
                      });
                      addVoter();
                    },
                  ),
                ) : const CircularIndicator()
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
