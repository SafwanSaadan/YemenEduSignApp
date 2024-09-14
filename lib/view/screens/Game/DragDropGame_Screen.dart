// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

import '../../../controller/DragDropController.dart';
import '../../../controller/FloatingController.dart';
import '../../../core/constant/path/Audio_Path.dart';
import '../../../data/datasource/bg_data.dart';
import '../../widget/Game/DragDropBody.dart';

class DragDropGameScreen extends StatefulWidget {
  const DragDropGameScreen({super.key});

  @override
  State<DragDropGameScreen> createState() => _DragDropGameState();
}

class _DragDropGameState extends State<DragDropGameScreen> {
  final DragDropController controller =
      Get.put(DragDropController(), permanent: true);
  final FloatingController controller1 =
      Get.put(FloatingController(), permanent: true);
  late AudioPlayer player;
  late FlutterTts _flutterTts;

  initGame() {
    controller.score.value = 0;
    controller.gameOver.value = false;
    // shuffle يعني خلط العناصر التي داخل List يعني يتم عرض العناصر بشكل عشوائي
    controller.shuffle();
  }

  @override
  void initState() {
    _flutterTts = FlutterTts();
    player = AudioPlayer();
    super.initState();
    initGame();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(15),
            child: Obx(() => Text.rich(
                  TextSpan(children: [
                    TextSpan(
                        text: 'الدرجة : ',
                        style: Theme.of(context).textTheme.headlineMedium),
                    TextSpan(
                        text: '${controller.score}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: Colors.teal)),
                  ]),
                )),
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Obx(() {
                  if (!controller.gameOver.value) {
                    return const DragDropBody();
                  } else {
                    return Column(
                      children: [
                        Center(
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: result() == 'ممتاز'
                                  ? Text(
                                      'إنتهت اللعبة !!!',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge!
                                          .copyWith(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      'إنتهت اللعبة !!!',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge!
                                          .copyWith(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                    ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: result() == 'ممتاز'
                                  ? Text(
                                      result(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      result(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                    ),
                            ),
                          ]),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.width / 10,
                          width: MediaQuery.of(context).size.width / 3,
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.teal),
                          alignment: Alignment.center,
                          child: TextButton(
                            child: Text(
                              'إلعب من جديد',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.white),
                            ),
                            onPressed: () {
                              initGame();
                            },
                          ),
                        ),
                      ],
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String result() {
    if (controller.score >= 70) {
      player.play(UrlSource(AudioPath.success));
      _flutterTts.setLanguage('AR');
      _flutterTts.speak('أحسنت ممتاز');
      return 'ممتاز';
    } else {
      player.play(UrlSource(AudioPath.tryAgain));
      _flutterTts.setLanguage('AR');
      _flutterTts
          .speak('عفواً لقد حصلت على درجات منخفضة جداً أعد المحاولة !!!');
      return 'عفواً لقد حصلت على درجات منخفضة جداً أعد المحاولة !!!';
    }
  }
}
