import 'package:get/get.dart';

import '../../common/widgets/custom_snackbar.dart';

class ApiChecker {
  static void checkApi(Response response) async {
    if (response.statusCode == 401) {
      /// Refresh Token
    } else {
      CustomSnackbar.show(title: "Error", message: "We have problems!");
    }
  }
}
