import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'index.dart';

class VerificationController extends GetxController {
  VerificationController();

  final state = VerificationState();

  StreamController<ErrorAnimationType>? errorController;
  TextEditingController smsTextController = TextEditingController();

  void authUpdate({@required var type, @required var submitted}) {
    checkCodeForStyle(submitted);
    update(['subtitleTextType', 'checkCodeForStyle']);
  }

  checkCodeForStyle(var submitted) {
    if (submitted.toString() == "1234") {
      state.subtitleTextStyle.value = "Verified";
    } else {
      state.subtitleTextStyle.value = "Wrong";
    }
  }

  Text subtitleTextType(var type) {
    debugPrint('subtitleTextType: $type');
    switch (type) {
      case "Verified":
        errorController!.add(ErrorAnimationType.clear);
        return Text("Your number has been verified successfully",
            textAlign: TextAlign.center,
            style: Get.textTheme.titleMedium!
                .copyWith(color: const Color(0xff7CFF4E), fontSize: 13));

      case "Wrong":
        errorController!.add(ErrorAnimationType.shake);
        return Text("Wrong code, please try again",
            textAlign: TextAlign.center,
            style: Get.textTheme.titleMedium!
                .copyWith(color: const Color(0xffFF5959), fontSize: 12));
      default:
        return const Text('');
    }
  }

  @override
  onInit() {
    super.onInit();
    errorController = StreamController<ErrorAnimationType>();
  }

  @override
  void dispose() {
    super.dispose();
    smsTextController.dispose();
  }
}
