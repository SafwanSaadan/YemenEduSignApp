// ignore_for_file: file_names, must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/Games/MemoryGameController.dart';
import '../../../core/constant/AppColor.dart';
import 'ResultMessage.dart';

class MemGameGrideView extends StatefulWidget {
  final List<dynamic> jsonData;
  final List<dynamic> jsonData1;
  const MemGameGrideView(
      {required this.jsonData, required this.jsonData1, super.key});

  @override
  State<MemGameGrideView> createState() => _MemGameGrideViewState();
}

class _MemGameGrideViewState extends State<MemGameGrideView> {
  final MemoryGameController controller =
      Get.put(MemoryGameController(), permanent: true);

  // توليد قيم عشوائية للمتغيرات
  Random rendomNumber = Random();

  // دالة التحقق من القيم المدخله
  void chackAnswer(bool answer) {
    if (answer) {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: "إجابة صحيحة",
              messageColor: AppColor.green,
              icon: Icons.check,
              iconColor: AppColor.green,
              onTap: () => Navigator.of(context).pop(),
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: "إجابة خاطئة",
              messageColor: AppColor.red,
              icon: Icons.close,
              iconColor: AppColor.red,
              onTap: () => Navigator.of(context).pop(),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    widget.jsonData1.shuffle();
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 3, bottom: 5),
      height: screenWidth,
      width: screenWidth,
      child: GridView.builder(
          itemCount: widget.jsonData.length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, crossAxisSpacing: 16.0, mainAxisSpacing: 16.0),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  controller.tries.value++;

                  if (widget.jsonData[controller.rendomIndex.value]['image'] ==
                      widget.jsonData1[index]['image']) {
                    controller.score.value += 10;
                    controller.answerUser.value = true;
                    chackAnswer(controller.answerUser.value);
                    controller.rendomIndex.value = rendomNumber.nextInt(8);
                    controller.answerUser.value = false;
                  } else {
                    controller.score.value -= 5;
                    chackAnswer(controller.answerUser.value);
                  }
                });
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColor.blue,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: AssetImage(widget.jsonData1[index]['image']),
                      fit: BoxFit.cover),
                ),
              ),
            );
          }),
    );
  }
}
