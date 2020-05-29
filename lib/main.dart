import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// INTERNAL
import 'package:rca/app.dart';
import 'package:rca/theme.dart';
import 'package:rca/plugins/responsive.dart';
import 'package:rca/singleton/auth.dart';
import 'package:rca/singleton/theme.dart';

Future main() async {
  new AerialTheme().init(theme: aerial);
  new Auth();

  WidgetsFlutterBinding.ensureInitialized();

  // Device orientations list is limited to portrait
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            Responsive().init(constraints, orientation);
            return AerialApp();
          },
        );
      },
    ),
  );
}
