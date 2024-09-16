// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {required this.onTap,
      required this.text,
      this.buttonColor,
      this.textColor,
      this.buttonRadius,
      this.buttonWidth,
      this.buttonHeight,
      this.isUpperCase,
      super.key});

  VoidCallback? onTap;
  String? text;
  Color? textColor;
  Color? buttonColor;
  double? buttonHeight;
  double? buttonWidth;
  double? buttonRadius;
  bool? isUpperCase;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(
                buttonRadius == null ? 8 : buttonRadius!)),
        width: buttonWidth == null ? double.infinity : buttonWidth!,
        height: buttonHeight == null ? 60 : buttonHeight!,
        child: Center(
          child: Text(
            isUpperCase == true
                ? isUpperCase!
                    ? text!.toUpperCase()
                    : text!
                : text!,
            style:
                TextStyle(color: textColor == null ? Colors.black : textColor!),
          ),
        ),
      ),
    );
  }
}
