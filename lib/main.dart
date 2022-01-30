import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}
class CalculatorApp extends StatelessWidget {
  const CalculatorApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // hide debug banner in emulator
      debugShowCheckedModeBanner: false,
    );
  }
}