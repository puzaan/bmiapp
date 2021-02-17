import 'package:bmiapp/const/constats.dart';
import 'package:bmiapp/ui/home_screen.dart';
import 'package:bmiapp/widgrt/bmi_card.dart';
import 'package:bmiapp/widgrt/bottom.dart';
import 'package:flutter/material.dart';

class ResultUI extends StatelessWidget {
  final double bmiValue;
  final String bmiShortMessage;
  final String bmiLongMessage;

  ResultUI({this.bmiValue, this.bmiShortMessage, this.bmiLongMessage});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BMI Result"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Center(
            child: Container(
              child: Text(
                'Your Result',
                style: KBigLabelTextStyle,
              ),
            ),
          )),
          Expanded(
            flex: 5,
            child: BMICard(
              color: KActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiValue.toStringAsFixed(2),
                    style: KBigLabelTextStyle,
                  ),
                  Text(
                    bmiShortMessage.toString(),
                    style: TextStyle(fontSize: 35.0),
                  ),
                  Text(
                    bmiLongMessage.toString(),
                    style: TextStyle(fontSize: 25.0),
                  ),
                ],
              ),
            ),
          ),
          BottomContainer(
            title: "Re-Calculate",
            onPress: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          )
        ],
      ),
    );
  }
}
