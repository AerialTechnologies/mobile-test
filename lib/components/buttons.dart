import 'package:flutter/material.dart';

// INTERNAL
import 'package:rca/singleton/theme.dart';
import 'package:rca/plugins/responsive.dart';

class AerialButton extends StatelessWidget {
  final Function onPressed;
  final Widget child;
  final bool inverted;
  final Color color;

  AerialButton({
    @required this.onPressed,
    @required this.child,
    this.inverted = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: inverted ? invertedButton(context) : regularButton(context),
      width: double.infinity,
    );
  }

  Widget regularButton(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onPressed: this.onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 2 * Responsive.ratioVerticalMultiplier,
        ),
        child: child,
      ),
      color: color ?? AerialTheme().content.colors.base,
    );
  }

  Widget invertedButton(BuildContext context) {
    return OutlineButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onPressed: this.onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 2 * Responsive.ratioVerticalMultiplier,
        ),
        child: child,
      ),
      color: color ?? AerialTheme().content.colors.base,
    );
  }
}
