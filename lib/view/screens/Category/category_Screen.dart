// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/FloatingController.dart';
import '../../../controller/categoryController.dart';
import '../../../data/datasource/bg_data.dart';
import '../../widget/wdgers_view_courses/category_list.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final FloatingController controller1 =
      Get.put(FloatingController(), permanent: true);

  final CategoryController categoryController =
      Get.put(CategoryController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(53, 0, 109, 181),
      body: Obx(
        () => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(bgList[controller1.selectedIndex]),
              fit: BoxFit.fill,
            ),
          ),
          child: categoryController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : CategoryList(
                  category: categoryController.categoryData,
                ),
        ),
      ),
    );
  }
}
