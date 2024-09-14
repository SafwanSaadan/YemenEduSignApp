import 'LessonModel.dart';

class CategoryModel {
  final int categoryId;
  final String categoryName;
  final String image;
  final List<LessonModel> lessons;

  CategoryModel({
    required this.categoryId,
    required this.categoryName,
    required this.image,
    required this.lessons,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: json['category_id'] ?? 0,
      categoryName: json['category_name'] ?? '',
      image: json['image'] ?? '',
      lessons: json['lessons'] != null
          ? (json['lessons'] as List)
              .map((lesson) => LessonModel.fromJson(lesson))
              .toList()
          : [], // افتراض قائمة فارغة إذا كانت `null`
    );
  }
}
