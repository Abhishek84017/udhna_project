import 'dart:convert';
import 'package:avt_yuwas/get_allvoters.dart';
import 'package:avt_yuwas/seachsociety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'signinbutton.dart';
import 'pageroute.dart';
import 'pdfviewer.dart';
import 'package:http/http.dart' as http;

class AssemblyModel {
  int id;
  String title;
  String status;
  String inserted;
  int insertedBy;
  dynamic modified;
  dynamic modifiedBy;

  AssemblyModel(
      {this.id,
      this.title,
      this.status,
      this.inserted,
      this.insertedBy,
      this.modified,
      this.modifiedBy});

  AssemblyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    inserted = json['inserted'];
    insertedBy = json['inserted_by'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['status'] = status;
    data['inserted'] = inserted;
    data['inserted_by'] = insertedBy;
    data['modified'] = modified;
    data['modified_by'] = modifiedBy;
    return data;
  }
}

class BoothModel {
  int id;
  int assemblyId;
  String title;
  String pollingLocation;
  String pollingNumber;
  String status;
  String inserted;
  int insertedBy;
  dynamic modified;
  dynamic modifiedBy;

  BoothModel(
      {this.id,
      this.assemblyId,
      this.title,
      this.pollingLocation,
      this.pollingNumber,
      this.status,
      this.inserted,
      this.insertedBy,
      this.modified,
      this.modifiedBy});

  BoothModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assemblyId = json['assembly_id'];
    title = json['title'];
    pollingLocation = json['polling_location'];
    pollingNumber = json['polling_number'];
    status = json['status'];
    inserted = json['inserted'];
    insertedBy = json['inserted_by'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['assembly_id'] = assemblyId;
    data['title'] = title;
    data['polling_location'] = pollingLocation;
    data['polling_number'] = pollingNumber;
    data['status'] = status;
    data['inserted'] = inserted;
    data['inserted_by'] = insertedBy;
    data['modified'] = modified;
    data['modified_by'] = modifiedBy;
    return data;
  }
}

class SocityModel {
  int id;
  int assemblyId;
  int boothId;
  String title;
  dynamic address;
  String nameFile;
  String status;
  String inserted;
  int insertedBy;
  String modified;
  int modifiedBy;
  String entryDone;

  SocityModel(
      {this.id,
      this.assemblyId,
      this.boothId,
      this.title,
      this.address,
      this.nameFile,
      this.status,
      this.inserted,
      this.insertedBy,
      this.modified,
      this.modifiedBy,
      this.entryDone});

  SocityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assemblyId = json['assembly_id'];
    boothId = json['booth_id'];
    title = json['title'];
    address = json['address'];
    nameFile = json['name_file'];
    status = json['status'];
    inserted = json['inserted'];
    insertedBy = json['inserted_by'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    entryDone = json['entry_done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['assembly_id'] = assemblyId;
    data['booth_id'] = boothId;
    data['title'] = title;
    data['address'] = address;
    data['name_file'] = nameFile;
    data['status'] = status;
    data['inserted'] = inserted;
    data['inserted_by'] = insertedBy;
    data['modified'] = modified;
    data['modified_by'] = modifiedBy;
    data['entry_done'] = entryDone;
    return data;
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<AssemblyModel> assemblyData = <AssemblyModel>[];
  List<AssemblyModel> assembly = <AssemblyModel>[];
  List<BoothModel> boothData = <BoothModel>[];
  List<BoothModel> booth = <BoothModel>[];
  List<SocityModel> socityData = <SocityModel>[];
  List<SocityModel> dataSocity = <SocityModel>[];

  String defaultAssembly;
  String defaultBooth;
  String defaultSociety;
  String boothLocation;
  String boothNumber;

  void fetchAssembly() async {
    final response = await http.get(
        Uri.parse('https://www.votersmanagement.com/api/get-all-assembly'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData != null) {
        jsonData.forEach((v) {
          assemblyData.add(AssemblyModel.fromJson(v));
        });
      }
      if (assemblyData.isNotEmpty) {
        defaultAssembly = assemblyData.first.title;
      }
      setState(() {});
    }
  }

  void fetchBooth() async {
    boothData.clear();

    print(assembly[0].id);
    final response = await http.get(Uri.parse(
        'https://www.votersmanagement.com/api/get-assembly-booth/${assembly[0].id}'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData != null) {
        jsonData.forEach((v) {
          boothData.add(BoothModel.fromJson(v));
        });
      }
      print(boothData.map((e) => e.title).toList());
      setState(() {
        if (boothData.isNotEmpty) {
          defaultBooth = boothData.first.title;
        }
      });
    }
  }

  void fetchSocity() async {
    socityData.clear();
    final response = await http.get(Uri.parse(
        'https://votersmanagement.com/api/get-booth-society/${booth[0].id}'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData != null) {
        jsonData.forEach((v) {
          socityData.add(SocityModel.fromJson(v));
        });
      }

      setState(() {
        if (socityData.isNotEmpty) {
          defaultSociety = dataSocity.first.title;
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAssembly();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Society'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              margin: const EdgeInsets.only(left: 15),
              width: double.infinity,
              child: const Text(
                'Select Assembly:',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                hint: const Text('Select Assembly'),
                value: defaultAssembly,
                isDense: false,
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down),
                iconSize: 30,
                items: assemblyData.map((items) {
                  return DropdownMenuItem(
                      value: items.title, child: Text(items.title));
                }).toList(),
                onChanged: (String newValue) {
                  defaultAssembly = newValue;
                  assembly = assemblyData
                      .where((element) => element.title == defaultAssembly)
                      .toList();
                  boothLocation ='';
                  boothNumber = '';
                  fetchBooth();
                },
              ),
            ),
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15),
                width: double.infinity,
                child: const Text(
                  'Select Booth:',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    hint: const Text('Select Booth'),
                    value: defaultBooth,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: boothData.map((items) {
                      return DropdownMenuItem(
                          value: items.title, child: Text(items.title));
                    }).toList(),
                    onChanged: (String newValue) {
                      defaultBooth = newValue;
                      booth = boothData
                          .where((element) => element.title == defaultBooth)
                          .toList();
                      if (booth != null) {
                        boothLocation = booth[0].pollingLocation;
                        boothNumber = booth[0].pollingNumber;
                      }
                      fetchSocity();
                    },
                    onTap: () {},
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15),
                width: double.infinity,
                child: const Text(
                  'Selected Booth Address:',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.w),
                  border: Border.all(color: Colors.black, width: 2.w),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(boothLocation ?? ''),
                      Text(
                        boothNumber ?? '',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15),
                width: double.infinity,
                child: const Text(
                  'Select Society:',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    hint: const Text('Select Society'),
                    value: defaultSociety,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: socityData.map((items) {
                      return DropdownMenuItem(
                          value: items.title, child: Text(items.title));
                    }).toList(),
                    onChanged: (String newValue) {
                      setState(() {
                        defaultSociety = newValue;
                        final society = socityData
                            .where((element) => element.title == defaultSociety)
                            .toList();
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Signinbutton(
            text: 'See Voters',
            maincolor: Colors.blue,
            Callback: () {
              Navigator.push(context, RotationRoute(page: pdfviweer()));
            },
          ),
        ],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 100.h,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Voter Management Service',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('All Voters List'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context, RotationRoute(page: const GetAllVoter()));
              },
            ),
             ListTile(
              title: const Text('search society'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, RotationRoute(page: const SeachSociety()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
