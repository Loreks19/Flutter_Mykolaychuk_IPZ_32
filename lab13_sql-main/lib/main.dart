import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ініціалізація Flutter binding

  // Ініціалізація для десктопа
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit(); // Ініціалізація FFI
    databaseFactory = databaseFactoryFfi; // Встановлення фабрики для десктопа
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Notes App')),
        body: const Center(child: Text('Notes App is Running')),
      ),
    );
  }
}
