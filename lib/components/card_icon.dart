import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class CardIcon extends StatelessWidget {
  final String text;
  final IconData icon;

  CardIcon({@required this.icon, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          this.icon,
          size: kIconSize,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          this.text,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
