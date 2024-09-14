// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controller/DragDropController.dart';
import '../../../core/constant/AppColor.dart';

class ButtonCalculationGame extends StatefulWidget {
  final String child;
  final VoidCallback onTap;

  const ButtonCalculationGame(
      {required this.child, required this.onTap, super.key});

  @override
  State<ButtonCalculationGame> createState() => _ButtonCalculationGameState();
}

class _ButtonCalculationGameState extends State<ButtonCalculationGame> {
  final DragDropController controller =
      Get.put(DragDropController(), permanent: true);
  var buttonColor = AppColor.blue;

  @override
  Widget build(BuildContext context) {
    if (widget.child == 'C') {
      buttonColor = AppColor.green;
    } else if (widget.child == 'DEL') {
      buttonColor = AppColor.red;
    } else if (widget.child == '=') {
      buttonColor = AppColor.blue1;
    }
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          widget.onTap();
        },
        child: Container(
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(4)),
          child: Center(
            child: Text(
              widget.child,
              style: const TextStyle(fontSize: 30, color: AppColor.white),
            ),
          ),
        ),
      ),
    );
  }
}
