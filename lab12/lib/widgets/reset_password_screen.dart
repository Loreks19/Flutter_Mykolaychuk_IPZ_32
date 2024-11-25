import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  final Dio _dio = Dio(); // Ініціалізація Dio для HTTP-запитів

  Future<void> _submitResetRequest() async {
    if (_formKey.currentState?.validate() == true) {
      final email = _emailController.text.trim(); // Отримуємо email

      try {
        // Відправка запиту на сервер
        final response = await _dio.post(
          'https://lab120.requestcatcher.com/test', // URL серверу
          data: email, // Відправка email як plain текст
          options: Options(
            headers: {
              'Content-Type': 'text/plain', // Встановлюємо заголовок
            },
          ),
        );

        if (response.statusCode == 200) {
          // Якщо запит успішний
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text('Успіх'),
              content: Text('Посилання на відновлення пароля надіслано.'),
            ),
          );
        } else {
          // Якщо сервер повернув помилку
          _showErrorDialog('Щось пішло не так. Спробуйте ще раз.');
        }
      } catch (e) {
        // Якщо сталася помилка при виконанні запиту
        print('Помилка при виконанні запиту: $e'); // Виведення більш детальної помилки
        _showErrorDialog('Сталася помилка: $e');
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Помилка'),
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Скидання пароля')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/1024px-Google-flutter-logo.svg.png",
                  width: 200,
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Будь ласка, введіть email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitResetRequest, // Відправка запиту при натисканні кнопки
                child: const Text('Reset Password'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
