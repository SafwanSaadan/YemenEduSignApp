// ignore_for_file: file_names


import 'package:get/get.dart';

class MemoryGameController extends GetxController {
  var score = 0.obs;
  var tries = 0.obs;
  var answerUser = false.obs;
  var rendomIndex = 0.obs;

  scorePls() {
    score += 10;
    update();
  }

  scoreMinus() {
    score -= 5;
    update();
  }
}
