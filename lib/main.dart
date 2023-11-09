import 'package:flutter/material.dart';
import 'package:gudang_air_jordan/screens/feat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: const DashboardPage(),
    );
  }
}

