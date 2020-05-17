import 'package:flutter/material.dart';

import 'components/constants.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        sliderTheme: SliderTheme.of(context).copyWith(
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
            thumbColor: kAccentColor,
            overlayColor: kAccentColor.withAlpha(0x1F),
            inactiveTrackColor: kNormalContentColor,
            activeTrackColor: Colors.white

        ),
          primaryColor: Color(0xFF0A0C24),
          accentColor: Color(0xFFFF0067),
          scaffoldBackgroundColor: Color(0xFF0A0C24),
      ),
      home: InputPage(),
    );
  }
}

