import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_history_controller.dart';

class HistoryPageController extends GetxController {
  final ApiHistoryController apiHistoryController = Get.put(ApiHistoryController());

  Future<void> refreshData() async {
    await apiHistoryController.fetchHistory();
  }
}