// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/FloatingController.dart';
import '../../../data/datasource/bg_data.dart';
import '../../../data/model/LessonModel.dart';
import '../../widget/wdgers_view_courses/custom_lessonDetail.dart';

class LessonDetailScreen extends StatelessWidget {
  LessonDetailScreen({super.key});
  final FloatingController controller1 =
      Get.put(FloatingController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    // الحصول على بيانات الدرس التي تم تمريرها من صفحة الدروس
    final LessonModel lesson = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.lessonName,
            style: Theme.of(context).textTheme.bodyLarge),
        centerTitle: true,
        backgroundColor: Colors.transparent, // جعل لون الـ AppBar شفافًا
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(bgList[controller1.selectedIndex]),
              fit: BoxFit.fill,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: CustomLessonDetail(words: lesson.words)),
    );
  }
}
