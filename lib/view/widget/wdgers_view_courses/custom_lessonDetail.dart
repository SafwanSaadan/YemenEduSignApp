// ignore_for_file: file_names, must_be_immutable

import 'package:YemenEduSign/core/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:gif/gif.dart';

import '../../../controller/CourseController.dart';
import '../../../core/constant/AppColor.dart';
import '../../../data/model/WordsModel.dart';

class CustomLessonDetail extends StatefulWidget {
  final List<WordModel> words;
  const CustomLessonDetail({required this.words, super.key});

  @override
  State<CustomLessonDetail> createState() => _CustomLessonDetailState();
}

class _CustomLessonDetailState extends State<CustomLessonDetail>
    with TickerProviderStateMixin {
  late GifController gifController;
  late FlutterTts _flutterTts;

  final CourseController controller =
      Get.put(CourseController(), permanent: true);

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
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: widget.words.length,
      itemBuilder: (context, i) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.all(
                    Radius.circular(20.0)), // الحواف الدائرية هنا
              ),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(20.0), // تطبيق الحواف الدائرية
                child: Image.asset(
                  widget.words[i].imageAnimated, // الصورة المتحركة
                  fit: BoxFit.cover, // لضمان ملء الصورة للـ container بالكامل
                ),
              ),
            ),
          ),
          const SizedBox(height: Constants.sizeSpaceHeight),
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {
                _flutterTts.setLanguage('AR');
                _flutterTts.speak(widget.words[i].wordVoice);
              },
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: Gif(
                            controller: gifController,
                            autostart: Autostart.loop,
                            image: AssetImage(widget.words[i].imageStatic),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          widget.words[i].wordName,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 32.0,
                                  ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          const SizedBox(height: Constants.sizeSpaceHeight),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // زر السابق
                if (controller.currentPage >
                    0) // إذا كان الدرس الحالي هو الأول، تعطيل زر السابق
                  InkWell(
                    onTap: () {
                      controller.previous();
                    },
                    child: Container(
                      width: 110,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: AppColor.blue,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.arrow_back, color: AppColor.white),
                          // const Spacer(),
                          Text(
                            "السابق",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                    fontSize: 16.0, color: AppColor.white),
                          ),
                        ],
                      ),
                    ),
                  ),

                // عرض رقم الصفحة
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: const BoxDecoration(
                    color: AppColor.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Text('الصفحة ${controller.currentPage + 1} من 5',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 16.0, color: AppColor.white)),
                ),
                // زر التالي
                InkWell(
                  onTap: () {
                    if (controller.currentPage < 5 - 1) {
                      controller.next();
                    } else {
                      null; // إذا كان في اخر صفحة من الدرس الحالي
                    }
                  },
                  child: Container(
                    width: 110,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: AppColor.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "التالي",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(fontSize: 16.0, color: AppColor.white),
                        ),
                        // const Spacer(),
                        const Icon(Icons.arrow_forward, color: AppColor.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
