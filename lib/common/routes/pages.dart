import 'routes.dart';
import '../../pages/auth/congratulation/congratulation.dart';
import '../../pages/auth/verification/index.dart';
import 'package:get/get.dart';

import '../../pages/home_navigation.dart';

class AppPages {
  static const initial = AppRoutes.homeNavigation;
  static final List<GetPage> routes = [
    GetPage(
        name: AppRoutes.verification,
        page: () => const VerificationPage(),
        binding: VerificationBinding()),
    GetPage(
        name: AppRoutes.congratulation, page: () => const CongratulationPage()),
    GetPage(
        name: AppRoutes.homeNavigation, page: () => const HomeNavigationPage())
  ];
}
