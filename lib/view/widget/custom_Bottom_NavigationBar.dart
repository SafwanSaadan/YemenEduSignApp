// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:YemenEduSign/core/constant/AppColor.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Function(int) onTap;
  final int selectedIndex;

  const CustomBottomNavigationBar(
      {super.key, required this.onTap, required this.selectedIndex});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: widget.selectedIndex,
      items: const [
        Column(
          children: [
            Icon(Icons.school, size: 30, color: AppColor.white),
            Text("الدروس", style: TextStyle(color: AppColor.white))
          ],
        ),
        Column(
          children: [
            Icon(Icons.search, size: 30, color: AppColor.white),
            Text("البحث", style: TextStyle(color: AppColor.white))
          ],
        ),
        Column(
          children: [
            Icon(Icons.sports_esports, size: 30, color: AppColor.white),
            Text("الألعاب", style: TextStyle(color: AppColor.white))
          ],
        ),
        Column(
          children: [
            Icon(Icons.settings, size: 30, color: AppColor.white),
            Text("الإعدادات", style: TextStyle(color: AppColor.white))
          ],
        ),
      ],
      height: 60,
      onTap: widget.onTap,
      backgroundColor: const Color.fromARGB(53, 0, 109, 181),
      color: const Color.fromARGB(186, 43, 77, 135),
      buttonBackgroundColor: const Color.fromARGB(111, 0, 108, 181),
      animationDuration: const Duration(milliseconds: 300),
      animationCurve: Curves.easeInOut,
    );
  }
}
