import 'package:get/get.dart';
import 'package:govbill/app/pages/tambah_kartu_page/tambah_kartu_controller.dart';

class TambahKartuPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahKartuPageController>(
          () => TambahKartuPageController(),
    );
  }
}