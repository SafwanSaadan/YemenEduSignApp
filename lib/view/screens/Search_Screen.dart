// ignore_for_file: library_private_types_in_public_api, file_names, invalid_use_of_protected_member
import 'package:YemenEduSign/core/constant/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../controller/FloatingController.dart';
import '../../controller/SearchController.dart';

import '../../data/datasource/bg_data.dart';
import '../widget/custom_card_search.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FloatingController controller1 =
      Get.put(FloatingController(), permanent: true);
  final SearchControl searchController =
      Get.put(SearchControl(), permanent: true);

  bool _isListening = false;
  late stt.SpeechToText _speech;
  late FlutterTts _flutterTts;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _flutterTts = FlutterTts();
    searchController.loadJson(); // Load JSON data on init
  }

  void _startListening() async {
    bool available = await _speech.initialize();
    if (available) {
      setState(() => _isListening = true);
      _speech.listen(onResult: (val) {
        setState(() {
          _searchController.text = val.recognizedWords;
          searchController.search(val.recognizedWords);
        });
      });
    }
  }

  void _stopListening() {
    setState(() => _isListening = false);
    _speech.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   title: Text(
          //     'صفحة البحث',
          //     style: Theme.of(context).textTheme.bodyLarge,
          //   ),
          //   centerTitle: true,
          // ),

          body: Obx(
            () => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(bgList[controller1.selectedIndex]),
                  fit: BoxFit.fill,
                ),
              ),
              child: searchController.isLoading.value
                  ? const Center(
                      child:
                          CircularProgressIndicator()) // Show loading indicator
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _searchController,
                            onChanged: searchController.search,
                            decoration: InputDecoration(
                              fillColor: AppColor.grey.withOpacity(0.5),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: AppColor.green),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              labelText: 'بحث',
                              labelStyle:
                                  const TextStyle(color: AppColor.white),
                              prefixIcon: const Icon(Icons.search,
                                  color: AppColor.white),
                              suffixIcon: IconButton(
                                icon: Icon(
                                    _isListening ? Icons.mic : Icons.mic_none,
                                    color: _isListening
                                        ? AppColor.green
                                        : AppColor.white),
                                onPressed: _isListening
                                    ? _stopListening
                                    : _startListening,
                              ),
                            ),
                          ),
                        ),
                        CustomSearchResults(
                            searchResults:
                                searchController.searchResults.value),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _speech.stop();
    _flutterTts.stop();
    super.dispose();
  }
}
