import 'package:flutter/material.dart';
import 'package:gudang_air_jordan/screens/login_page.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Flutter App',
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
              color: Colors.white,
            )
          ),
          useMaterial3: true, 
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)
          .copyWith(background: const Color(0xFF1F1D2B)),
        ),
        home: const LoginPage(),
      ),
    );
  }
}

