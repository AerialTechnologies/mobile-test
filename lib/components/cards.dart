import 'package:flutter/material.dart';
import 'package:rca/plugins/responsive.dart';
import 'package:rca/singleton/theme.dart';

class AerialCard extends StatelessWidget {
  final double paddingHorizontal;
  final double paddingVertical;
  final double borderRadius;
  final Widget child;
  final bool dark;

  AerialCard({
    this.borderRadius = 15.0,
    this.paddingHorizontal = 16,
    this.paddingVertical = 25,
    this.dark = false,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(this.borderRadius),
      ),
      color: dark
          ? AerialTheme().content.colors.darkBase
          : AerialTheme().content.colors.white,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal,
          vertical: paddingVertical,
        ),
        child: this.child,
      ),
    );
  }
}

class AerialCardLabel extends StatelessWidget {
  final Color color;
  final String text;

  AerialCardLabel({
    @required this.text,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: Responsive.ratioVerticalMultiplier,
        horizontal: 3.5 * Responsive.ratioHorizontalMultiplier,
      ),
      child: Text(
        this.text,
        style: TextStyle(
          fontSize: 1.75 * Responsive.ratioVerticalMultiplier,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

class AerialCardTitle extends StatelessWidget {
  final String text;
  final bool inverted;

  AerialCardTitle(this.text, {this.inverted = false});

  @override
  Widget build(BuildContext context) {
    TextStyle style = AerialTheme().content.cardTitle.copyWith(
          fontSize: 2 * Responsive.ratioVerticalMultiplier,
          color: inverted
              ? AerialTheme().content.colors.white
              : AerialTheme().content.colors.black,
        );

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 1.5 * Responsive.ratioVerticalMultiplier,
      ),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}

class AerialCardSubTitle extends StatelessWidget {
  final String text;
  final bool inverted;

  AerialCardSubTitle(this.text, {this.inverted = false});

  @override
  Widget build(BuildContext context) {
    TextStyle style = AerialTheme().content.cardTitle.copyWith(
          fontSize: 2 * Responsive.ratioVerticalMultiplier,
          fontWeight: FontWeight.normal,
          color: inverted
              ? AerialTheme().content.colors.white
              : AerialTheme().content.colors.black,
        );

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 1.5 * Responsive.ratioVerticalMultiplier,
      ),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
