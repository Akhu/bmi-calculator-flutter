
import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {

  final Color colour;
  final Widget cardChild;

  final Function onTapAction;
  ReusableCard({@required this.colour, this.cardChild, this.onTapAction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapAction,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10.0)
        ),
      ),
    );
  }
}
