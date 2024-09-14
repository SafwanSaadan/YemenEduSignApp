import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/FloatingController.dart';
import '../../core/constant/AppColor.dart';
import '../../core/constant/AppRoutes.dart';
import '../../core/constant/constants.dart';
import '../../data/datasource/bg_data.dart';
import '../../data/datasource/static/static.dart';

class GamesScreen extends StatelessWidget {
  GamesScreen({super.key});

  final FloatingController controller =
      Get.put(FloatingController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.only(top: 20, bottom: 30),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(bgList[controller.selectedIndex]),
                fit: BoxFit.fill,
              ),
            ),
            child: ListView.builder(
              itemCount: homeModel.length,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    i == 0
                        ? Get.toNamed(AppRoutes.dragDropGame)
                        : i == 1
                            ? Get.toNamed(AppRoutes.calcGame)
                            : Get.toNamed(AppRoutes.memoryGame);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(Constants.margin),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.white,
                    ),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.sports_esports,
                                color: AppColor.blue),
                            Text(
                              homeModel[i].title!,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: Constants.margin),
                              child: CircleAvatar(
                                radius: 40,
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundImage: AssetImage(
                                      homeModel[i].image!,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                homeModel[i].body!,
                                style: Theme.of(context).textTheme.labelSmall,
                                maxLines: 3,
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: Constants.margin),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "إنطلق",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: AppColor.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: AppColor.blue,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
