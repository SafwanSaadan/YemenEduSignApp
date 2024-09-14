// ignore_for_file: must_be_immutable, file_names, unnecessary_string_interpolations

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

import '../../../controller/DragDropController.dart';
import '../../../core/constant/AppColor.dart';
import '../../../core/constant/path/Audio_Path.dart';
import '../../../data/model/DragDrop_model.dart';

class DragDropBody extends StatefulWidget {
  const DragDropBody({super.key});

  @override
  State<DragDropBody> createState() => _DragDropBodyState();
}

class _DragDropBodyState extends State<DragDropBody> {
  late AudioPlayer player;
  late FlutterTts _flutterTts;

  final DragDropController controller =
      Get.put(DragDropController(), permanent: true);

  @override
  void initState() {
    _flutterTts = FlutterTts();
    player = AudioPlayer();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Column(
          children: controller.items
              .map(
                (item) => Container(
                  margin: const EdgeInsets.all(8),
                  child: Draggable<DragDropModel>(
                    data: item,
                    childWhenDragging: CircleAvatar(
                      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                      backgroundImage: AssetImage(item.image),
                      radius: 55,
                    ),
                    feedback: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(item.image),
                      radius: 30,
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(item.image),
                      radius: 45,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        const Spacer(flex: 4),
        Column(
          children: controller.items2.map((item) {
            return DragTarget<DragDropModel>(
              onAccept: (receivedItem) {
                if (item.value == receivedItem.value) {
                  setState(() {
                    controller.items.remove(receivedItem);
                    controller.items2.remove(item);
                    controller.scorePls();
                    item.accepting = false;
                    player.play(UrlSource(AudioPath.trueAudio));
                    _flutterTts.setLanguage('AR');
                    _flutterTts.speak('إجابة صحيحة');
                    if (controller.items.isEmpty) {
                      controller.gameOver.value = true;
                    }
                  });
                } else {
                  setState(() {
                    // controller.score -= 5;
                    controller.scoreMinus();
                    controller.update();
                    item.accepting = false;
                    player.play(UrlSource(AudioPath.falseAudio));
                    _flutterTts.setLanguage('AR');
                    _flutterTts.speak('إجابة خاطئه');
                  });
                }
              },
              onWillAccept: (receivedItem) {
                setState(() {
                  item.accepting = true;
                });
                return true;
              },
              onLeave: (receivedItem) {
                setState(() {
                  item.accepting = false;
                });
              },
              builder: (context, candidateData, rejectedData) => Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: item.accepting ? AppColor.blue1 : AppColor.blue),
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.width / 5.5,
                width: MediaQuery.of(context).size.width / 4.5,
                margin: const EdgeInsets.all(8),
                child: Text(
                  '${item.name}',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            );
          }).toList(),
        ),
        const Spacer(),
      ],
    );
  }
}
