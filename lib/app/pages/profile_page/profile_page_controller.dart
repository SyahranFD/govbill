import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_profile_controller.dart';

class ProfilePageController extends GetxController {
  final ApiProfileController apiProfileController = Get.put(ApiProfileController());

  Future<void> refreshData() async {
    await apiProfileController.fetchProfile();
  }
}