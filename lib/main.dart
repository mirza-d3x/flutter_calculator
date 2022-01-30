import 'package:flutter/material.dart';
import 'package:flutter_calculator/controller/button_controller.dart';
import 'package:flutter_calculator/screenhome.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ButtonController(),
      child: const MaterialApp(
        // hide debug banner in emulator
        debugShowCheckedModeBanner: false,
        home: ScreenHome(),
      ),
    );
  }
}
