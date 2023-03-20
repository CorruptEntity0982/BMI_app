import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});
  final double height;
  final int weight;
  late double _bmi;
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 25) {
      return 'OVER WEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL WEIGHT';
    } else {
      return 'UNDER WEIGHT';
    }
  }

  String interpretation() {
    if (_bmi > 25) {
      return 'You have a high BMI, Try to exercise more';
    } else if (_bmi > 18.5) {
      return 'You have a normal BMI, Good job! ';
    } else {
      return 'You have a low BMI, You can try to eat more';
    }
  }
}
