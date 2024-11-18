import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'container_config.dart'; // Імпортуємо модель стану
import 'widgets/config_sliders.dart';  // Секція зі слайдерами
import 'widgets/red_container.dart';  // Червоний контейнер

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ContainerConfig(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Lab11'),
            centerTitle: true,
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConfigSliders(), // Секція з слайдерами
            Expanded(
              child: Center(
                child: RedContainer(), // Центруємо червоний контейнер
              ),
            ),
          ],
        ),
      ),
    );
  }
}