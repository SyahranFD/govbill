import 'package:get/get.dart';
import 'package:govbill/app/pages/history_page/history_page_controller.dart';

class HistoryPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryPageController>(
          () => HistoryPageController(),
    );
  }
}