import 'dart:math';

class Calc {
  bool verbose = false;
  double? _result;

  late double rangeFrom;
  late double rangeTo;
  late double step;

  /// Конструктор
  Calc(this.rangeFrom, this.rangeTo, {this.step = 0.1});

  /// getter для отримання результату
  double? get result => _result;

  void setVerbose(bool value) {
    verbose = value;
  }

  /// Крок табулювання
  void setStep(double newStep) {
    step = newStep;
  }

  /// Запуск обчислень
  void runCalc() {
    var x = rangeFrom;
    var count = 0;
    var all = 0.0;

    // Цикл по всьому діапазону
    while (x <= rangeTo) {
      final y = _calc(x);

      if (verbose) {
        print("x = $x, y = 5x / 4x^2 = $y");
      }

      count++;
      all += y;
      x += step;
    }

    _result = all;
  }

  /// Обчислення функції
  double _calc(double x) {
    return (5 * x) / (4 * x * x);
  }
}

void main() {
  final processor = Calc(1.0, 2.0, step: 0.2);

  processor.setVerbose(true);
  processor.runCalc();
  print("Сума значень функції: ${processor.result}");
}
