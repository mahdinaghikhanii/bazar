import 'package:flutter/material.dart';

class FirstStep extends StatelessWidget {
  const FirstStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 13),
          child: TextButton(onPressed: () {}, child: const Text("Skip"))),
      Center(
          child: Image.asset(
        "assets/first.png",
        width: 320,
        height: 320,
      )),
      const SizedBox(height: 14),
      const Center(
          child: Text(
        "Now reading books\n will be easier",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Color(0xFF121212),
            fontSize: 24,
            letterSpacing: -0.72,
            fontWeight: FontWeight.w700),
      )),
      const SizedBox(height: 12),
      const Text(
        ' Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFFA5A5A5),
          fontSize: 16,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
      ),
    ]);
  }
}
