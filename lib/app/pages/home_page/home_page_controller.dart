import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_history_controller.dart';
import 'package:govbill/app/api/controller/api_tagihan_akan_datang_controller.dart';
import 'package:govbill/app/api/model/history_model.dart';
import 'package:govbill/app/api/model/tagihan_akan_datang_model.dart';
import 'package:intl/intl.dart';

class HomePageController extends GetxController {
  final ApiTagihanAkanDatangController apiTagihanAkanDatangController =
      Get.put(ApiTagihanAkanDatangController());

  RxString totalNominal = "".obs;
  var isLoading = false.obs;

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
    // apiHistoryController.fetchHistory();
    // await apiTagihanAkanDatangController.fetchTagihanAkanDatang();
  }

  RxList<HistoryModel> listHistory = <HistoryModel>[].obs;
  void fetchHistory () async {
    isLoading.value = true;
    await ApiHistoryController.fetchHistory().then((value) {
          List<dynamic> data = value;
      listHistory.value = data.map((e) => HistoryModel.fromJson(e)).toList();
    });
    isLoading.value = false;
  }

   String currencyFormat({required int nominal}) {
    var nominalTagihanFormatted = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(nominal).replaceAll(",00", "");
    return nominalTagihanFormatted;
  }

  String dateFormat({DateTime? date}) {
    var paymentDateFormatted =
        date != null ? DateFormat('dd MMMM yyyy', 'id_ID').format(date) : 'N/A';
    return paymentDateFormatted;
  }

  @override
  void onInit() {
    fetchHistory();
    super.onInit();
  }
}
