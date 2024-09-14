// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onBoardingController.dart';
import '../../../core/constant/AppColor.dart';
import '../../../core/constant/constants.dart';
import '../../../data/datasource/bg_data.dart';
import '../../../data/datasource/static/onBoarding_list.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  final tab;
  const CustomSliderOnBoarding({super.key, this.tab});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: tab == 0 ? onBoardingList.length : onBoardingList1.length,
      itemBuilder: (context, i) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(tab == 0 ? bgList[i] : bgList[i + 3]),
            fit: BoxFit.fill,
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(75),
          ),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.symmetric(
                  horizontal: Constants.padding, vertical: 10),
              decoration: const BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
              ),
              child: Text(
                tab == 0 ? onBoardingList[i].body : onBoardingList1[i].body,
                style: Theme.of(context).textTheme.labelSmall,
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: Constants.margin),
              width: 350,
              height: 340,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        tab == 0
                            ? onBoardingList[i].image
                            : onBoardingList1[i].image,
                      ),
                      fit: BoxFit.fitWidth),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(200),
                      topLeft: Radius.circular(170),
                      topRight: Radius.circular(30))),
            ),
          ],
        ),
      ),
    );
  }
}
