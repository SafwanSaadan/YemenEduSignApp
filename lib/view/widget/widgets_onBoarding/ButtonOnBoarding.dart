// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onBoardingController.dart';
import '../../../core/constant/AppColor.dart';
import '../../../core/constant/AppRoutes.dart';
import '../../../data/datasource/static/onBoarding_list.dart';
import '../../../main.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  final tab;
  const CustomButtonOnBoarding({super.key, this.tab});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) => Column(children: [
        Container(
          width: 400,
          height: 40,
          decoration: const BoxDecoration(
            color: AppColor.orange,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          ),
          child: MaterialButton(
            onPressed: () {
              sharedPref!.setString('id', "1");

              if (controller.currentPage >= onBoardingList.length - 1) {
                if (tab == 0) {
                  // Get.offAllNamed(AppRoutes.login);
                } else {
                  Get.offAllNamed(AppRoutes.home);
                }
              } else {
                controller.next();
              }
            },
            child: controller.currentPage >= onBoardingList.length - 1
                ? Text(
                    'فتح التطبيق',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                : Text(
                    'التالي',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          child: controller.currentPage >= onBoardingList.length - 1
              ? null
              : Container(
                  width: 400,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: AppColor.orange),
                    color: AppColor.white,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      controller.nextEnd();
                    },
                    child: Text(
                      'تخطي',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
        ),
      ]),
    );
  }
}
