// ignore_for_file: must_be_immutable

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../../core/constant/AppColor.dart';
import '../../core/constant/constants.dart';
import '../../data/model/category_model.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({required this.category, super.key});
  final CategoryModel category;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  late AudioPlayer player;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // player.play(AssetSource(widget.category.audio!));
        // Get.toNamed(AppRoutes.updatecategoryPage, arguments: category);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1,
                    color: AppColor.grey.withOpacity(0.2),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Card(
                elevation: 0,
                color: AppColor.white,
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 5, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.category.categoryName,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColor.grey,
                        ),
                        maxLines: 1,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       widget.category,
                      //       style: const TextStyle(
                      //         fontSize: 15,
                      //         color: AppColor.green,
                      //       ),
                      //     ),
                      //     const Icon(
                      //       Icons.favorite,
                      //       color: AppColor.red,
                      //     ),
                      //   ],
                      // ),
                    
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 15,
              right: 15,
              top: -30,
              child: Container(
                height: 100,
                margin:
                    const EdgeInsets.symmetric(horizontal: Constants.margin),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: AppColor.white,
                  image: DecorationImage(
                      image: NetworkImage(widget.category.image),
                      fit: BoxFit.scaleDown),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
