import 'package:bazar/common/routes/routes.dart';
import 'package:bazar/pages/auth/congratulation/congratulation.dart';
import 'package:bazar/pages/auth/verification/index.dart';
import 'package:get/get.dart';

class AppPages {
  static const initial = AppRoutes.verification;
  static final List<GetPage> routes = [
    GetPage(
        name: AppRoutes.verification,
        page: () => const VerificationPage(),
        binding: VerificationBinding()),
    GetPage(
        name: AppRoutes.congratulation, page: () => const CongratulationPage())
  ];
}
