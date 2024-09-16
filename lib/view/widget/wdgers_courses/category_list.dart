import 'package:YemenEduSign/data/model/courses/category_model.dart';
import 'package:flutter/material.dart';
import 'category_tile.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryModel> category;

  const CategoryList({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: category.length,
      itemBuilder: (context, index) {
        final categ = category[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: CategoryTile(
            category: categ,
          ),
        );
      },
    );
  }
}
