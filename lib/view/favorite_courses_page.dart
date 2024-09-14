import 'dart:io';
import 'package:flutter/material.dart';


class FavoriteCoursesPage extends StatefulWidget {
  const FavoriteCoursesPage({super.key});

  @override
  State<FavoriteCoursesPage> createState() => _FavoriteCoursesPageState();
}

class _FavoriteCoursesPageState extends State<FavoriteCoursesPage> {
  final List<Map<String, dynamic>> _favorites = [];

  @override
  void initState() {
    super.initState();
    // _loadFavorites();
  }

  // Future<void> _loadFavorites() async {
  //   List<Map<String, dynamic>> favorites = await FirestoreDatabaseHelper().getFavorites();
  //   setState(() {
  //     _favorites = favorites;
  //   });
  // }

  // Future<void> _removeFavorite(Map<String, dynamic> course) async {
  //   await FirestoreDatabaseHelper().removeFavorite(course);
  //   setState(() {
  //     _favorites.removeWhere((favorite) => favorite['id'] == course['id']);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromARGB(53, 0, 109, 181),
      body: _favorites.isEmpty
          ? const Center(child: Text('No favorite courses found'))
          : ListView.builder(
              itemCount: _favorites.length,
              itemBuilder: (context, index) {
                final course = _favorites[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (course['image'] != null)
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                              ),
                              image: DecorationImage(
                                image: FileImage(File(course['image'])),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Course Name: ${course['course_name']}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  'Date: ${course['date']}',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14.0,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () async {
                                      // await _removeFavorite(course);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}