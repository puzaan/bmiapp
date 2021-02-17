class BMICalculator {
  int height;
  int weight;
  int age;
  BMICalculator({this.height, this.weight, this.age});

  double calculatorBMI() {
    double meterHeight = height / 100;
    double height2 = meterHeight * meterHeight;
    return weight / height2;
  }

  String bmiLongMessage(double bmiValue) {
    if (bmiValue < 18.5) {
      return "Eat MOre Foods";
    } else if (bmiValue >= 18.5 && bmiValue <= 24.9) {
      return "Congrats!!!! Keep it up";
    } else if (bmiValue >= 25.0 && bmiValue <= 29.9) {
      return 'You need exercise and balance your diet';
    } else {
      return ('You need serious diet control, a hard workout, and a doctor consultation');
    }
  }

  String bmiShortMessage(double bmiValue) {
    if (bmiValue < 18.5) {
      return "UnderWeight \nLess than 18.0 Kg/m2";
    } else if (bmiValue >= 18.5 && bmiValue <= 24.9) {
      return "Normal \nBetween 18.5-25 Kg/m2";
    } else if (bmiValue >= 25.0 && bmiValue <= 29.9) {
      return 'OverWeight\nBetween 25.0 - 29.0 Kg/m2';
    } else {
      return ('Obese\nMore than 30 Kg/m2');
    }
  }
}
