import 'package:flutter/material.dart';
import 'package:technewzapp/pages/home.dart';
import 'package:technewzapp/utils/colors.dart';
import 'package:technewzapp/utils/text.dart';

import '../backend/functions.dart';
import '../components/appbar.dart';
import '../utils/colors.dart';

import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark, primaryColor: AppColors.primary),
      home: Home(),
    );
  }
}
