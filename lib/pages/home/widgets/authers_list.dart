import '../../../data/model/authers_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeleton_text/skeleton_text.dart';

class AuthersList extends StatelessWidget {
  const AuthersList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 180,
        width: Get.width,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: authersList.length,
            padding: const EdgeInsets.only(left: 24, right: 24),
            itemBuilder: (context, index) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 28),
                        width: 110,
                        height: 110,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(50)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Image.asset(authersList[index].image,
                                width: 120,
                                alignment: Alignment.center,
                                fit: BoxFit.cover))),
                    Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 6),
                        child: Text(authersList[index].title,
                            style: const TextStyle(
                                color: Color(0xFF121212),
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                height: 0.09))),
                    Text(authersList[index].category,
                        style: const TextStyle(
                            color: Color(0xFFA5A5A5),
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400))
                  ]);
            }));
  }
}

class AuthersListSkeletonLoadings extends StatelessWidget {
  const AuthersListSkeletonLoadings({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 180,
        width: Get.width,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            padding: const EdgeInsets.only(left: 24, right: 24),
            itemBuilder: (context, index) {
              return Column(children: [
                SkeletonAnimation(
                    borderRadius: BorderRadius.circular(50),
                    shimmerDuration: 3000,
                    child: Container(
                        margin: const EdgeInsets.only(right: 28),
                        width: 110,
                        height: 110,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(61, 61, 61, 1)
                                .withOpacity(0.3),
                            borderRadius:
                                BorderRadiusDirectional.circular(50)))),
                Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 6),
                    child: SkeletonAnimation(
                        borderRadius: BorderRadius.circular(50),
                        shimmerDuration: 3000,
                        child: Container(
                            margin: const EdgeInsets.only(right: 28),
                            width: 110,
                            height: 10,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(61, 61, 61, 1)
                                    .withOpacity(0.3),
                                borderRadius:
                                    BorderRadiusDirectional.circular(50))))),
                Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 0),
                    child: SkeletonAnimation(
                        borderRadius: BorderRadius.circular(50),
                        shimmerDuration: 3000,
                        child: Container(
                            margin: const EdgeInsets.only(right: 28),
                            width: 110,
                            height: 10,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(61, 61, 61, 1)
                                    .withOpacity(0.3),
                                borderRadius:
                                    BorderRadiusDirectional.circular(50)))))
              ]);
            }));
  }
}
