import 'package:flutter/material.dart';
import 'package:rca/components/texts.dart';
import 'package:rca/singleton/theme.dart';

import 'cards.dart';

class ContentTile extends StatelessWidget {
  final String title;
  final String details;
  final String content;
  final String link;
  ContentTile(
      {@required this.title,
      @required this.details,
      @required this.content,
      @required this.link});
  @override
  Widget build(BuildContext context) {
    return _buildTileView();
  }

  Widget _buildTileView() {
    return AerialCard(
      child: _buildComponent(),
    );
  }

  Widget _buildComponent() {
    return Column(
      children: <Widget>[
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
                width: 100,
                height: 40,
                child: AerialCard(
                  paddingVertical: 5,
                  color: AerialTheme().content.colors.notification,
                  child: Text(
                    title,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ))),
        Align(alignment: Alignment.centerLeft, child: AerialH2(content)),
        Align(alignment: Alignment.centerLeft, child: AerialH3(details)),
        Align(alignment: Alignment.centerLeft, child: AerialH3(link))
      ],
    );
  }
}
