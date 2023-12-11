import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'common/routes/pages.dart';
import 'common/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bazar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF54408C)),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.verification,
      getPages: AppPages.routes,
    );
  }
}
