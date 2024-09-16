// ignore_for_file: prefer_typing_uninitialized_variables, file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gif/gif.dart';

import '../../../controller/FloatingController.dart';
import '../../../controller/Games/MemoryGameController.dart';
import '../../../core/constant/AppColor.dart';
import '../../../data/datasource/bg_data.dart';
import '../../../data/model/Games/MemoryGame_model.dart';
import '../../widget/widgets_Game/ScoreBoard_MGame.dart';
import '../../widget/widgets_Game/memGame_GridView.dart';

class MemoryGameScreen extends StatefulWidget {
  const MemoryGameScreen({super.key});

  @override
  State<MemoryGameScreen> createState() => _MemoryGameScreenState();
}

class _MemoryGameScreenState extends State<MemoryGameScreen>
    with TickerProviderStateMixin {
  final MemoryGameController controller =
      Get.put(MemoryGameController(), permanent: true);
  final FloatingController controller1 =
      Get.put(FloatingController(), permanent: true);
  late GifController gifController;

  final MemoryGameModel _game = MemoryGameModel();
  late List<dynamic> _jsonData;
  late List<dynamic> _jsonData1;

  @override
  void initState() {
    super.initState();
    _loadJson(); // Store loaded JSON data
    _game.initMemoryGame();
    gifController = GifController(vsync: this);
  }

  @override
  void dispose() {
    gifController.dispose();
    super.dispose();
  }

  Future<void> _loadJson() async {
    String jsonString = await rootBundle.loadString('assets/data.json');
    _jsonData = json.decode(jsonString);
    _jsonData1 = json.decode(jsonString);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColor.blue2,
        appBar: AppBar(
          title: Text(
            'لعبة التذكر',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColor.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(bgList[controller1.selectedIndex]),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() {
                return Expanded(
                  flex: 3,
                  child: Gif(
                    controller: gifController,
                    autostart: Autostart.loop,
                    image: AssetImage(
                        _jsonData[controller.rendomIndex.value]['image']),
                    fit: BoxFit.scaleDown,
                  ),
                );
              }),
              Obx(() {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ScoreBoardMemoryGame(
                          title: "المحاولة", info: "${controller.tries.value}"),
                      ScoreBoardMemoryGame(
                          title: 'الدرجة', info: '${controller.score.value}'),
                    ]);
              }),
              Expanded(
                flex: 7,
                child: MemGameGrideView(
                  jsonData: _jsonData,
                  jsonData1: _jsonData1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
