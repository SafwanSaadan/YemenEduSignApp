// ignore_for_file: file_names, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/AppColor.dart';
import '../core/constant/AppRoutes.dart';
import '../core/constant/AppThemeData.dart';
import '../main.dart';

class FloatingController extends GetxController {
  int selectedIndex = sharedPref!.getInt('selectedIndex') ?? 6;
  bool showOption = false;
  bool isPassword = true;
  bool chack = false;
  bool removeEye = false;
  String username = '';
  String password = '';

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final fullNameController = TextEditingController();
  final activityController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  void visibilityOff() {
    isPassword = !isPassword;
    update();
  }

  void userValid() {
    if ((usernameController == sharedPref!.getString('username')) &&
        passwordController == sharedPref!.getString('password')) {
      Get.offAllNamed(AppRoutes.dragDropGame);
    } else {
      Get.defaultDialog(
          title: "خطأ",
          titleStyle: AppThemeData().textTheme.bodyLarge,
          middleText:
              "حطأ في تسجيل الدخول تأكد من إدخال اسم الدخول وكلمة المرور بطريقة صحيحة ",
          middleTextStyle: const TextStyle(color: AppColor.red, fontSize: 14));
    }
    update();
  }

  void eyeOn() {
    removeEye = !removeEye;
    update();
  }

  void checkedbox() {
    chack = !chack;
    update();
  }

  void upadte() {
    update();
  }
}
