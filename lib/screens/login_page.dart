import 'package:gudang_air_jordan/screens/feat.dart';
import 'package:flutter/material.dart';
import 'package:gudang_air_jordan/screens/signup_page.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color(0xFF2f3169),
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              style: const TextStyle(color: Colors.white),
              controller: _usernameController,
              decoration: const InputDecoration(
                labelStyle: TextStyle(color: Colors.white),
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              style: const TextStyle(color: Colors.white),
              controller: _passwordController,
              decoration: const InputDecoration(
                labelStyle: TextStyle(color: Colors.white),
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () async {
                String username = _usernameController.text;
                String password = _passwordController.text;

                final response =
                    await request.login("https://martin-marcelino-tugas.pbp.cs.ui.ac.id/auth/login/", {
                  'username': username,
                  'password': password,
                });

                if (request.loggedIn) {
                  String message = response['message'];
                  loggedInUser = User(username: username, password: password);
                  userDb.add(loggedInUser);

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DashboardPage()),
                  );
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        content: Text(
                            "$message Selamat datang, ${loggedInUser.username}.")));
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Login Gagal'),
                      content: Text(response['message']),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 15,),
            GestureDetector (
              onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute (
                builder: (context) => const SignUpPage(),
              )
              ),
              child: const Text(
                'Don\'t have an account yet?',
                style: TextStyle(
                  color: Colors.blue
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
