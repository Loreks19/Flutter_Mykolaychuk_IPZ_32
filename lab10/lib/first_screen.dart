import 'package:flutter/material.dart';
import 'second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _textController = TextEditingController();
  int _fontSize = 16; // Changed to int

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        final String assetNamePath = 'assets/images/robot.png';
        AssetImage imageFromAssetImage = AssetImage(assetNamePath);
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min, // To make the column compact
            children: [
              Image(image: imageFromAssetImage, width: 50, height: 50),
              const SizedBox(height: 16.0),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text previewer"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Text',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 4.0),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                'Enter some text',
                style: const TextStyle(fontSize: 12.0),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Text(
                  'Font size: $_fontSize', // Use int directly
                  style: const TextStyle(fontSize: 16.0),
                ),
                Expanded(
                  child: Slider(
                    value: _fontSize.toDouble(), // Slider still needs a double
                    min: 10,
                    max: 100,
                    label: '$_fontSize', // Display the integer font size
                    onChanged: (value) {
                      setState(() {
                        _fontSize = value.toInt(); // Convert slider value to int
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple, // Колір фону кнопки
                foregroundColor: Colors.white, // Колір тексту кнопки
              ),
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(
                      text: _textController.text,
                      size: _fontSize.toDouble(), // Convert to double for passing
                    ),
                  ),
                );
                if (result == 'ok') {
                  _showDialog('Cool!');
                } else if (result == 'cancel') {
                  _showDialog('Let’s try something else');
                } else {
                  _showDialog('Don\'t know what to say');
                }
              },
              child: const Text('Preview'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}