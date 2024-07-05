import 'dart:math';

class Calculator {
  Calculator({required this.age, required this.height, required this.weight});

  final int height;
  final int weight;
  final int age;

  double? _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi == null) {
      return 'First to calculate your BMI';
    }
    if (_bmi! >= 25) {
      return 'Overweight';
    } else if (_bmi! > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getIntepretation() {
    if (_bmi == null) {
      return 'First to calculate your BMI';
    }
    if (_bmi! >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi! > 18.5) {
      return 'Yo have a normal body weight. Good job!';
    } else {
      return 'Yo have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
