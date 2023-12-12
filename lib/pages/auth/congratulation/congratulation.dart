import 'dart:math';

import 'package:bazar/common/constans/images.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

class CongratulationPage extends StatefulWidget {
  const CongratulationPage({super.key});

  @override
  State<CongratulationPage> createState() => _CongratulationPageState();
}

class _CongratulationPageState extends State<CongratulationPage> {
  late ConfettiController _controllerCenter;
  late ConfettiController _controllerCenterRight;
  late ConfettiController _controllerCenterLeft;
  late ConfettiController _controllerTopCenter;
  late ConfettiController _controllerBottomCenter;

  @override
  void dispose() {
    _controllerCenter.dispose();
    _controllerCenterRight.dispose();
    _controllerCenterLeft.dispose();
    _controllerTopCenter.dispose();
    _controllerBottomCenter.dispose();
    super.dispose();
  }

  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  void initState() {
    super.initState();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 2));
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 2));
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 2));
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 4));
    _controllerBottomCenter =
        ConfettiController(duration: const Duration(seconds: 2));
    Future.delayed(const Duration(seconds: 2)).then((value) {
      playAnimation();
      setState(() {});
    });
  }

  playAnimation() {
    _controllerCenterRight.play();
    _controllerCenter.play();
    _controllerCenterLeft.play();
    _controllerTopCenter.play();
    _controllerBottomCenter.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEFE),
      body: Stack(
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: SvgPicture.asset(Images.boxStar)),
                const Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    'Congratulation!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF121212),
                      fontSize: 24,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.72,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Text(
                    'your account is complete, please enjoy the best menu from us.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFA5A5A5),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  width: Get.width,
                  height: 48,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF54408C)),
                      onPressed: () {},
                      child: const Text("Get Started",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16))),
                ),
              ]),
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: _controllerCenter,
              blastDirectionality: BlastDirectionality
                  .explosive, // don't specify a direction, blast randomly
              shouldLoop:
                  true, // start again as soon as the animation is finished
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ], // manually specify the colors to be used
              createParticlePath: drawStar, // define a custom shape/path.
            ),
          ),

          //CENTER RIGHT -- Emit left
          Align(
            alignment: Alignment.centerRight,
            child: ConfettiWidget(
              confettiController: _controllerCenterRight,
              blastDirection: pi, // radial value - LEFT
              particleDrag: 0.05, // apply drag to the confetti
              emissionFrequency: 0.05, // how often it should emit
              numberOfParticles: 20, // number of particles to emit
              gravity: 0.05, // gravity - or fall speed
              shouldLoop: false,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink
              ], // manually specify the colors to be used
              strokeWidth: 1,
              strokeColor: Colors.white,
            ),
          ),

          //CENTER LEFT - Emit right
          Align(
            alignment: Alignment.centerLeft,
            child: ConfettiWidget(
              confettiController: _controllerCenterLeft,
              blastDirection: 0, // radial value - RIGHT
              emissionFrequency: 0.6,
              minimumSize: const Size(10,
                  10), // set the minimum potential size for the confetti (width, height)
              maximumSize: const Size(50,
                  50), // set the maximum potential size for the confetti (width, height)
              numberOfParticles: 1,
              gravity: 0.1,
            ),
          ),

          //TOP CENTER - shoot down
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _controllerTopCenter,
              blastDirection: pi / 2,
              maxBlastForce: 5, // set a lower max blast force
              minBlastForce: 2, // set a lower min blast force
              emissionFrequency: 0.05,
              numberOfParticles: 50, // a lot of particles at once
              gravity: 1,
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: ConfettiWidget(
              confettiController: _controllerBottomCenter,
              blastDirection: -pi / 2,
              emissionFrequency: 0.01,
              numberOfParticles: 20,
              maxBlastForce: 100,
              minBlastForce: 80,
              gravity: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}
