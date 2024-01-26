import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_history_controller.dart';
import 'package:govbill/app/api/controller/api_tagihan_akan_datang_controller.dart';
import 'package:govbill/app/api/model/tagihan_akan_datang_model.dart';
import 'package:intl/intl.dart';

class HomePageController extends GetxController {
  final ApiTagihanAkanDatangController apiTagihanAkanDatangController =
      Get.put(ApiTagihanAkanDatangController());
  final ApiHistoryController apiHistoryController =
      Get.put(ApiHistoryController());

  RxString totalNominal = "".obs;

  void calculateTotalNominalTagihan() {
    List<TagihanAkanDatangModel> tagihanList =
        apiTagihanAkanDatangController.listTagihanAkanDatang.value;

    int total = 0;
    for (var tagihan in tagihanList) {
      total += tagihan.nominalTagihan!;
    }

    var totalNominalFormatted =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(total);
    totalNominalFormatted = totalNominalFormatted.replaceAll(",00", "");

    totalNominal.value = totalNominalFormatted;

    print('Total Nominal Tagihan: $total');
  }

  Future<void> refreshData() async {
    apiHistoryController.fetchHistory();
    apiTagihanAkanDatangController.listTagihanAkanDatang.forEach((tagihan) {
      print(tagihan.toJson()); // Assuming toJson() provides a meaningful representation
    });
    await apiTagihanAkanDatangController.fetchTagihanAkanDatang();
  }
}
