import 'package:flutter/material.dart';

class BMIRoundBttn extends StatelessWidget {
  final IconData icon;
  final Function onPress;
  BMIRoundBttn({this.icon, this.onPress});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      onPressed: onPress,
      constraints: BoxConstraints.tightFor(width: 55, height: 55),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
