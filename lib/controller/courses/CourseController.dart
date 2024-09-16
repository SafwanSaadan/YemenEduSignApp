// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CourseController extends GetxController {
  late PageController pageController;

  int currentPage = 0;

  next() {
    if (currentPage < 5) {
      // تأكد من أنك لا تتجاوز الصفحة الأخيرة (حدد العدد المناسب للصفحات)
      currentPage++;
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 500), curve: Curves.linear);
      update();
    }
  }

  previous() {
    if (currentPage > 0) {
      // تأكد من أنك لا تقل عن الصفحة الأولى
      currentPage--;
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 500), curve: Curves.linear);
      update();
    }
  }

  onPageChanged(int index) {
    currentPage = index;
    update(); // تحديث الواجهة عند تغيير الصفحة
  }

  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  nextEnd() {
    pageController.animateToPage(
        5, // انتقل إلى الصفحة الأخيرة (حدد الصفحة المناسبة)
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear);
    update();
  }
}
