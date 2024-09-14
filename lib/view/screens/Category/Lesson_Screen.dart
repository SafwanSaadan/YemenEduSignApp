// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/FloatingController.dart';
import '../../../data/datasource/bg_data.dart';
import '../../../data/model/category_model.dart';
import '../../widget/wdgers_view_courses/lesson_list.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  final FloatingController controller1 =
      Get.put(FloatingController(), permanent: true);
  // استرجاع البيانات المرسلة
  final CategoryModel category = Get.arguments;
  // late final CategoryModel category;

  // @override
  // void initState() {
  //   super.initState();
  //   final receivedCategory = Get.arguments;
  //   if (receivedCategory != null && receivedCategory is CategoryModel) {
  //     category = receivedCategory;
  //   } else {
  //     // التعامل مع الحالة عندما تكون القيمة غير صحيحة أو null
  //     // يمكن استخدام قيم افتراضية مناسبة بدلاً من CategoryModel()
  //     category = CategoryModel(
  //       categoryId: 0,
  //       categoryName: 'غير محدد',
  //       image: '',
  //       lessons: [],
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(53, 0, 109, 181),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(bgList[controller1.selectedIndex]),
              fit: BoxFit.fill,
            ),
          ),
          child: category.lessons.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : LessonList(
                  lessons: category.lessons,
                ),
        ),
      ),
    );
  }
}
