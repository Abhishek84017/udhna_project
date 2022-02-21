import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';
import 'constants/global.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  kSharedPreferences = await SharedPreferences.getInstance();

  runApp( const MyApp());
}
