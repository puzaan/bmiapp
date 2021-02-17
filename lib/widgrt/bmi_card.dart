import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BMICard extends StatelessWidget {
  final Widget cardChild;
  final Color color;
  final Function onPressed;
  BMICard({this.cardChild, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0)),
        child: cardChild,
      ),
    );
  }
}
