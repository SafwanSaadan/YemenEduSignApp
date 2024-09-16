// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../data/model/courses/category_model.dart';

class CategoryController extends GetxController {
  List<CategoryModel> categoryData = [];
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadCategoryData();
  }

  Future<void> loadCategoryData() async {
    try {
      // تأكد من أن الملف موجود في المسار الصحيح
      String jsonString = await rootBundle.loadString('assets/Categories.json');
      print(
          'Loaded JSON: $jsonString'); // لطباعة البيانات للتأكد من تحميلها بشكل صحيح

      dynamic jsonData = json.decode(jsonString);

      // تحقق من نوع البيانات وتحوّلها حسب الضرورة
      if (jsonData is List) {
        categoryData =
            jsonData.map((item) => CategoryModel.fromJson(item)).toList();
      } else if (jsonData is Map<String, dynamic>) {
        categoryData = [CategoryModel.fromJson(jsonData)];
      }

      isLoading.value = false;
    } catch (e) {
      print("Error loading data: $e");
      isLoading.value = false;
    }
    update();
  }
}
