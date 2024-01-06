import 'package:get/get.dart';
import 'package:govbill/app/pages/detail_kategori_page/detail_kategori_controller.dart';

class DetailKategoriPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailKategoriPageController>(
          () => DetailKategoriPageController(),
    );
  }
}