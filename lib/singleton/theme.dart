import 'package:rca/models/theme.dart';

class AerialTheme {
  static final AerialTheme _instance = AerialTheme._internal();
  static final AerialColor aerialColor = AerialColor();
  static final AerialContent aerialContent = AerialContent();

  AerialContent content;

  void init({AerialContent theme}) {
    content = theme;
  }

  factory AerialTheme() => _instance;
  AerialTheme._internal();
}
