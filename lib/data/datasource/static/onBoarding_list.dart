// ignore_for_file: file_names

import '../../../core/constant/AppColor.dart';
import '../../../core/constant/ConstText.dart';
import '../../../core/constant/path/images_Path.dart';
import '../../model/onboarding_model.dart';

const List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      body: ConstText.onBoardingBody1,
      image: ImagesPath.onBoardingImage1,
      color: AppColor.green2),
  OnBoardingModel(
      body: ConstText.onBoardingBody1,
      image: ImagesPath.onBoardingImage2,
      color: AppColor.blue),
  OnBoardingModel(
      body: ConstText.onBoardingBody1,
      image: ImagesPath.onBoardingImage3,
      color: AppColor.blue1),
];

const List<OnBoardingModel> onBoardingList1 = [
  OnBoardingModel(
      body: ConstText.onBoardingBody2,
      image: ImagesPath.onBoardingImage4,
      color: AppColor.grey),
  OnBoardingModel(
      body: ConstText.onBoardingBody2,
      image: ImagesPath.onBoardingImage5,
      color: AppColor.blue2),
  OnBoardingModel(
      body: ConstText.onBoardingBody2,
      image: ImagesPath.onBoardingImage6,
      color: AppColor.red1),
];
