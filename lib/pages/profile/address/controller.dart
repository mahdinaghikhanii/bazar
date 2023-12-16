import 'package:get/get.dart';

import 'index.dart';

class AddressController extends GetxController {
  AddressController();

  final state = AddressState();

  confirmationRequest() async {
    state.loadingConfirmation.value = true;
    await Future.delayed(const Duration(seconds: 2))
        .then((value) => Get.back());
  }
}
