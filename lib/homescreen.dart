import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'signinbutton.dart';
import 'pageroute.dart';
import 'pdfviewer.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var defaultAssembly = 'Majura';
  var assemblyList = ['Majura','Athwa'];
  var defaultBooth = 'Athwaline 1';
  var boothList = ['Athwaline 1','Athwaline 2','Athwaline 3'];
  var defaultSociety = 'Ravitej Apartment';
  var societyList = ['Ravitej Apartment','Shivam Apartment','Ravi Jyot Apartment'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Society'),
      ),
      body:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:25),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(child: const Text('Select Booth Assembly :')),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal:15,vertical: 5),
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton(
                          value: defaultAssembly,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items:assemblyList.map((String items) {
                            return DropdownMenuItem(
                                value: items,
                                child: Text(items)
                            );
                          }
                          ).toList(),
                          onChanged: (String newValue){
                            setState(() {
                              defaultAssembly = newValue;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(child: const Text('Select Booth :')),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal:15,vertical: 5),
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton(
                          value: defaultBooth,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items:boothList.map((String items) {
                            return DropdownMenuItem(
                                value: items,
                                child: Text(items)
                            );
                          }
                          ).toList(),
                          onChanged: (String newValue){
                            setState(() {
                              defaultBooth = newValue;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(child: const Text('Select Society')),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal:15,vertical: 5),
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton(
                          value: defaultSociety,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items:societyList.map((String items) {
                            return DropdownMenuItem(
                                value: items,
                                child: Text(items)
                            );
                          }
                          ).toList(),
                          onChanged: (String newValue){
                            setState(() {
                              defaultSociety = newValue;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Signinbutton(
            text: 'See Voters',
            maincolor: Colors.blue,
            Callback: () {
              Navigator.push(context, RotationRoute(page:pdfviweer()));
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
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Drawer Content'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(''),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
