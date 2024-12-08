import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel('com.example/native_code');
  String _date = "Fetching date...";
  String _imagePath = "";

  // Отримання дати через MethodChannel
  Future<void> _getNativeDate() async {
    try {
      final String date = await platform.invokeMethod('getNativeData');
      setState(() {
        _date = date;
      });
    } on PlatformException catch (e) {
      setState(() {
        _date = "Failed to get date: '${e.message}'.";
      });
    }
  }

  // Робимо фото за допомогою image_picker
  final ImagePicker _picker = ImagePicker();

  Future<void> _takePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        _imagePath = photo.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Native Camera App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Current Date: $_date'),
            ElevatedButton(
              onPressed: _getNativeDate,
              child: const Text('Get Current Date'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _takePhoto,
              child: const Text('Take a Photo'),
            ),
            if (_imagePath.isNotEmpty)
              Image.file(File(_imagePath)), // Показуємо зроблене фото
          ],
        ),
      ),
    );
  }
}
