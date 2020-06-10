import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rca/components/homeScreen.dart';
import 'package:rca/singleton/auth.dart';
import 'package:rca/singleton/theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AerialTheme().content.colors.lightGrey,
        body: getstream());
  }

  Widget getstream() {
    Random random = new Random();
    return StreamBuilder(
        stream: Stream.periodic(Duration(seconds: 3))
            .asyncMap((event) => Auth().getStatus()),
        builder: (context, snapshot) {
          // bool isActive = json.decode(snapshot.data.body)["isActive"];

          bool isActive = random.nextBool();
          String activeStatus = isActive ? "I'm Active" : "I'm Inactive";
          String imagePath = isActive
              ? "assets/backgrounds/radar_active.png"
              : "assets/backgrounds/radar_inactive.png";
          String logoImage = isActive
              ? "assets/icons/3.0x/aerial_white.png"
              : "assets/icons/3.0x/aerial_gray.png";
          Color color = isActive
              ? AerialTheme().content.colors.success
              : AerialTheme().content.colors.darkGrey;
          return HomeScreenWidget(
            cardColor: color,
            activeStatus: activeStatus,
            imagePath: imagePath,
            logoPath: logoImage,
          );
        });
  }
}
