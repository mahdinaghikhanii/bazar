import '../../../common/constans/images.dart';
import 'widgets/maps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

import 'index.dart';

class AddressPage extends GetView<AddressController> {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressController>(builder: (_) {
      return Scaffold(
          bottomNavigationBar: Obx(() => Container(
                margin: const EdgeInsets.only(bottom: 30, left: 24, right: 24),
                width: Get.width,
                height: 48,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Get.theme.colorScheme.primary),
                    onPressed: () => controller.confirmationRequest(),
                    child: Center(
                      child: controller.state.loadingConfirmation.value == true
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              "Confirmation",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                    )),
              )),
          backgroundColor: const Color(0xFFFFFEFE),
          appBar: AppBar(
            backgroundColor: const Color(0xFFFFFEFE),
            leading: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, size: 25)),
            ),
            centerTitle: true,
            title: const Text('Address',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 26, 20, 20),
                  fontSize: 20,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w700,
                  height: 0.07,
                )),
          ),
          body: Column(children: [
            MapsWidgets(addressController: controller),
            const SizedBox(height: 15),
            Expanded(
                child: Container(
                    width: Get.width,
                    height: Get.height,
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x0F000000),
                          blurRadius: 32,
                          offset: Offset(0, -4),
                          spreadRadius: 4,
                        )
                      ],
                    ),
                    child: Column(children: [
                      Container(
                        margin: const EdgeInsets.only(top: 16, bottom: 16),
                        width: 56,
                        height: 5,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFE8E8E8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Detail Address',
                              style: TextStyle(
                                color: Color(0xFF121212),
                                fontSize: 18,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w700,
                                height: 0.08,
                                letterSpacing: -0.54,
                              ),
                            ),
                            SvgPicture.asset(Images.detailAddress)
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(children: [
                          Container(
                            margin: const EdgeInsets.only(right: 8),
                            width: 48,
                            height: 48,
                            decoration: const ShapeDecoration(
                              color: Color(0xFFF9F8FC),
                              shape: OvalBorder(),
                            ),
                            child: Center(
                              child: Icon(Icons.location_on_rounded,
                                  color: Get.theme.colorScheme.primary),
                            ),
                          ),
                          Obx(
                            () => Expanded(
                              child: Text(
                                controller.state.addressLocation.value,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          )
                        ]),
                      ),
                      Container(
                        width: Get.width,
                        margin: const EdgeInsets.only(
                            top: 24, bottom: 20, left: 24, right: 24),
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFFE8E8E8),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Save Address As',
                                  style: TextStyle(
                                    color: Color(0xFF121212),
                                    fontSize: 16,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w700,
                                    height: 0.09,
                                  )),
                            ],
                          )),
                      const SizedBox(height: 25),
                      Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Row(children: [
                            Container(
                              width: 70,
                              height: 32,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: ShapeDecoration(
                                color: const Color(0xFFF9F8FC),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Home',
                                    style: TextStyle(
                                      color: Color(0xFF54408C),
                                      fontSize: 12,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      height: 0.11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                                width: 80,
                                height: 32,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 1, color: Color(0xFFE8E8E8)),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text('Offices',
                                          style: TextStyle(
                                              color: Color(0xFFA5A5A5),
                                              fontSize: 12,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,
                                              height: 0.11))
                                    ]))
                          ]))
                    ])))
          ]));
    });
  }
}
