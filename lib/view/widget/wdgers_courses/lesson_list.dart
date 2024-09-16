import 'package:flutter/material.dart';

import '../../../data/model/courses/LessonModel.dart';
import 'lesson_tile.dart';

class LessonList extends StatelessWidget {
  final List<LessonModel> lessons;

  const LessonList({super.key, required this.lessons});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lessons.length,
      itemBuilder: (context, index) {
        final les = lessons[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: LessonTile(
            lesson: les,
          ),
        );
      },
    );
  }
}
