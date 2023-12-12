import 'package:bazar/pages/home/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../data/model/home_model.dart';

class SideBar extends GetView<HomeController> {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: Get.width,
          height: 146,
          child: PageView.builder(
              controller: controller.sideBarPageController,
              itemCount: controller.spacialOfferList.items!.length,
              itemBuilder: ((context, index) {
                return _slide(
                    controller.spacialOfferList.items![index].volumeInfo!);
              })),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: SmoothPageIndicator(
            controller: controller.sideBarPageController,
            count: controller.spacialOfferList.items!.length,
            axisDirection: Axis.horizontal,
            effect: WormEffect(
                spacing: 4.0,
                dotWidth: 8,
                dotHeight: 8,
                paintStyle: PaintingStyle.fill,
                strokeWidth: 1.5,
                dotColor: Color(0xFFE4DDF7),
                activeDotColor: Get.theme.colorScheme.primary),
          ),
        )
      ],
    );
  }
}

Widget _slide(VolumeInfo volumeInfo) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 24),
    height: 146,
    width: Get.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: const Color(0xFFF9F8FC),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 5),
                  child: Text(
                    volumeInfo.title!,
                    maxLines: 2,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Color(0xFF121212),
                      fontSize: 20,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.60,
                    ),
                  ),
                ),
                const Text(
                  'Discount 25%',
                  style: TextStyle(
                    color: Color(0xFF121212),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 0.10,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: 118,
                  height: 36,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.zero,
                          backgroundColor: Get.theme.colorScheme.primary),
                      onPressed: () {},
                      child: const Center(
                          child: Text(
                        "Order Now",
                        style: TextStyle(color: Colors.white),
                      ))),
                )
              ],
            ),
          ),
        ),
        Image.network(
          width: 99,
          height: 145,
          volumeInfo.imageLinks!.smallThumbnail!,
          fit: BoxFit.cover,
        )
      ],
    ),
  );
}
