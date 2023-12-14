import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CustomContainerWidgets extends StatelessWidget {
  final String title;
  final String icon;
  final Function() ontap;
  const CustomContainerWidgets(
      {super.key,
      required this.title,
      required this.icon,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            left: 24, right: 24, top: title == 'My Account' ? 16 : 16),
        child: InkWell(
          onTap: ontap,
          child: Row(children: [
            Container(
                margin: const EdgeInsets.only(right: 16),
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: const ShapeDecoration(
                    color: Color(0xFFF9F8FC), shape: OvalBorder()),
                child: SvgPicture.asset(icon, width: 18.67, height: 18.83)),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF121212),
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                height: 0.09,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFFA6A6A6),
              size: 19,
            )
          ]),
        ));
  }
}
