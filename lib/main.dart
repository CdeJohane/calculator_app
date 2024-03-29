// ignore_for_file: prefer_const_constructors


import 'package:calculator_app/pages/calculator_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
