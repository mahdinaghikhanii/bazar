import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLoadingWidgets extends StatelessWidget {
  const CustomLoadingWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: Get.theme.colorScheme.primary,
    );
  }
}
