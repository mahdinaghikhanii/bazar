import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../common/widgets/image.dart';
import '../../data/model/home_model.dart';

class DetailPage extends StatelessWidget {
  final Items items;
  const DetailPage({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back)),
          centerTitle: true,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              titelAnd(items),
              reviews(),
              addAndRemoveCartButton(),
              buttonViewCartAndContinue()
            ]))));
  }
}

Widget titelAnd(Items items) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Center(
      child: SizedBox(
        width: 237,
        height: 313,
        child: ImageLoadingService(
            borderRadius: BorderRadius.circular(20),
            imgUrl: items.volumeInfo!.imageLinks!.thumbnail!),
      ),
    ),
    const SizedBox(height: 40),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: Text(
            items.volumeInfo!.title.toString(),
            style: const TextStyle(
              color: Color(0xFF121212),
              fontSize: 20,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w700,
              letterSpacing: -0.60,
            ),
          ),
        ),
        FavoriteButton(
          iconSize: 44,
          valueChanged: (_) {},
        ),
      ]),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 15, left: 24, right: 24, bottom: 24),
      child: Text(
        items.volumeInfo!.description.toString(),
        style: const TextStyle(
          color: Color(0xFFA5A5A5),
          fontSize: 14,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  ]);
}

Widget reviews() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        'Review',
        style: TextStyle(
          color: Color(0xFF121212),
          fontSize: 18,
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w700,
          letterSpacing: -0.54,
        ),
      ),
      const SizedBox(height: 4),
      Row(
        children: [
          RatingBar.builder(
            initialRating: 4,
            minRating: 0.0,
            direction: Axis.horizontal,
            allowHalfRating: false,
            tapOnlyMode: false,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          const Text(
            '(4.0)',
            style: TextStyle(
              color: Color(0xFF121212),
              fontSize: 14,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    ]),
  );
}

Widget addAndRemoveCartButton() {
  return Row(children: [
    Container(
      margin: const EdgeInsets.only(top: 24, left: 24, right: 12),
      width: 106,
      height: 40,
      padding: const EdgeInsets.all(8),
      decoration: ShapeDecoration(
        color: const Color(0xFFF9F9F9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: const ShapeDecoration(
              color: Color(0xFFE8E8E8),
              shape: OvalBorder(),
            ),
            child: const Center(
              child: Icon(Icons.remove),
            ),
          ),
          const Text(
            "1",
            style: TextStyle(
              color: Color(0xFF121212),
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            width: 24,
            height: 24,
            decoration: ShapeDecoration(
              color: Get.theme.colorScheme.primary,
              shape: const OvalBorder(),
            ),
            child: const Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
    const Padding(
        padding: EdgeInsets.only(left: 0, top: 25),
        child: Text(
          '\$39.99',
          style: TextStyle(
            color: Color(0xFF54408C),
            fontSize: 16,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
        ))
  ]);
}

Widget buttonViewCartAndContinue() {
  return Container(
    height: 48,
    width: Get.width,
    margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
    child: Row(children: [
      Expanded(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Get.theme.colorScheme.primary),
            onPressed: () {},
            child: const Center(
              child: Text(
                "Continue shopping",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.30,
                ),
              ),
            )),
      ),
      const SizedBox(width: 10),
      SizedBox(
        width: 129,
        child: ElevatedButton(
            onPressed: () {},
            child: Center(
              child: Text(
                "View cart",
                style: TextStyle(
                  color: Get.theme.colorScheme.primary,
                  fontSize: 16,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.30,
                ),
              ),
            )),
      )
    ]),
  );
}
