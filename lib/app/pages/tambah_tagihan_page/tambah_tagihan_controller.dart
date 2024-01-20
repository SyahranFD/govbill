import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_tambah_tagihan_controller.dart';

class TambahTagihanPageController extends GetxController {
  // TextEditingController? ctrNoTagihan = TextEditingController();
  // TextEditingController? ctrNamaTagihan = TextEditingController();
  // TextEditingController? ctrTanggalBayar = TextEditingController();
  // TextEditingController? ctrBulanBayar = TextEditingController();
  // TextEditingController? ctrKotaKabupaten = TextEditingController();

  var isLoading = false.obs;
  final kabupatenData = [
    "Semarang",
    "Surakarta",
    "Magelang",
    "Salatiga",
    "Pekalongan",
    "Tegal",
    "Kudus",
    "Demak",
    "Purwokerto",
    "Cilacap",
    "Rembang",
    "Blora",
    "Pemalang",
    "Kebumen",
    "Purworejo",
    "Wonosobo",
    "Banjarnegara",
    "Brebes",
    "Jepara",
    "Pati",
    "Kendal",
    "Temanggung",
    "Karanganyar",
    "Sragen",
    "Wonogiri",
    "Klaten",
    "Boyolali",
    "Magelang",
    "Purwodadi",
    "Blora"
  ];
  // Daftar PBB
  var namaPBB = "".obs;
  var kotaKabupatenPBB = "".obs;
  var noNOPPBB = "".obs;
  var tanggalPBB = 0.obs;
  var bulanPBB = "".obs;
  void postTagihanPBB() async {
    await ApiTambahTagihanController.postTagihanPBB(
      namaTagihan: namaPBB.value,
      kotaKabupaten: kotaKabupatenPBB.value,
      noTagihan: noNOPPBB.value,
      tanggalBayar: tanggalPBB.value.toString(),
      bulanBayar: bulanPBB.value,
    ).then((value) => isLoading.value = !isLoading.value);
  }

  // Daftar PDAM
  var namaPDAM = "".obs;
  var kotaKabupatenPDAM = "".obs;
  var noPelangganPDAM = "".obs;
  var tanggalPDAM = 0.obs;

  // Daftar PLN
  var namaPLN = "".obs;
  var kotaKabupatenPLN = "".obs;
  var noMeterPLN = "".obs;
  var tanggalPLN = 0.obs;
            
  // Daftar PGN
  var namaPGN = "".obs;
  var idPelangganPGN = "".obs;
  var tanggalPGN = 0.obs;

}