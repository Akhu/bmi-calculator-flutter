import 'package:flutter/material.dart';

import 'constants.dart';

class BottomButton extends StatelessWidget {

  final String buttonText;
  final Function onTap;
  const BottomButton({@required this.buttonText, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kAccentColor,
        child: Center(
          child: Text(
            buttonText,
            style: kLargeButtonTextStyle,
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 10.0),
        height: bottomContainerHeight,
        width: double.infinity,
      ),
    );
  }
}
