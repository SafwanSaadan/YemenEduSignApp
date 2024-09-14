// ignore_for_file: file_names

import 'WordsModel.dart';

class LessonModel {
  final int lessonId;
  final String lessonName;
  final String lessonImage; // افترضنا أن الصورة قد تكون null
  final String lessonDescription;
  final List<WordModel> words;

  LessonModel({
    required this.lessonId,
    required this.lessonName,
    this.lessonImage = '', // قيمة افتراضية لتجنب null
    required this.lessonDescription,
    required this.words,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      lessonId: json['lesson_id'] ?? 0,
      lessonName: json['lesson_name'] ?? '',
      lessonImage: json['lesson_image'] ?? '', // التعامل مع null
      lessonDescription: json['lesson_description'] ?? '',
      words: json['words'] != null
          ? (json['words'] as List)
              .map((word) => WordModel.fromJson(word))
              .toList()
          : [], // قائمة فارغة إذا كانت null
    );
  }
}
