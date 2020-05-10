import 'package:bmi_calculator/label_appendice.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

class NumberValueCard extends StatelessWidget {

  final int number;

  final Function functionMinus;

  final Function functionPlus;
  final String numberAppendix;
  final String numberLabel;

  const NumberValueCard({this.number, this.functionMinus, this.functionPlus, this.numberAppendix, this.numberLabel});

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      cardChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(numberLabel, style: kNormalLabelTextStyle,),
          LabelAppendix(
            value: number.toString(),
            appendix: numberAppendix,
          ),
          SizedBox(
            height: 24.0,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundIconButton(
                  icon: FontAwesomeIcons.minus,
                  onPressed: functionMinus,
                ),
                SizedBox(
                  width: 20.0,
                ),
                RoundIconButton(
                  icon: FontAwesomeIcons.plus,
                  onPressed: functionPlus
                ),
              ]
          ),


        ],
      ),
      colour:  kNormalBackgroundCardColor,);
  }
}
