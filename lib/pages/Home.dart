import 'package:flutter/material.dart';
import 'package:rca/components/cards.dart';
import 'package:rca/components/contentTiles.dart';
import 'package:rca/components/texts.dart';
import 'package:rca/plugins/responsive.dart';
import 'package:rca/singleton/theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AerialTheme().content.colors.lightGrey,
        body: _buildFrontScreen(context));
  }

  Widget _buildFrontScreen(BuildContext context) {
    return Stack(
      children: <Widget>[_buildMergeScreen(context), _buildHeader()],
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

  Widget _buildMergeScreen(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildBackgroud(context),
        Container(
          height: 200 * Responsive.ratioVerticalMultiplier,
          child: _builContentList(),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Column(
      children: <Widget>[
        _buildRadarBackground(),
        _buildImage(),
      ],
    );
  }

  Widget _buildRadarImage() {
    return Container(
      height: 40 * Responsive.ratioVerticalMultiplier,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/backgrounds/radar_active.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildHouseIcon() {
    return Positioned.fill(
        child: Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              height: 8 * Responsive.ratioVerticalMultiplier,
              padding: EdgeInsets.only(top: 32),
              child: Icon(
                Icons.home,
                color: AerialTheme().content.colors.white,
                size: 40,
              )),
          _buildActiveStatus()
        ],
      ),
    ));

    // _buildActiveStatus()
  }

  Widget _buildActiveStatus() {
    return Container(
      width: 100,
      height: 40,
      child: AerialCard(
        dark: false,
        child: AerialCardLabel(
          color: AerialTheme().content.colors.black,
          text: "I'm Active",
        ),
      ),
    );
  }

  Widget _buildRadarBackground() {
    return Stack(
      children: <Widget>[
        _buildRadarImage(),
      ],
    );
  }

  Widget _buildImage() {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            height: 120,
            width: 120,
            child: Image.asset("assets/icons/3.0x/aerial_white.png")));
  }

  Widget _builContentList() {
    return ListView.builder(
        padding: EdgeInsets.only(top: 320),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return ContentTile(
            title: "Title",
            content: "Content",
            details: "Details",
            link: "Links",
          );
        });
  }
}
