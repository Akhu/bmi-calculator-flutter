import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_text.dart';

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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.ideographic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text('cm',
                            style: kNormalLabelTextStyle,
                          )
                        ],
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
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('WEIGHT', style: kNormalLabelTextStyle,),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            children: <Widget>[
                              RoundIconButton(),
                              FloatingActionButton(
                                backgroundColor: kActiveBackgroundCardColor,
                                child: FaIcon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white,
                                ),
                              )
                            ]
                          ),


                        ],
                      ),
                      colour:  kNormalBackgroundCardColor,)
                ),
                Expanded(
                    child: ReusableCard(
                      colour:  kNormalBackgroundCardColor,)
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

class RoundIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0
      ),
      shape: CircleBorder(),
      fillColor: kNormalContentColor,
    );
  }
}


