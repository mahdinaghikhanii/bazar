import 'package:bazar/common/constans/images.dart';
import 'package:bazar/common/routes/routes.dart';
import 'package:bazar/pages/profile/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/log_out_bottom_sheet.dart';

class ProfilePages extends StatelessWidget {
  const ProfilePages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text('Profile',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF121212),
                  fontSize: 20,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w700,
                  height: 0.07,
                ))),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
                width: Get.width,
                margin: const EdgeInsets.only(top: 18),
                decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFFE8E8E8))))),
            Container(
                margin: const EdgeInsets.only(left: 24, top: 16, right: 16),
                child: Row(children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset(
                        Images.myImageProfile,
                        width: 56,
                        height: 56,
                      )),
                  const SizedBox(width: 16),
                  const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mahdinaghikhani",
                            style: TextStyle(
                                color: Color(0xFF121212),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.30)),
                        SizedBox(height: 8),
                        Text('(+1) 234 567 890',
                            style: TextStyle(
                                color: Color(0xFFA5A5A5),
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 0.10))
                      ]),
                  const Spacer(),
                  TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () => openBottomSheet(),
                      child: const Text('Logout',
                          style: TextStyle(
                              color: Color(0xFFEF5A56),
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              height: 0.10,
                              letterSpacing: 0.30))),
                ])),
            Container(
                width: Get.width,
                margin: const EdgeInsets.only(top: 18),
                decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFE8E8E8)),
                ))),
            CustomContainerWidgets(
                title: "My Account",
                icon: Images.personIocn,
                ontap: () => Get.toNamed(AppRoutes.myAccount)),
            CustomContainerWidgets(
                title: "Address", icon: Images.addressIcon, ontap: () {}),
            CustomContainerWidgets(
                title: "Offers & Promos",
                icon: Images.offresIcon,
                ontap: () {}),
            CustomContainerWidgets(
                title: "Your Favorites",
                icon: Images.favoriteIcon,
                ontap: () {}),
            CustomContainerWidgets(
                title: "Order History",
                icon: Images.orderHistoryIcon,
                ontap: () {}),
            CustomContainerWidgets(
                title: "Help Center",
                icon: Images.helpCenterIcon,
                ontap: () {}),
          ]),
        ));
  }
}
