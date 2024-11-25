import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../services/validation_service.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final dio = Dio();

  // Функція для відправки даних на сервер
  void _submitRegistration() async {
    if (_formKey.currentState?.validate() == true) {
      // Збираємо дані з полів
      String name = _nameController.text;
      String email = _emailController.text;
      String password = _passwordController.text;

      try {
        // Виконуємо запит до серверу
        final response = await dio.post(
          'https://lab120.requestcatcher.com/test', // URL для відправки даних
          data: '$name, $email, $password', // Надсилаємо дані як текст
          options: Options(
            headers: {
              'Content-Type': 'text/plain', // Використовуємо plain text
            },
          ),
        );

        if (response.statusCode == 200) {
          // Якщо успішно, показуємо діалог з повідомленням
          showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return const AlertDialog(
                title: Text('Message'),
                content: Text('Successful registration!'),
              );
            },
          );
        } else {
          print('Помилка сервера: ${response.statusCode}');
        }
      } catch (e) {
        print('Помилка при виконанні запиту: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Authorization page"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/1024px-Google-flutter-logo.svg.png",
                  width: 200,
                ),
              ),
              const SizedBox(height: 24),
              const Center(
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    ValidationService.validateRequiredField(value, 'Name'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: ValidationService.validateEmail,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: ValidationService.validatePassword,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitRegistration, // Викликаємо метод для відправки даних
                child: const Text('Sign up'),
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
