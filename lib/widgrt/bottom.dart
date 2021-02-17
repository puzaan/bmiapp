import 'package:bmiapp/const/constats.dart';
import 'package:flutter/material.dart';

class BottomContainer extends StatelessWidget {
  final String title;

  final Function onPress;
  BottomContainer({this.title, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      color: Colors.cyan,
      child: GestureDetector(
        onTap: onPress,
        child: Center(
          child: Text(
            title,
            style: KBigLabelTextStyle,
          ),
        ),
      ),
    );
  }
}
