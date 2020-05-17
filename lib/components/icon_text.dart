import 'package:bmi_calculator/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const iconSize = 80.0;
const spacing = 15.0;

class IconText extends StatelessWidget {
  final IconData iconType;
  final String label;
  final Color colour;

  IconText({@required this.iconType, @required this.label, @required this.colour});

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FaIcon(
          iconType,
          size: iconSize,
          color: colour,
        ),
        SizedBox(
          height: spacing,
        ),
        Text(label, style: kNormalLabelTextStyle.copyWith(
          color: colour
        ))
      ],
    );
  }
}