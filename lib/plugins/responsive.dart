import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Responsive {
  static double _screenWidth;
  static double _screenHeight;
  static double _screenRatioHorizontal = 0;
  static double _screenRatioVertical = 0;

  static double ratioVerticalMultiplier;
  static double ratioHorizontalMultiplier;
  static double ratioAspectMultiplier;

  void init(BoxConstraints constraints, Orientation orientation) {
    final bool isPortraitOriented = orientation == Orientation.portrait;

    _screenWidth =
        isPortraitOriented ? constraints.maxWidth : constraints.maxHeight;
    _screenHeight =
        isPortraitOriented ? constraints.maxHeight : constraints.maxWidth;

    _screenRatioHorizontal = _screenWidth / 100;
    _screenRatioVertical = _screenHeight / 100;

    ratioVerticalMultiplier = _screenRatioVertical;
    ratioHorizontalMultiplier = _screenRatioHorizontal;
    ratioAspectMultiplier = _screenHeight / _screenWidth;
  }
}
