import 'package:get/get.dart';

import '../../data/api/state_api_enum.dart';

class HomeState {
  final statusSpecialOffer = RequestStatus.pure.obs;
  void setRxRequestStatusSpecialOffer(RequestStatus value) =>
      statusSpecialOffer.value = value;

  final statusTopofWeek = RequestStatus.pure.obs;
  void setRxRequestStatusTopOfWeek(RequestStatus value) =>
      statusTopofWeek.value = value;
}
