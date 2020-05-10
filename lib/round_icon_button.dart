import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

class RoundIconButton extends StatelessWidget {
  final Function onPressed;

  final IconData icon;


  RoundIconButton({this.onPressed, this.icon});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0
      ),
      shape: CircleBorder(),
      child: FaIcon(
          icon
      ),
      fillColor: kNormalContentColor,
    );
  }
}