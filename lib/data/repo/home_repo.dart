import 'package:bazar/common/constans/constans.dart';
import 'package:bazar/data/api/api_client.dart';
import 'package:get/get.dart';

class HomeRepo {
  final ApiClient apiClient;
  HomeRepo(this.apiClient);

  Future<Response> getFlutterBooks() async {
    return await apiClient.getData(AppConstants.flutterBooks);
  }

  Future<Response> getSpecialOfferBooks() async {
    return await apiClient.getData(AppConstants.specialOfferBooks);
  }
}
