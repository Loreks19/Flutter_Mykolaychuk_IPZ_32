import 'package:flutter/material.dart';
class Calc {
  bool verbose = false;
  double? _result;
  int iterationCount = 0;

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

  /// Метод для зміни кроку табулювання
  void setStep(double newStep) {
    step = newStep;
  }

  /// Метод запуску обчислень
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
    iterationCount = count;
  }

  /// Приватний метод для обчислення функції
  double _calc(double x) {
    return (5 * x) / (4 * x * x);
  }
}
void main() {
  runApp(const MyApp());
  final processor = Calc(1.0, 2.0, step: 0.2);

  processor.setVerbose(true); // Увімкнути детальний вивід
  processor.runCalc();
  print("Сума значень функції: ${processor.result}");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "IPZ-32: Yaroslav's Last Flutter App" ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter+=5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.pets),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
