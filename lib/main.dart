import 'package:flutter/material.dart';
import 'package:gudang_air_jordan/feat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
        .copyWith(background: const Color(0xFF1F1D2B)),
      ),
      home: MyHomePage(),
    );
  }
}

