import 'package:bmi_calculator/components/label_appendice.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/calculator_brain.dart';

import '../components/bottom_button.dart';
import '../components/constants.dart';
import '../components/icon_text.dart';
import '../components/number_value_card.dart';


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
            BottomButton(
              buttonText: 'CALCULATE',
              onTap:  () {
                var calc = CalculatorBrain(height: height, weight: weight);
                calc.calculateBMI();
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(resultText: calc.getResult(), bmiResult: calc.calculateBMI(), interpretationText: calc.getInterpretation(),)));
              },
            )
          ],
        )
    );
  }
}




