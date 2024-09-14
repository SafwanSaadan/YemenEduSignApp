// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onShowBottomSheet;
  final String title;
  final bool showLeading; 
  final IconData emojiIcon; 

  const CustomAppBar({
    super.key,
    required this.onShowBottomSheet,
    required this.title,
    this.showLeading = true, 
    required this.emojiIcon, 
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0, // No shadow
      automaticallyImplyLeading: showLeading,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (showLeading)
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: Colors.white,
                ),
              SizedBox(width: showLeading ? 10 : 0),
              Text(
                title,
                style: GoogleFonts.cairo(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Icon(
              emojiIcon,
              key: ValueKey(emojiIcon),
              color: Colors.yellow, 
              size: 28,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.account_circle),
          color: Colors.white,
          onPressed: onShowBottomSheet,
        ),
      ],
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 43, 77, 135),
              Color.fromARGB(255, 130, 215, 255),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
