// ignore_for_file: implementation_imports, file_names

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';

import '../../core/constant/AppRoutes.dart';
import '../../main.dart';

class OnBoardingMiddleware implements GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (sharedPref!.getString("id") != null) {
      return const RouteSettings(name: AppRoutes.categories);
    }
    return null;
  }

  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    throw UnimplementedError();
  }

  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    throw UnimplementedError();
  }

  @override
  Widget onPageBuilt(Widget page) {
    throw UnimplementedError();
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    throw UnimplementedError();
  }

  @override
  void onPageDispose() {}

  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) {
    throw UnimplementedError();
  }

  @override
  set priority(int? priority) {
    priority = 1;
  }
}
