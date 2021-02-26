import 'package:bmiapp/bmi_calculator.dart';
import 'package:bmiapp/const/constats.dart';
import 'package:bmiapp/ui/bmi_result_page.dart';
import 'package:bmiapp/widgrt/bmi_card.dart';
import 'package:bmiapp/widgrt/bottom.dart';
import 'package:bmiapp/widgrt/icon_content.dart';
import 'package:bmiapp/widgrt/round_bttn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender selectedGender;

  int height = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BMICard(
                    color: selectedGender == Gender.male
                        ? KActiveColor
                        : KInactiveColor,
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    cardChild: IconContext(
                      icon: FontAwesomeIcons.mars,
                      title: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: BMICard(
                    color: selectedGender == Gender.female
                        ? KActiveColor
                        : KInactiveColor,
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardChild: IconContext(
                      icon: FontAwesomeIcons.venus,
                      title: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BMICard(
              color: KActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height",
                    style: KLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        height.toString(),
                        style: KBigLabelTextStyle,
                      ),
                      Text(
                        'cm',
                        style: KLabelTextStyle,
                      ),
                    ],
                  ),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFFD8E98),
                          thumbColor: Color(0xFFEB1555),
                          overlappingShapeStrokeColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0)),
                      child: Slider(
                        value: height.toDouble(),
                        max: 220.0,
                        min: 20.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.toInt();
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BMICard(
                    color: KActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: KLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: KBigLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BMIRoundBttn(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  if (weight > 1) {
                                    weight--;
                                  }
                                });
                              },
                            ),
                            BMIRoundBttn(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BMICard(
                    color: KActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: KLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: KBigLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BMIRoundBttn(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  if (age > 1) {
                                    age--;
                                  }
                                });
                              },
                            ),
                            BMIRoundBttn(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomContainer(
            onPress: () {
              BMICalculator _bmiCalculator =
                  BMICalculator(height: height, weight: weight, age: age);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultUI(
                            bmiValue: _bmiCalculator.calculatorBMI(),
                            bmiShortMessage: _bmiCalculator.bmiShortMessage(
                                _bmiCalculator.calculatorBMI()),
                            bmiLongMessage: _bmiCalculator
                                .bmiLongMessage(_bmiCalculator.calculatorBMI()),
                          )));
            },
            title: "Calculate",
          ),
        ],
      ),
    );
  }
}
