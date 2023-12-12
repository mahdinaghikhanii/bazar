import 'package:bazar/common/constans/images.dart';
import 'package:bazar/data/api/state_api_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

import '../../common/widgets/loading.dart';
import 'index.dart';
import 'widgets/widgets.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) {
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
            child: Column(
              children: [
                Obx(() => controller.state.statusSpecialOffer.value ==
                        RequestStatus.loading
                    ? const CustomLoadingWidgets()
                    : controller.state.statusSpecialOffer.value ==
                            RequestStatus.error
                        ? const Center(child: Text("WE have probelm"))
                        : controller.state.statusSpecialOffer.value ==
                                RequestStatus.sucsess
                            ? const SideBar()
                            : const SizedBox()),
                const SizedBox(height: 30),
                titleAndSeeAllBtn(context, "Top of Week", () {}),
                const SizedBox(height: 14),
                Obx(() => controller.state.statusTopofWeek.value ==
                        RequestStatus.loading
                    ? const CustomLoadingWidgets()
                    : controller.state.statusTopofWeek.value ==
                            RequestStatus.error
                        ? const Center(child: Text("WE have probelm"))
                        : controller.state.statusTopofWeek.value ==
                                RequestStatus.sucsess
                            ? const TopOfWeekList()
                            : const SizedBox()),
                const SizedBox(height: 30),
                titleAndSeeAllBtn(context, "Authors", () {}),
                const AuthersList()
              ],
            ),
          )),
        );
      },
    );
  }
}

Widget titleAndSeeAllBtn(context, String title, Function() ontapSeeAll) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        title,
        style: const TextStyle(
          color: Color(0xFF121212),
          fontSize: 18,
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w700,
          letterSpacing: -0.54,
        ),
      ),
      TextButton(
          onPressed: () {},
          child: const Text(
            'See all',
            style: TextStyle(
              color: Color(0xFF54408C),
              fontSize: 14,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
              letterSpacing: 0.30,
            ),
          ))
    ]),
  );
}
