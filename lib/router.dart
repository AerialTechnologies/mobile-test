import 'package:flutter/material.dart';
// INTERNAL
import 'package:rca/pages/Home.dart';
import 'package:rca/pages/Login.dart';

Map<String, Widget Function(BuildContext)> routes = {
  'homePage': (context) => HomePage(),
  'loginPage': (context) => LoginPage(),
};
