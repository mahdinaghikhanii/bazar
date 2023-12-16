import '../index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeleton_text/skeleton_text.dart';

import '../../../data/model/home_model.dart';

class TopOfWeekList extends GetView<HomeController> {
  const TopOfWeekList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      width: Get.width,
      child: ListView.builder(
          padding: const EdgeInsets.only(left: 24, right: 24),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: controller.topOfWeekList.items!.length,
          itemBuilder: (context, index) {
            return listItems(controller.topOfWeekList.items![index].volumeInfo!,
                controller.topOfWeekList.items![index].saleInfo!);
          }),
    );
  }
}

Widget listItems(VolumeInfo volumeInfo, SaleInfo saleInfo) {
  return Container(
      margin: const EdgeInsets.only(right: 9),
      width: 127,
      height: 200,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.network(volumeInfo.imageLinks!.smallThumbnail!,
            fit: BoxFit.cover, height: 180),
        const SizedBox(height: 6),
        Text(volumeInfo.title!,
            maxLines: 1,
            style: const TextStyle(
                color: Color(0xFF121212),
                fontSize: 14,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500)),
        const SizedBox(height: 14),
        Text("\$${saleInfo.listPrice!.amount.toString()}",
            style: const TextStyle(
                color: Color(0xFF54408C),
                fontSize: 12,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                height: 0.11,
                letterSpacing: 0.30))
      ]));
}

topOfWeekListSkeleton() {
  return SizedBox(
      height: 240,
      width: Get.width,
      child: ListView.builder(
          padding: const EdgeInsets.only(left: 24, right: 24),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 8,
          itemBuilder: (context, index) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SkeletonAnimation(
                    //   shimmerColor: Color.fromRGBO(61, 61, 61, 1),
                    borderRadius: BorderRadius.circular(0),
                    shimmerDuration: 3000,
                    child: Container(
                        margin: const EdgeInsets.only(right: 9),
                        width: 127,
                        height: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(61, 61, 61, 1)
                                .withOpacity(0.3),
                            borderRadius: BorderRadiusDirectional.circular(0))),
                  ),
                  const SizedBox(height: 6),
                  SkeletonAnimation(
                      //   shimmerColor: Color.fromRGBO(61, 61, 61, 1),
                      borderRadius: BorderRadius.circular(0),
                      shimmerDuration: 3000,
                      child: Container(
                          margin: const EdgeInsets.only(right: 9),
                          width: 90,
                          height: 10,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(61, 61, 61, 1)
                                  .withOpacity(0.3),
                              borderRadius:
                                  BorderRadiusDirectional.circular(0)))),
                  const SizedBox(height: 14),
                  SkeletonAnimation(
                      //   shimmerColor: Color.fromRGBO(61, 61, 61, 1),
                      borderRadius: BorderRadius.circular(0),
                      shimmerDuration: 3000,
                      child: Container(
                          margin: const EdgeInsets.only(right: 9),
                          width: 90,
                          height: 10,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(61, 61, 61, 1)
                                  .withOpacity(0.3),
                              borderRadius:
                                  BorderRadiusDirectional.circular(0))))
                ]);
          }));
}
