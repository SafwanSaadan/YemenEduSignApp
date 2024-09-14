// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'screens/Category/category_Screen.dart';
import 'screens/games_Screen.dart';
import 'widget/custom_Bottom_NavigationBar.dart';
import 'screens/Search_Screen.dart';
import 'widget/custom_category.dart';

class BottomNavigationBarApp extends StatefulWidget {
  const BottomNavigationBarApp({super.key});

  @override
  State<BottomNavigationBarApp> createState() => _BottomNavigationBarAppState();
}

class _BottomNavigationBarAppState extends State<BottomNavigationBarApp> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const CategoryScreen(),
    const SearchScreen(),
    GamesScreen(),
    CustomCategory(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
