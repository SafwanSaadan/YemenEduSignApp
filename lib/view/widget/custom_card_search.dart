// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:gif/gif.dart';

import '../../core/constant/AppColor.dart';

class CustomSearchResults extends StatefulWidget {
  const CustomSearchResults({required this.searchResults, super.key});
  final List<dynamic> searchResults;

  @override
  State<CustomSearchResults> createState() => _CustomSearchResultsState();
}

class _CustomSearchResultsState extends State<CustomSearchResults>
    with TickerProviderStateMixin {
  late GifController gifController;
  late FlutterTts _flutterTts;

  @override
  void initState() {
    super.initState();
    _flutterTts = FlutterTts();
    gifController = GifController(vsync: this);
  }

  @override
  void dispose() {
    gifController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: widget.searchResults.length,
          itemBuilder: (context, index) {
            var result = widget.searchResults[index];
            return InkWell(
              onTap: () {
                _flutterTts.setLanguage('AR');
                _flutterTts.speak(result['word_voice']);
              },
              child: Card(
                elevation: 0.2,
                color: AppColor.white.withOpacity(0.9),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  height: 170,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Gif(
                            controller: gifController,
                            autostart: Autostart.loop,
                            image: AssetImage(result['image_animated']),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(result['image_static']),
                                Text(result['word_name']),
                              ]),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            icon: const Icon(Icons.play_arrow),
                            onPressed: () {
                              _flutterTts.setLanguage('AR');
                              _flutterTts.speak(result['word_voice']);
                            },
                          ),
                        ),
                      ]),
                ),
              ),
            );
          }),
    );
  }
}
