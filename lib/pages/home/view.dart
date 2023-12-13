import '../../common/constans/images.dart';
import '../../data/api/state_api_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:svg_flutter/svg.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              leading: Container(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  Images.searchIcon,
                  width: 24,
                  height: 24,
                ),
              ),
              centerTitle: true,
              title: const Text('Home',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF121212),
                    fontSize: 20,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w700,
                    height: 0.07,
                  )),
              actions: [
                Container(
                  width: 24,
                  height: 24,
                  margin: const EdgeInsets.only(right: 24),
                  child: SvgPicture.asset(Images.notificationIcon),
                )
              ]),
          body: SafeArea(
              child: SingleChildScrollView(
                  child: Column(children: [
            Obx(() => controller.state.statusSpecialOffer.value ==
                    RequestStatus.loading
                ? sideBarSkeleton()
                : controller.state.statusSpecialOffer.value ==
                        RequestStatus.error
                    ? const Center(child: Text("WE have probelm"))
                    : controller.state.statusSpecialOffer.value ==
                            RequestStatus.sucsess
                        ? const SideBar()
                        : const SizedBox()),
            const SizedBox(height: 30),
            Obx(() =>
                controller.state.statusTopofWeek.value == RequestStatus.sucsess
                    ? titleAndSeeAllBtn(context, "Top of Week", () {})
                    : controller.state.statusTopofWeek.value ==
                            RequestStatus.loading
                        ? titleAndSeeAllSkeleton()
                        : const SizedBox()),
            const SizedBox(height: 14),
            Obx(() => controller.state.statusTopofWeek.value ==
                    RequestStatus.loading
                ? topOfWeekListSkeleton()
                : controller.state.statusTopofWeek.value == RequestStatus.error
                    ? const Center(child: Text("WE have probelm"))
                    : controller.state.statusTopofWeek.value ==
                            RequestStatus.sucsess
                        ? const TopOfWeekList()
                        : const SizedBox()),
            const SizedBox(height: 30),
            Obx(() =>
                controller.state.statusTopofWeek.value == RequestStatus.sucsess
                    ? titleAndSeeAllBtn(context, "Authors", () {})
                    : controller.state.statusTopofWeek.value ==
                            RequestStatus.loading
                        ? titleAndSeeAllSkeleton()
                        : const SizedBox()),
            Obx(() => controller.state.statusTopofWeek.value ==
                    RequestStatus.loading
                ? const AuthersListSkeletonLoadings()
                : controller.state.statusTopofWeek.value == RequestStatus.error
                    ? const Center(child: Text("WE have probelm"))
                    : controller.state.statusTopofWeek.value ==
                            RequestStatus.sucsess
                        ? const AuthersList()
                        : const SizedBox()),
          ]))));
    });
  }
}

Widget titleAndSeeAllBtn(context, String title, Function() ontapSeeAll) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(title,
          style: const TextStyle(
              color: Color(0xFF121212),
              fontSize: 18,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w700,
              letterSpacing: -0.54)),
      TextButton(
          onPressed: () {},
          child: const Text('See all',
              style: TextStyle(
                  color: Color(0xFF54408C),
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.30)))
    ]),
  );
}

Widget titleAndSeeAllSkeleton() {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SkeletonAnimation(
            borderRadius: BorderRadius.circular(50),
            shimmerDuration: 3000,
            child: Container(
                margin: const EdgeInsets.only(right: 28, bottom: 20),
                width: 110,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(61, 61, 61, 1).withOpacity(0.3),
                    borderRadius: BorderRadiusDirectional.circular(50)))),
        SkeletonAnimation(
            borderRadius: BorderRadius.circular(50),
            shimmerDuration: 3000,
            child: Container(
                margin: const EdgeInsets.only(bottom: 20, right: 8),
                width: 60,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(61, 61, 61, 1).withOpacity(0.3),
                    borderRadius: BorderRadiusDirectional.circular(50))))
      ]));
}
