
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lab15/main.dart' as calc_lib;
import 'package:lab15/main.dart';

void main() {
  group('Calc class tests', () {
    test('Function calculation works correctly', () {
      final calc = calc_lib.Calc(1.0, 2.0, step: 0.5);
      calc.runCalc();
      expect(calc.result, isNotNull);
      expect(calc.result, greaterThan(0)); // Значення має бути позитивним
    });

    test('Step can be updated correctly', () {
      final calc = calc_lib.Calc(1.0, 2.0);  // Ініціалізація з початковими значеннями
      expect(calc.step, 0.1);  // Перевірка за замовчуванням, якщо крок не вказано

      calc.setStep(0.2);  // Оновлення кроку через метод setStep
      expect(calc.step, 0.2);  // Перевірка, чи змінився крок на 0.2
    });
    test('Sum of function values does not exceed 10', () {
      final calc = calc_lib.Calc(1.0, 2.0, step: 0.2);
      calc.runCalc();

      // Перевіряємо, чи результат обчислення не перевищує 10
      expect(calc.result, isNotNull);
      expect(calc.result, lessThanOrEqualTo(10.0), reason: 'Sum of function values exceeds 10');
    });
    test('Number of iterations is correct', () {
      final calc = calc_lib.Calc(1.0, 2.0, step: 0.2);  // Ініціалізація з певним діапазоном та кроком
      calc.runCalc();

      // Перевірка кількості ітерацій
      expect(calc.iterationCount, 6);  // Очікується 6 ітерацій (від 1.0 до 2.0 з кроком 0.2)
    });

  });

  group('Widget tests', () {
    testWidgets('App displays correct title', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.text("IPZ-32: Yaroslav's Last Flutter App"), findsOneWidget);
    });

    testWidgets('FloatingActionButton with Pets icon is present',
            (WidgetTester tester) async {
          await tester.pumpWidget(const MyApp());

          // Перевіряємо, чи є FloatingActionButton
          final fab = find.byType(FloatingActionButton);
          expect(fab, findsOneWidget);

          // Перевіряємо, чи має він правильну іконку
          final icon = find.widgetWithIcon(FloatingActionButton, Icons.pets);
          expect(icon, findsOneWidget);
        });

    testWidgets('Counter increments by 4', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Початкове значення лічильника
      expect(find.text('0'), findsOneWidget);

      // Натискаємо кнопку
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      // Перевіряємо значення після натискання
      expect(find.text('4'), findsOneWidget);
    });
  });
}
