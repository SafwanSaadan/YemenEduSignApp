// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../data/datasource/synonyms.dart';

class SearchControl extends GetxController {
  var searchResults = [].obs;
  var jsonData = [].obs; // Store loaded JSON data
  var isLoading = true.obs; // Added loading indicator false.obs;

  Future<void> loadJson() async {
    String jsonString = await rootBundle.loadString('assets/words.json');
    jsonData.value = json.decode(jsonString);
    isLoading.value = false; // Set loading to false after data is loaded
    update();
  }

// دالة لتطبيع الحروف العربية
  String normalizeArabic(String text) {
    Map<String, String> arabicMap = {
      'أ': 'ا',
      'إ': 'ا',
      'آ': 'ا',
      'ة': 'ه',
      'ى': 'ي',
      'ئ': 'ي',
      'ؤ': 'و',
    };

    // إزالة المسافات
    // text = text.replaceAll(' ', '');
    // إزالة ال
    // text = text.replaceAll('ال', '');
    // إزالة المسافات في نهاية النص فقط
    // text = text.trimRight();

    arabicMap.forEach((key, value) {
      text = text.replaceAll(key, value);
    });
    return text;
  }

// دالة للحصول على الكلمة الموحدة بناءً على المرادفات
  String getSynonym(String word) {
    for (var entry in synonyms.entries) {
      if (entry.value.contains(word)) {
        return entry.key;
      }
    }
    return word;
  }

// التعامل مع الأخطاء الإملائية
  int levenshteinDistance(String s, String t) {
    if (s == t) return 0;
    if (s.isEmpty) return t.length;
    if (t.isEmpty) return s.length;

    List<List<int>> matrix =
        List.generate(s.length + 1, (i) => List<int>.filled(t.length + 1, 0));

    for (int i = 0; i <= s.length; i++) matrix[i][0] = i;
    for (int j = 0; j <= t.length; j++) matrix[0][j] = j;

    for (int i = 1; i <= s.length; i++) {
      for (int j = 1; j <= t.length; j++) {
        int cost = s[i - 1] == t[j - 1] ? 0 : 1;
        matrix[i][j] = [
          matrix[i - 1][j] + 1,
          matrix[i][j - 1] + 1,
          matrix[i - 1][j - 1] + cost
        ].reduce((a, b) => a < b ? a : b);
      }
    }

    return matrix[s.length][t.length];
  }

  void search(String query) {
    String normalizedQuery = normalizeArabic(query.toLowerCase());
    String unifiedQuery = getSynonym(normalizedQuery);

    List<dynamic> results = jsonData.value.where((item) {
      String wordName = item['word_name'].toString().toLowerCase();
      String normalizedTitle = normalizeArabic(wordName);
      String unifiedTitle = getSynonym(normalizedTitle);

      return levenshteinDistance(unifiedQuery, unifiedTitle) <= 2;
    }).toList();

    searchResults.value = results.obs;
    update();
  }
}
