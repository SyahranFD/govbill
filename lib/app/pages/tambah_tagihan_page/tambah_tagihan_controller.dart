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
    print(kotaKabupatenPBB.value.toString());
    await ApiTambahTagihanController.postTagihanPBB(
      namaTagihan: namaPBB.value,
      kotaKabupaten: kotaKabupatenPBB.value.toString(),
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
  void postTagihanPDAM() async {
    await ApiTambahTagihanController.postTagihanPDAM(
      namaTagihan: namaPDAM.value,
      kotaKabupaten: kotaKabupatenPDAM.value,
      noTagihan: noPelangganPDAM.value,
      tanggalBayar: tanggalPDAM.value.toString(),
    ).then((value) => isLoading.value = !isLoading.value);
  }

  // Daftar PLN
  var namaPLN = "".obs;
  var kotaKabupatenPLN = "".obs;
  var idPelangganPLN = "".obs;
  var tanggalPLN = 0.obs;
  void postTagihanPLN() async {
    await ApiTambahTagihanController.postTagihanPLN(
      namaTagihan: namaPLN.value,
      noTagihan: idPelangganPLN.value,
      tanggalBayar: tanggalPLN.value.toString(),
    ).then((value) => isLoading.value = !isLoading.value);
  }

  // Daftar PGN
  var namaPGN = "".obs;
  var idPelangganPGN = "".obs;
  var tanggalPGN = 0.obs;
  void postTagihanPGN() async {
    await ApiTambahTagihanController.postTagihanPGN(
      namaTagihan: namaPGN.value,
      noTagihan: idPelangganPGN.value,
      tanggalBayar: tanggalPGN.value.toString(),
    ).then((value) => isLoading.value = !isLoading.value);
  }

  // Daftar BPJS
  var namaBPJS = "".obs;
  var noVABPJS = "".obs;
  var tanggalBPJS = 0.obs;
  void postTagihanBPJS() async {
    await ApiTambahTagihanController.postTagihanBPJS(
      namaTagihan: namaBPJS.value,
      noTagihan: noVABPJS.value,
      tanggalBayar: tanggalBPJS.value.toString(),
    ).then((value) => isLoading.value = !isLoading.value);
  }

}