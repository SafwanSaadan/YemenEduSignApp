// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/FloatingController.dart';
import '../../core/utils/animations.dart';
import '../../data/datasource/bg_data.dart';
import '../../main.dart';

class FloatingActionButtonLogin extends StatelessWidget {
  FloatingActionButtonLogin({super.key});

  final FloatingController controller =
      Get.put(FloatingController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FloatingController>(
      builder: (controller) => Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 49,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
                child: controller.showOption
                    ? ShowUpAnimation(
                        delay: 100,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: bgList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  controller.selectedIndex = index;
                                  sharedPref!.setInt('selectedIndex',
                                      controller.selectedIndex);
                                  controller.update();
                                },
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor:
                                      controller.selectedIndex == index
                                          ? Colors.white
                                          : Colors.transparent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(1),
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: AssetImage(
                                        bgList[index],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
                    : const SizedBox()),
            const SizedBox(
              width: 20,
            ),
            controller.showOption
                ? GestureDetector(
                    onTap: () {
                      controller.showOption = false;
                      controller.update();
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 30,
                    ))
                : GestureDetector(
                    onTap: () {
                      controller.showOption = true;
                      controller.update();
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            bgList[controller.selectedIndex],
                          ),
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
