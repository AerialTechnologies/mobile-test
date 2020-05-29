import 'package:flutter/material.dart';
// INTERNAL
import 'package:rca/singleton/theme.dart';
import 'package:rca/plugins/responsive.dart';

class AerialH1 extends StatelessWidget {
  final String text;
  final bool inverted;

  AerialH1(this.text, {this.inverted = false});

  @override
  Widget build(BuildContext context) {
    TextStyle style = AerialTheme().content.h1.copyWith(
          fontSize: 3 * Responsive.ratioVerticalMultiplier,
          color: inverted
              ? AerialTheme().content.colors.white
              : AerialTheme().content.colors.black,
        );

    return Text(
      text,
      style: style,
    );
  }
}

class AerialH2 extends StatelessWidget {
  final String text;
  final bool inverted;

  AerialH2(this.text, {this.inverted = false});

  @override
  Widget build(BuildContext context) {
    TextStyle style = AerialTheme().content.h2.copyWith(
          fontSize: 2.5 * Responsive.ratioVerticalMultiplier,
          color: inverted
              ? AerialTheme().content.colors.black
              : AerialTheme().content.colors.base,
        );

    return Text(
      text,
      style: style,
    );
  }
}

class AerialH3 extends StatelessWidget {
  final String text;
  final bool inverted;
  final bool bold;

  AerialH3(this.text, {this.inverted = false, this.bold = true});

  @override
  Widget build(BuildContext context) {
    TextStyle style = AerialTheme().content.h3.copyWith(
          fontSize: 2.2 * Responsive.ratioVerticalMultiplier,
          color: inverted
              ? AerialTheme().content.colors.white
              : AerialTheme().content.colors.black,
          fontWeight: this.bold ? FontWeight.bold : FontWeight.normal,
        );

    return Text(
      text,
      style: style,
    );
  }
}

class AerialBody extends StatelessWidget {
  final String text;
  final bool inverted;
  final bool bold;
  final Color color;

  AerialBody(
    this.text, {
    this.color = Colors.black,
    this.inverted = false,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle style = AerialTheme().content.body.copyWith(
          fontSize: 1.8 * Responsive.ratioVerticalMultiplier,
          fontWeight: bold ? FontWeight.bold : null,
          color: inverted
              ? AerialTheme().content.colors.white
              : AerialTheme().content.colors.black,
        );

    return Text(
      text,
      style: style,
    );
  }
}

class AerialButtonText extends StatelessWidget {
  final String text;
  final bool inverted;

  AerialButtonText(this.text, {this.inverted = false});

  @override
  Widget build(BuildContext context) {
    TextStyle style = AerialTheme().content.btnText.copyWith(
          fontSize: 2 * Responsive.ratioVerticalMultiplier,
          color: inverted
              ? AerialTheme().content.colors.base
              : AerialTheme().content.colors.white,
        );

    return Text(
      text,
      style: style,
    );
  }
}
