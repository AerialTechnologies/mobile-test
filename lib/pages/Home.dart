import 'package:flutter/material.dart';
import 'package:rca/components/cards.dart';
import 'package:rca/singleton/theme.dart';
import 'package:rca/plugins/responsive.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AerialTheme().content.colors.base,
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 5 * Responsive.ratioVerticalMultiplier,
          horizontal: 7 * Responsive.ratioHorizontalMultiplier,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: StatusBackground(
                status: true,
              ),
            ),
            Flexible(flex: 4, child: ContentTile()),
          ],
        ),
      ),
    );
  }
}

class ContentTile extends StatefulWidget {
  const ContentTile({
    Key key,
  }) : super(key: key);

  @override
  _ContentTileState createState() => _ContentTileState();
}

class _ContentTileState extends State<ContentTile> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return AerialCard(
            paddingHorizontal: 4 * Responsive.ratioHorizontalMultiplier,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AerialCardLabel(text: 'a', color: Theme.of(context).hintColor),
                AerialCardTitle('Content $index'),
                AerialCardSubTitle('$index'),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: 5);
  }
}

class StatusBackground extends StatelessWidget {
  final bool status;
  StatusBackground({Key key, this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50 * Responsive.ratioVerticalMultiplier,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: (status)
              ? AssetImage('assets/backgrounds/radar_active.png')
              : AssetImage('assets/backgrounds/radar_inactive.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
