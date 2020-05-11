import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final Function onPressed;
  final String title;

  const BottomButton({@required this.onPressed, @required this.title});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: this.onPressed,
      fillColor: kBottomContainerColor,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 80.0,
        child: Text(this.title,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800)),
      ),
    );
  }
}
