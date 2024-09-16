// ignore_for_file: file_names, avoid_unnecessary_containers, unrelated_type_equality_checks

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/Games/DragDropController.dart';
import '../../../controller/FloatingController.dart';
import '../../../core/constant/AppColor.dart';
import '../../../data/datasource/bg_data.dart';
import '../../widget/widgets_Game/ButtonCalculationGame.dart';
import '../../widget/widgets_Game/ResultMessage.dart';

class CalculationGameScreen extends StatefulWidget {
  const CalculationGameScreen({super.key});

  @override
  State<CalculationGameScreen> createState() => _CalculationGameScreenState();
}

class _CalculationGameScreenState extends State<CalculationGameScreen> {
  final DragDropController controller =
      Get.put(DragDropController(), permanent: true);
  final FloatingController controller1 =
      Get.put(FloatingController(), permanent: true);

  List<String> numberPad = [
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '=',
    '0',
    '.',
    '-',
  ];

// قيم متغيرات الاسئلة
  int numberA = 1;
  int numberB = 1;

// دالة فحص الازرار التي يغضطها المستخدم
  void buttonTapped(String button) {
    setState(() {
      if (button == '=') {
        validation();
        // التحقق من إجابة المستخدم
        chackResult();
      } else if (button == 'C') {
        // عندم يضغط المستخدم على تفريغ يتم مسح كل القيم المدخله
        controller.userAnswer.value = '';
      } else if (button == 'DEL') {
        // عند الضغط على مسح يتم مسح القيمة المدخله أخيراً
        if (controller.userAnswer.value.isNotEmpty) {
          controller.userAnswer.value = controller.userAnswer.value
              .substring(0, controller.userAnswer.value.length - 1);
        }
      } else if (controller.userAnswer.value.length < 3) {
        // حصر القيم المدخله بثلاث خانات
        controller.userAnswer.value += button;
      }
    });
  }

  List opretor = [
    '+',
    '-',
    '*',
  ];

  void validation() {
    if (opretor[controller.opretorIndex.value] == '+') {
      controller.validation.value =
          numberA + numberB == int.parse(controller.userAnswer.value);
    } else if (opretor[controller.opretorIndex.value] == '-') {
      controller.validation.value =
          numberA - numberB == int.parse(controller.userAnswer.value);
    } else if (opretor[controller.opretorIndex.value] == '*') {
      controller.validation.value =
          numberA * numberB == int.parse(controller.userAnswer.value);
    }
  }

// دالة التحقق من القيم المدخله
  void chackResult() {
    if (controller.validation.value) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return ResultMessage(
              message: "إجابة صحيحة",
              messageColor: AppColor.green,
              icon: Icons.check,
              iconColor: AppColor.green,
              onTap: goToNextQutsion,
            );
          });
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return ResultMessage(
              message: "إجابة خاطئة",
              messageColor: AppColor.red,
              icon: Icons.close,
              iconColor: AppColor.red,
              onTap: goToBackQutsion,
            );
          });
    }
  }

  // توليد قيم عشوائية للمتغيرات
  var rendomNumber = Random();

// دالة للإنتقال للسؤال الجديد
  void goToNextQutsion() {
    Navigator.of(context).pop();
    // تفريغ القيم المدخله
    setState(() {
      controller.userAnswer.value = '';
      controller.opretorIndex.value = controller.userScore.value % 3;
      if (controller.userScore.value == 5) {
        controller.userLevel.value += 1;
        controller.userScore.value = 1;
      } else {
        controller.userScore.value += 1;
      }

      //إنشاء أسئلة جديدة وإضافة التعقيد بناءً على المستوى
      if (controller.userLevel.value == 1) {
        numberA = rendomNumber.nextInt(3);
        numberB = rendomNumber.nextInt(3);
      } else if (controller.userLevel.value == 2) {
        numberA = rendomNumber.nextInt(4);
        numberB = rendomNumber.nextInt(4);
      } else if (controller.userLevel.value == 3) {
        numberA = rendomNumber.nextInt(5);
        numberB = rendomNumber.nextInt(5);
      } else if (controller.userLevel.value == 4) {
        numberA = rendomNumber.nextInt(6);
        numberB = rendomNumber.nextInt(6);
      } else if (controller.userLevel.value == 6) {
        numberA = rendomNumber.nextInt(7);
        numberB = rendomNumber.nextInt(7);
      } else if (controller.userLevel.value == 8) {
        numberA = rendomNumber.nextInt(8);
        numberB = rendomNumber.nextInt(8);
      } else if (controller.userLevel.value == 11) {
        numberA = rendomNumber.nextInt(9);
        numberB = rendomNumber.nextInt(9);
      } else if (controller.userLevel.value == 15) {
        numberA = rendomNumber.nextInt(10);
        numberB = rendomNumber.nextInt(10);
      } else if (controller.userLevel.value == 19) {
        numberA = rendomNumber.nextInt(11);
        numberB = rendomNumber.nextInt(11);
      } else if (controller.userLevel.value == 25) {
        numberA = rendomNumber.nextInt(12);
        numberB = rendomNumber.nextInt(12);
      } else if (controller.userLevel.value == 32) {
        numberA = rendomNumber.nextInt(13);
        numberB = rendomNumber.nextInt(13);
      }
    });
  }

  // دلة للبقى في نفس السؤال
  void goToBackQutsion() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blue2,
      appBar: AppBar(
        title: Text(
          'لعبة الحساب',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppColor.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bgList[controller1.selectedIndex]),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(children: [
          // level progrss, player needs 5 correct Answer
          // Container(
          //   height: 160,
          //   color: AppColor.orange,
          // ),

          // Question
          Expanded(
            flex: 3,
            child: Container(
              child: Center(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  // Question
                  Center(
                    child: Text(
                      '$numberA ${opretor[controller.opretorIndex.value]} $numberB = ',
                      style:
                          const TextStyle(fontSize: 40, color: AppColor.white),
                    ),
                  ),

                  // Answer Box
                  Container(
                    height: 60,
                    width: 120,
                    decoration: BoxDecoration(
                      color: AppColor.blue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        controller.userAnswer.value,
                        style: const TextStyle(
                            fontSize: 40, color: AppColor.white),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),

          // number pad
          Expanded(
              flex: 11,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: GridView.builder(
                    itemCount: numberPad.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      return ButtonCalculationGame(
                        child: numberPad[index],
                        onTap: () {
                          buttonTapped(numberPad[index]);
                        },
                      );
                    }),
              )),
        ]),
      ),
    );
  }
}
