import 'package:get/get.dart';
import 'package:govbill/app/pages/index.dart';

class TambahAlamatPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahAlamatPageController>(
          () => TambahAlamatPageController(),
    );
  }
}
