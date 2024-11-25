import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../services/validation_service.dart';
import './reset_password_screen.dart';
import './signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final dio = Dio(); // Ініціалізація Dio

  // Функція для відправки даних на сервер
  void _submitForm() async {
    if (_formKey.currentState?.validate() == true) {
      // Збираємо дані з полів
      String email = _emailController.text;
      String password = _passwordController.text;

      try {
        // Виконуємо запит до серверу
        final response = await dio.post(
          'https://lab120.requestcatcher.com/test', // URL для відправки даних
          data: '$email, $password', // Надсилаємо дані як текст
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
                content: Text('Login successful!'),
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
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: ValidationService.validateEmail, // Валідація email
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: ValidationService.validatePassword, // Валідація пароля
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitForm, // Викликаємо метод для відправки даних
                child: const Text('Login'),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      );
                    },
                    child: const Text('Sign up'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResetPasswordScreen(),
                        ),
                      );
                    },
                    child: const Text('Reset'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
