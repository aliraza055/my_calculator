import 'package:flutter/material.dart';
import 'package:my_calculator/homepage.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {  
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

