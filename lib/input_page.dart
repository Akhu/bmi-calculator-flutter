import 'package:bmi_calculator/label_appendice.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_text.dart';
import 'number_value_card.dart';

const bottomContainerHeight = 92.0;
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  male,
  female
}

class _InputPageState extends State<InputPage> {

  Gender currentSelectedGender;
  int height = 160;
  int weight = 60;
  int age = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(child:
            Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onTapAction: () {
                      setState(() {
                        currentSelectedGender = Gender.female;
                      });
                    },
                    colour:  currentSelectedGender == Gender.female ? kActiveBackgroundCardColor : kNormalBackgroundCardColor,
                    cardChild: IconText(
                      colour: currentSelectedGender == Gender.female ? kActiveContentColor : kNormalContentColor,
                      iconType: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                      onTapAction: () {
                        setState(() {
                          currentSelectedGender = Gender.male;
                        });
                      },
                      colour:  currentSelectedGender == Gender.male ? kActiveBackgroundCardColor : kNormalBackgroundCardColor,
                      cardChild: IconText(
                        colour: currentSelectedGender == Gender.male ? kActiveContentColor : kNormalContentColor,
                        iconType: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    )
                ),
              ],
            )),
            Expanded(
                child: ReusableCard(
                  colour:  kNormalBackgroundCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('HEIGHT',
                        style: kNormalLabelTextStyle.copyWith(
                          color: kNormalContentColor
                        ),
                      ),
                      LabelAppendix(
                        value: height.toString(),
                        appendix: 'cm',
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Slider(
                          min: 100,
                          max: 220,
                          value: height.toDouble(),
                          onChanged: (newValue){
                            //print(newValue);
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                    ],
                  )
                )
            ),
            Expanded(child:
            Row(
              children: <Widget>[
                Expanded(
                    child: NumberValueCard(
                      number: weight,
                      numberAppendix: 'kg',
                      numberLabel: 'WEIGHT',
                      functionPlus: (){
                        setState(() {
                          weight++;
                        });
                      },
                      functionMinus: (){
                        setState(() {
                          weight--;
                        });
                      },
                    )
                ),
                Expanded(
                    child: NumberValueCard(
                      number: age,
                      numberAppendix: 'yo',
                      numberLabel: 'AGE',
                      functionPlus: (){
                        setState(() {
                          age++;
                        });
                      },
                      functionMinus: (){
                        setState(() {
                          age--;
                        });
                      },
                    )
                ),
              ],
            )),
            Container(
              color: kAccentColor,
              margin: EdgeInsets.only(top: 10.0),
              height: bottomContainerHeight,
              width: double.infinity,
            )
          ],
        )
    );
  }
}




