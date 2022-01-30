import 'package:flutter/foundation.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter_calculator/widget/buttonList.dart';
// sfcalulator/controller/button_controller.dart
class ButtonController extends ChangeNotifier {
  bool isColor(String button) {
    if (button == 'AC' ||
        button == 'C' ||
        button == '%' ||
        button == '/' ||
        button == 'x' ||
        button == '-' ||
        button == '+' ||
        button == '=') {
      return true;
    }
    return false;
  }

  String userInput = '';
  String answer = '0';

  void changeData(int index) {
    userInput += ButtonModel().buttons[index];
    notifyListeners();
  }

  void onTappedEqualButton() {

    try{
      if(userInput.isNotEmpty){
        String finalAnswer = userInput;
        finalAnswer = userInput.replaceAll('x', '*');

        Parser p = Parser();
        Expression exp = p.parse(finalAnswer);
        ContextModel cm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL, cm);
        answer = eval.toString();
        notifyListeners();
      }

    }catch (e) {
      throw Exception(e);
    }

  }

  isEmpty() {
    answer = '0';
    notifyListeners();
  }

  isZero(int index) {
    if (userInput.isEmpty) {
      return;
    } else {
      userInput += ButtonModel().buttons[index];
    }
    notifyListeners();
  }

  void allClear() {
    userInput = '';
    answer = '0';
    notifyListeners();
  }

  void clearInput() {
    try {
      if (userInput.isEmpty) {
        return;
      }
      userInput = userInput.substring(0, userInput.length - 1);
    } catch (e) {
      throw Exception(e);
    }

    notifyListeners();
  }
}