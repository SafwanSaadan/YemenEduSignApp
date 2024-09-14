// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/AppColor.dart';
import '../../core/constant/AppRoutes.dart';
import '../../core/constant/constants.dart';
import '../../data/model/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({required this.category, super.key});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, AppRoutes.updateProductPage,
        //     arguments: product);
        // Get.toNamed(AppRoutes.numbers, arguments: category);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Expanded(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: Constants.margin),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  // color: category.color,
                  image: DecorationImage(
                      image: NetworkImage(category.image),
                      fit: BoxFit.scaleDown),
                ),
              ),
            ),
            Positioned(
              child: Container(
                margin: const EdgeInsets.all(12),
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                      color: AppColor.grey.withOpacity(0.2),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Text(
                  // category.name.substring(0, 12),
                  category.categoryName,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColor.green,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
