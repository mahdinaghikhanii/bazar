import '../../../common/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void openBottomSheet() {
  Get.bottomSheet(
      SizedBox(
          width: Get.width,
          height: 312,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 17),
            Center(
                child: Container(
                    width: 56,
                    height: 5,
                    decoration: ShapeDecoration(
                        color: const Color(0xFFE8E8E8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))))),
            const Padding(
                padding: EdgeInsets.only(top: 28, left: 24, bottom: 20),
                child: Text('Logout',
                    style: TextStyle(
                        color: Color(0xFF121212),
                        fontSize: 18,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w700,
                        height: 0.08,
                        letterSpacing: -0.54))),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    style: TextStyle(
                      color: Color(0xFF121212),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ))),
            Container(
                height: 48,
                width: Get.width,
                margin: const EdgeInsets.only(top: 36, left: 24, right: 24),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        backgroundColor: Get.theme.colorScheme.primary),
                    onPressed: () => Get.offAndToNamed(AppRoutes.login),
                    child: const Center(
                        child: Text('Logout',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.30))))),
            Container(
                height: 48,
                width: Get.width,
                margin: const EdgeInsets.only(top: 16, left: 24, right: 24),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        backgroundColor: const Color(0xFFF9F8FC)),
                    onPressed: () => Get.offAndToNamed(AppRoutes.login),
                    child: Center(
                      child: Text('Cancel',
                          style: TextStyle(
                              color: Get.theme.colorScheme.primary,
                              fontSize: 16,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.30)),
                    )))
          ])),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)));
}
