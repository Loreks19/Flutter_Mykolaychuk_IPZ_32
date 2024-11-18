import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String text;
  final double size;

  const SecondScreen({super.key, required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview Text'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: size),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple, // Колір фону кнопки
                    foregroundColor: Colors.white, // Колір тексту кнопки
                  ),
                  onPressed: () => Navigator.pop(context, 'ok'),
                  child: const Text('Ok'),
                ),
                const SizedBox(width: 16.0),
                OutlinedButton(
                  onPressed: () => Navigator.pop(context, 'cancel'),
                  child: const Text('Cancel'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}