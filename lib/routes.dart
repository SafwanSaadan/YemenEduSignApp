import 'package:get/get.dart';

import 'controller/middleware/OnBoardingMiddleware.dart';
import 'core/constant/AppRoutes.dart';
import 'view/screens/Category/Lesson_Screen.dart';
import 'view/screens/Category/category_Screen.dart';
import 'view/screens/Game/Calculation_game_Screen.dart';
import 'view/screens/Game/DragDropGame_Screen.dart';
import 'view/screens/Game/Memory_Game_Screen.dart';
import 'view/screens/Search_Screen.dart';
import 'view/screens/games_Screen.dart';
import 'view/screens/onBoarding_Screen.dart';

// Map<String, Widget Function(BuildContext)> routes = {
//   AppRoutes.login: (context) => LoginScreen(),
// };

List<GetPage<dynamic>>? getPages = [
  GetPage(
      name: AppRoutes.onBoarding,
      page: () => const OnBoardingScreen(),
      middlewares: [OnBoardingMiddleware()]),
  GetPage(name: AppRoutes.games, page: () => GamesScreen()),
  GetPage(name: AppRoutes.dragDropGame, page: () => const DragDropGameScreen()),
  GetPage(name: AppRoutes.calcGame, page: () => const CalculationGameScreen()),
  GetPage(name: AppRoutes.memoryGame, page: () => const MemoryGameScreen()),
  GetPage(name: AppRoutes.search, page: () => const SearchScreen()),
  GetPage(name: AppRoutes.categories, page: () => const CategoryScreen()),
  GetPage(name: AppRoutes.lessons, page: () => const LessonScreen()),
];
