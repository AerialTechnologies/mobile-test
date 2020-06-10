import 'package:flutter/material.dart';
import 'package:rca/components/cards.dart';
import 'package:rca/components/contentTiles.dart';
import 'package:rca/plugins/responsive.dart';
import 'package:rca/singleton/theme.dart';

class HomeScreenWidget extends StatelessWidget {
  final String activeStatus;
  final String imagePath;
  final String logoPath;
  final Color cardColor;
  HomeScreenWidget({
    this.activeStatus,
    this.cardColor,
    this.imagePath,
    this.logoPath,
  });
  @override
  Widget build(BuildContext context) {
    return _buildFrontScreen(context);
  }

  Widget _buildFrontScreen(
    BuildContext context,
  ) {
    return Stack(
      children: <Widget>[
        _buildBackgroud(context),
        _buildHeader(),
        _builContentList()
      ],
    );
  }

  Widget _buildBackgroud(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 5 * Responsive.ratioVerticalMultiplier,
        horizontal: 7 * Responsive.ratioHorizontalMultiplier,
      ),
      decoration: BoxDecoration(
        color: AerialTheme().content.colors.base,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      height: 50 * Responsive.ratioVerticalMultiplier,
      width: MediaQuery.of(context).size.width,
    );
  }

  Widget _buildHeader() {
    return Column(
      children: <Widget>[_buildImage(), _buildRadarBackground()],
    );
  }

  Widget _buildImage() {
    return Align(
        alignment: Alignment.topCenter,
        child:
            Container(height: 120, width: 120, child: Image.asset(logoPath)));
  }

  Widget _buildRadarBackground() {
    return Stack(
      children: <Widget>[_buildRadarImage(), _buildHouseIcon()],
    );
  }

  Widget _buildRadarImage() {
    return Container(
      height: 30 * Responsive.ratioVerticalMultiplier,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildActiveStatus() {
    return Container(
        width: 120,
        height: 40,
        child: Center(
            child: AerialCard(
          paddingVertical: 5,
          color: cardColor,
          child: Text(
            activeStatus,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        )));
  }

  Widget _buildHouseIcon() {
    return Positioned.fill(
        child: Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              child: Icon(
            Icons.home,
            color: AerialTheme().content.colors.white,
            size: 30,
          )),
          _buildActiveStatus()
        ],
      ),
    ));

    // _buildActiveStatus()
  }

  //ListView Contents.
  Widget _builContentList() {
    return ListView.builder(
        padding: EdgeInsets.only(top: 45 * Responsive.ratioVerticalMultiplier),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              padding: EdgeInsets.all(8),
              child: ContentTile(
                title: "Title",
                content: "Content",
                details: "Details",
                link: "Links",
              ));
        });
  }
}
