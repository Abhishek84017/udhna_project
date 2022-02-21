import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;


class GetAllVoterModel {
  int id;
  int assemblyId;
  int boothId;
  int societyId;
  String regNumber;
  String name;
  String fatherName;
  String houseNumber;
  int age;
  String gender;
  String status;
  String inserted;
  int insertedBy;
  dynamic modified;
  dynamic modifiedBy;
  dynamic entryBoyId;
  String society;

  GetAllVoterModel(
      {this.id,
        this.assemblyId,
        this.boothId,
        this.societyId,
        this.regNumber,
        this.name,
        this.fatherName,
        this.houseNumber,
        this.age,
        this.gender,
        this.status,
        this.inserted,
        this.insertedBy,
        this.modified,
        this.modifiedBy,
        this.entryBoyId,
        this.society});

  GetAllVoterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assemblyId = json['assembly_id'];
    boothId = json['booth_id'];
    societyId = json['society_id'];
    regNumber = json['reg_number'];
    name = json['name'];
    fatherName = json['father_name'];
    houseNumber = json['house_number'];
    age = json['age'];
    gender = json['gender'];
    status = json['status'];
    inserted = json['inserted'];
    insertedBy = json['inserted_by'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    entryBoyId = json['entry_boy_id'];
    society = json['society'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['assembly_id'] = assemblyId;
    data['booth_id'] = boothId;
    data['society_id'] = societyId;
    data['reg_number'] = regNumber;
    data['name'] = name;
    data['father_name'] = fatherName;
    data['house_number'] = houseNumber;
    data['age'] = age;
    data['gender'] = gender;
    data['status'] = status;
    data['inserted'] = inserted;
    data['inserted_by'] = insertedBy;
    data['modified'] = modified;
    data['modified_by'] = modifiedBy;
    data['entry_boy_id'] = entryBoyId;
    data['society'] = society;
    return data;
  }
}

class GetAllVoter extends StatefulWidget {
  const GetAllVoter({Key key}) : super(key: key);

  @override
  _GetAllVoterState createState() => _GetAllVoterState();
}

class _GetAllVoterState extends State<GetAllVoter> {
  List<GetAllVoterModel> data = <GetAllVoterModel>[];

  bool _isloding = true;

  void getAllVoters() async {
    final response = await http
        .get(Uri.parse('https://votersmanagement.com/api/get-all-voters'));
    try {
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData != null) {
          jsonData.forEach((v) {
            data.add(GetAllVoterModel.fromJson(v));
          });
        }
      }
    } on SocketException catch (_) {
      Fluttertoast.showToast(
          msg: 'Internet Not Connected', backgroundColor: Colors.black);
    } catch (_) {
      Fluttertoast.showToast(
          msg: 'Something went wrong', backgroundColor: Colors.black);
    }
    setState(() => _isloding = false);
  }

  @override
  void initState() {
    super.initState();
    getAllVoters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All voter list'),
        automaticallyImplyLeading: false,
      ),
      body: _isloding
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, int index) {
                var item = data[index];
                int number = ++index;
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.w))),
                    child: ExpansionTile(
                      leading: Text(number.toString() ?? ''),
                      title: Text(item.name ?? ''),
                      subtitle: Text(item.regNumber ?? ''),
                      children: [ListTile(title:Padding(
                        padding:  EdgeInsets.only(left:50.w),
                        child: Text('Society Name :${item.society} ',style: const TextStyle(fontWeight: FontWeight.bold),),
                      ))],
                    ),
                  ),
                );
              },
              itemCount: data.length,
            ),
    );
  }
}
