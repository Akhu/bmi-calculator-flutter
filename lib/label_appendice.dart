import 'package:flutter/material.dart';
import 'constants.dart';

class LabelAppendix extends StatelessWidget {

  final String value;
  final String appendix;

  const LabelAppendix({Key key, this.value, this.appendix}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.ideographic,
      children: <Widget>[
        Text(value,
          style: kNumberTextStyle,
        ),
        Text(appendix,
          style: kNormalLabelTextStyle,
        )
      ],
    );
  }
}
