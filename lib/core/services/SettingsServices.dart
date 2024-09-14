// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/FloatingController.dart';
import '../../main.dart';

class SettingsServices extends GetxService {
  Future<SettingsServices> init() async {
    sharedPref = await SharedPreferences.getInstance();
    return this;
  }

  setSelectedIndex() {
    int selectedIndex = FloatingController().selectedIndex;
    sharedPref!.setInt('selectedIndex', selectedIndex);
  }
}
