import 'package:flutter/material.dart';
// INTERNAL
import 'package:rca/models/theme.dart';

AerialColor aerialColor = AerialColor(
  base: Color(0XFF4E37B2),
  darkBase: Color(0XFF1C1246),
  primary: Color(0XFFA79BD8),
  white: Color(0XFFFFFFFF),
  stroke: Color(0XFFD1CEDE),
  darkBackground: Color(0XFF49416B),
  darkLabel: Color(0XFF342C53),
  darkGrey: Color(0XFF8A8A8A),
  lightGrey: Color(0XFFF5F4FF),
  success: Color(0XFF06D8B2),
  warning: Color(0XFFFF7750),
  notification: Color(0XFFFF7047),
  secondary: Color(0XFF8A8A8A),
);

AerialContent aerial = AerialContent(
  btnText: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  ),
  tagText: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  ),
  cardTitle: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  ),
  cardSubtitle: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  ),
  body: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  ),
  h1: TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w800,
    color: AerialColor().black,
  ),
  h2: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w800,
  ),
  h3: TextStyle(
    fontSize: 14,
  ),
  helpText: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
  axisTitle: TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
  ),
  link: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: aerialColor.base,
  ),
  colors: aerialColor,
);
