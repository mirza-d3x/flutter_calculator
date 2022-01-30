import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      required this.isEqual,
      required this.onTap,
      required this.text,
      this.buttonColor,
      this.textColor})
      : super(key: key);

  final void Function() onTap;
  final String text;
  final Color? buttonColor;
  final Color? textColor;
  bool isEqual = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Container(
          width: 60,
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: buttonColor),
          child: Text(
            text,
            style: isEqual
                // equal button
                ? GoogleFonts.rubik(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  )
                :
                // all buttons excluded equal button
                GoogleFonts.rubik(
                    fontSize: 40,
                    color: textColor,
                  ),
          ),
        ),
      ),
    );
  }
}