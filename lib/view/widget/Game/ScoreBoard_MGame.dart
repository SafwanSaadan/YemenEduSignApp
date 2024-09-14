// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../core/constant/AppColor.dart';

class ScoreBoardMemoryGame extends StatelessWidget {
  final String title;
  final String info;
  const ScoreBoardMemoryGame(
      {required this.title, required this.info, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 26),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 2),
        Text(
          info,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ]),
    );
  }
}
