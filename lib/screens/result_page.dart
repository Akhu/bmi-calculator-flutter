import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/constants.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String interpretationText;

  const ResultsPage({Key key, @required this.bmiResult,@required  this.resultText,@required  this.interpretationText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text('Your Result',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 48.0
                  ),
                ),

              ),
            ),
          Expanded(
            flex: 6,
            child: ReusableCard(
              colour: kNormalBackgroundCardColor,
              cardChild: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(resultText,
                      style: kResultTextStyle,
                    ),
                    Text(bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text(interpretationText,
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ),
          BottomButton(
            buttonText: 'RE-CALCULATE',
            onTap:  () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => InputPage()));
            },
          ),
          ],
      ),
    );
  }
}
