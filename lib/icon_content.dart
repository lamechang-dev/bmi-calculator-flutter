import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent(
    {
      @required this.iconData,
      @required this.label,
      @required this.labelTextStyle
    }
  );

  final IconData iconData;
  final String label;
  final TextStyle labelTextStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FaIcon(
            iconData,
            size: 80
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: labelTextStyle,
        )
      ],
    );
  }
}
