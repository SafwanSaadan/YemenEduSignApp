import 'package:YemenEduSign/data/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/AppRoutes.dart';

class CategoryTile extends StatelessWidget {
  final CategoryModel category;

  const CategoryTile({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.lessons, arguments: category);
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
            leading: category.image.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      category.image,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
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
              category.categoryName,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "${category.lessons.length} دروس",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
