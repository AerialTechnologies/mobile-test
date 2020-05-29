import 'package:flutter/material.dart';

class AerialColor {
  final Color base;
  final Color darkBase;
  final Color primary;
  final Color secondary;
  final Color white;
  final Color darkBackground;
  final Color darkLabel;
  final Color stroke;
  final Color darkGrey;
  final Color lightGrey;
  final Color success;
  final Color black;
  final Color notification;
  final Color warning;

  AerialColor({
    this.base,
    this.darkBase,
    this.primary,
    this.secondary,
    this.white,
    this.darkBackground,
    this.darkLabel,
    this.stroke,
    this.darkGrey,
    this.lightGrey,
    this.success,
    this.black,
    this.warning,
    this.notification,
  });
}

class AerialContent {
  final TextStyle btnText;
  final TextStyle tagText;
  final TextStyle cardTitle;
  final TextStyle cardSubtitle;
  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle body;
  final TextStyle link;
  final TextStyle helpText;
  final TextStyle axisTitle;
  final AerialColor colors;

  AerialContent({
    this.btnText,
    this.tagText,
    this.cardTitle,
    this.cardSubtitle,
    this.body,
    this.h1,
    this.h2,
    this.h3,
    this.link,
    this.helpText,
    this.axisTitle,
    this.colors,
  });
}
