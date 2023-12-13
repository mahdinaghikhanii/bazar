import 'package:bazar/data/api/api_checker.dart';
import 'package:bazar/data/api/state_api_enum.dart';
import 'package:bazar/data/repo/home_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../data/model/home_model.dart';
import 'index.dart';

class HomeController extends GetxController {
  final HomeRepo homeRepo;
  HomeController(this.homeRepo);

  final state = HomeState();

  final PageController sideBarPageController = PageController();

  late HomeModel spacialOfferList;
  late HomeModel topOfWeekList;

  @override
  void onInit() {
    super.onInit();
    specialOffer();
    topOfWeek();
  }

  specialOffer() async {
    try {
      state.setRxRequestStatusSpecialOffer(RequestStatus.loading);
      Response response = await homeRepo.getFlutterBooks();
      if (response.statusCode == 200) {
        spacialOfferList = HomeModel.fromJson(response.body);
        state.setRxRequestStatusSpecialOffer(RequestStatus.sucsess);
      } else {
        ApiChecker.checkApi(response);
        state.setRxRequestStatusSpecialOffer(RequestStatus.error);
      }
    } catch (e) {
      debugPrint(e.toString());
      state.setRxRequestStatusSpecialOffer(RequestStatus.error);
    }
  }

  topOfWeek() async {
    try {
      state.setRxRequestStatusTopOfWeek(RequestStatus.loading);
      Response response = await homeRepo.getSpecialOfferBooks();
      if (response.statusCode == 200) {
        topOfWeekList = HomeModel.fromJson(response.body);
        state.setRxRequestStatusTopOfWeek(RequestStatus.sucsess);
      } else {
        ApiChecker.checkApi(response);
        state.setRxRequestStatusTopOfWeek(RequestStatus.error);
      }
    } catch (e) {
      state.setRxRequestStatusTopOfWeek(RequestStatus.error);
    }
  }
}
