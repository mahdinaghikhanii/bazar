import 'package:flutter/material.dart';

class SecoundStep extends StatelessWidget {
  const SecoundStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 13),
          child: TextButton(onPressed: () {}, child: const Text("Skip"))),
      Center(
          child: Image.asset(
        "assets/secound.png",
        width: 320,
        height: 320,
      )),
      const SizedBox(height: 14),
      const Center(
          child: Text(
        "Your Bookish Soulmate\nAwaits",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Color(0xFF121212),
            fontSize: 24,
            letterSpacing: -0.72,
            fontWeight: FontWeight.w700),
      )),
      const SizedBox(height: 12),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          'Let us be your guide to the perfect read. Discover books tailored to your tastes for a truly rewarding experience.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFA5A5A5),
            fontSize: 16,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ]);
  }
}
