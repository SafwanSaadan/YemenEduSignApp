import 'package:YemenEduSign/core/constant/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/AppRoutes.dart';
import '../../../data/model/courses/LessonModel.dart';

class LessonTile extends StatelessWidget {
  final LessonModel lesson;

  const LessonTile({
    super.key,
    required this.lesson,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // توجيه المستخدم إلى صفحة محتوى الدرس وتمرير بيانات الدرس
        Get.toNamed(AppRoutes.lessonDetail, arguments: lesson);
      },
      child: Card(
        elevation: 8.0,
        shadowColor: Colors.black54,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
              colors: [Colors.white, Colors.blue.shade50],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16.0),
            leading: lesson.lessonImage.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      lesson.lessonImage,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Icon(
                          Icons.image,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  )
                : Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Icon(
                      Icons.image,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
            title: Text(
              lesson.lessonName,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              lesson.lessonDescription,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: AppColor.grey),
              maxLines: 3,
            ),
          ),
        ),
      ),
    );
  }
}
