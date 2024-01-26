import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:govbill/app/api/constant/url.dart';
import 'package:govbill/app/api/controller/api_tambah_tagihan_controller.dart';
import 'package:govbill/app/api/model/alamat_model.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/alamat_button_widget.dart';
import 'package:govbill/common/helper/themes.dart';
import 'package:govbill/common/routes/app_pages.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class TambahTagihanPageController extends GetxController {

  static void snackbar(
      {required String title,
      required String message,
      required Color backgroundColor}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: backgroundColor,
      colorText: Colors.white,
    );
  }

  // Bulan Converter
  int monthNumber(String month) {
    DateFormat format = DateFormat.MMMM('id');
    DateTime dateTime = format.parse(month);
    return dateTime.month;
  }
  var isLoading = false.obs;
  final bulanDropdownPbb = [
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
  ];
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
    isLoading.value = true;
    await ApiTambahTagihanController.postTagihanPBB(
      namaTagihan: namaPBB.value,
      kotaKabupaten: kotaKabupatenPBB.value.toString(),
      noTagihan: noNOPPBB.value,
      tanggalBayar: tanggalPBB.value.toString(),
      bulanBayar: monthNumber(bulanPBB.value).toString(),
    ).then((value) {
      if (value == "success") {
        snackbar(
            title: "Success",
            message: "Berhasil Menambahkan Tagihan PBB",
            backgroundColor: lunasColor);
        isLoading.value = false;
        Get.toNamed(Routes.HOME_PAGE);
      } else if (value == "Unauthenticated") {
        snackbar(
            title: "Error",
            message: "Maaf Sesi Login Anda SUdah Habis, Silahkan Login Kembali",
            backgroundColor: warningColor);
        isLoading.value = false;
        Get.toNamed(Routes.LOGIN_PAGE);
      } else if (value == "ID Pelanggan Tidak Ditemukan") {
        snackbar(
            title: "Terjadi Kesalahan",
            message: "Data Yang Anda Input Salah",
            backgroundColor: warningColor);
        isLoading.value = false;
      }
    });
  }

  // Daftar PDAM
  var namaPDAM = "".obs;
  var kotaKabupatenPDAM = "".obs;
  var noPelangganPDAM = "".obs;
  var tanggalPDAM = 0.obs;
  void postTagihanPDAM() async {
    isLoading.value = true;
    await ApiTambahTagihanController.postTagihanPDAM(
      namaTagihan: namaPDAM.value,
      kotaKabupaten: kotaKabupatenPDAM.value,
      noTagihan: noPelangganPDAM.value,
      tanggalBayar: tanggalPDAM.value.toString(),
    ).then((value) {
      if (value == "success") {
        snackbar(
            title: "Success",
            message: "Berhasil Menambahkan Tagihan PDAM",
            backgroundColor: lunasColor);
        isLoading.value = false;
        Get.toNamed(Routes.HOME_PAGE);
      } else if (value == "Unauthenticated") {
        snackbar(
            title: "Error",
            message: "Maaf Sesi Login Anda SUdah Habis, Silahkan Login Kembali",
            backgroundColor: warningColor);
        isLoading.value = false;
        Get.toNamed(Routes.LOGIN_PAGE);
      } else if (value == "ID Pelanggan Tidak Ditemukan") {
        snackbar(
            title: "Terjadi Kesalahan",
            message: "Data Yang Anda Input Salah",
            backgroundColor: warningColor);
        isLoading.value = false;
      }
    });


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
    ).then((value) {
      if (value == "success") {
        snackbar(
            title: "Success",
            message: "Berhasil Menambahkan Tagihan PLN",
            backgroundColor: lunasColor);
        isLoading.value = false;
        Get.toNamed(Routes.HOME_PAGE);
      } else if (value == "Unauthenticated") {
        snackbar(
            title: "Error",
            message: "Maaf Sesi Login Anda SUdah Habis, Silahkan Login Kembali",
            backgroundColor: warningColor);
        isLoading.value = false;
        Get.toNamed(Routes.LOGIN_PAGE);
      } else if (value == "ID Pelanggan Tidak Ditemukan") {
        snackbar(
            title: "Terjadi Kesalahan",
            message: "Data Yang Anda Input Salah",
            backgroundColor: warningColor);
        isLoading.value = false;
      }
    });
  }

  // Daftar PGN
  var namaPGN = "".obs;
  var idPelangganPGN = "".obs;
  var tanggalPGN = 0.obs;
  void postTagihanPGN() async {
    isLoading.value = true;
    await ApiTambahTagihanController.postTagihanPGN(
      namaTagihan: namaPGN.value,
      noTagihan: idPelangganPGN.value,
      tanggalBayar: tanggalPGN.value.toString(),
    ).then((value) {
      print(value);
      if (value == "success") {
        snackbar(
            title: "Success",
            message: "Berhasil Menambahkan Tagihan PGN",
            backgroundColor: lunasColor);
        isLoading.value = false;
        Get.offAllNamed(Routes.HOME_PAGE);
      } else if (value == "Unauthenticated") {
        snackbar(
            title: "Error",
            message: "Sesi Login Kamu Sudah Berakhir, Silahkan Login Kembali",
            backgroundColor: warningColor);
        isLoading.value = false;
        Get.offAllNamed(Routes.LOGIN_PAGE);
      } else if (value == "ID Pelanggan Tidak Ditemukan") {
        snackbar(
            title: "Terjadi Kesalahan",
            message: "Data Yang Anda Input Salah",
            backgroundColor: warningColor);
        isLoading.value = false;
      }
    });
   
  }

  // Daftar BPJS
  var namaBPJS = "".obs;
  var noVABPJS = "".obs;
  var tanggalBPJS = 0.obs;
  void postTagihanBPJS() async {
    isLoading.value = true;
    await ApiTambahTagihanController.postTagihanBPJS(
      namaTagihan: namaBPJS.value,
      noTagihan: noVABPJS.value,
      tanggalBayar: tanggalBPJS.value.toString(),
    ).then((value) {
      if (value == "success") {
        snackbar(
            title: "Success",
            message: "Berhasil Menambahkan Tagihan BPJS",
            backgroundColor: lunasColor);
        isLoading.value = false;
        Get.offAllNamed(Routes.HOME_PAGE);
      } else if (value == "Unauthenticated") {
        snackbar(
            title: "Error",
            message: "Sesi Login Kamu Sudah Berakhir, Silahkan Login Kembali",
            backgroundColor: warningColor);
        isLoading.value = false;
        Get.offAllNamed(Routes.LOGIN_PAGE);
      } else if (value == "ID Pelanggan Tidak Ditemukan") {
        snackbar(
            title: "Terjadi Kesalahan",
            message: "Data Yang Anda Input Salah",
            backgroundColor: warningColor);
        isLoading.value = false;
      }
    });
  }

  // Daftar Motor
  var tanggalDaftarMotor = 0.obs;
  var bulanDaftarMotor = "".obs;
  var namaTagihanMotor = "".obs;
  var alamatId = "1".obs;

  void postTagihanMotor() async {
    isLoading.value = true;
    ApiTambahTagihanController.postTagihanMotor(
            namaTagihan: namaTagihanMotor.value,
            tanggalBayar: tanggalDaftarMotor.value.toString(),
            bulanBayar: monthNumber(bulanDaftarMotor.value).toString(),
            nik: nik.value,
            nrkb: nrkb.value,
            jenisTagihan: "motor")
        .then((value) {
      if (value == "success") {
        snackbar(
            title: "Success",
            message: "Berhasil Menambahkan Tagihan Motor",
            backgroundColor: lunasColor);
        isLoading.value = false;
        Get.offAllNamed(Routes.HOME_PAGE);
      } else {
        snackbar(
            title: "Terjadi Kesalahan",
            message: "Cek Kembali Koneksi Anda",
            backgroundColor: warningColor);
      }
      ;
      isLoading.value = false;
    });
  }

  // Cek Alamat Kendaraan
  Rx<Widget?> selectedAlamat = Rx<Widget?>(null);
  void getDataAlamat() async {
    await Get.toNamed(Routes.DAFTAR_ALAMAT_PAGE)?.then((value) {
      alamatId.value = value!.toString();
      fetchAlamat();
    });
  }

  void fetchAlamat() async {
    final box = GetStorage();
    print(box.read("token"));
    var response = await http.get(
      Uri.parse("${url}/alamat/show/${alamatId.value}"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}',
      },
    );

    Map<String, dynamic>? jsonData = json.decode(response.body)["data"];
    print(jsonData);
    if (jsonData != null) {
      AlamatData alamat = AlamatData.fromJson(jsonData);
      selectedAlamat.value = AlamatButtonWidget(
        onTap: () async {
          getDataAlamat();
        },
        title: "${alamat.labelAlamat} - ${alamat.namaPenerima}",
        description: "${alamat.alamatLengkap}",
        catatan: "${alamat.catatan}",
      );
    } else if (jsonData == null) {
      selectedAlamat.value = Center(
        child: Row(
          children: [
            Text(
              "Anda Belum Menambahkan Alamat",
              style: tsBodySmallMediumBlack,
            ),
            SizedBox(
              width: 5,
            ),
            // TextButton(
            //     onPressed: () {
            //       Get.toNamed(Routes.DAFTAR_ALAMAT_PAGE);
            //     },
            //     child:
            //         Text("Tambah Alamat", style: tsBodySmallSemiboldBlueGrey))
          ],
        ),
      );
    }
  }

  // Check Kendaraan
  var nik = "".obs;
  var nrkb = "".obs;
  void checkNik(String pengenal) async {
    isLoading.value = true;
    await ApiTambahTagihanController.checkNik(nik: nik.value, nrkb: nrkb.value)
        .then((value) {
      if (value == "success") {
        isLoading.value = false;
        if (pengenal == "motor") {
          Get.toNamed(Routes.TAMBAH_MOTOR_KONFIRMASI);
        } else if (pengenal == "mobil") {
          Get.toNamed(Routes.TAMBAH_MOBIL_KONFIRMASI);
        }
      } else if (value == "NIK Tidak Ditemukan") {
        isLoading.value = false;
        snackbar(
            title: "Terjadi Kesalahan",
            message: "NIK Yang Anda Input Tidak Ada",
            backgroundColor: warningColor);
      } else if (value == "Unauthenticated") {
        isLoading.value = false;
        snackbar(
            title: "Error",
            message: "Sesi Login Kamu Sudah Berakhir, Silahkan Login Kembali",
            backgroundColor: warningColor);
        Get.offAllNamed(Routes.LOGIN_PAGE);
      } else if (value == "NRKB Tidak Ditemukan") {
        isLoading.value = false;
        snackbar(
            title: "Terjadi Kesalahan",
            message: "NRKB Yang Anda Input Tidak Ada",
            backgroundColor: warningColor);
      } else {
        isLoading.value = false;
        snackbar(
            title: "Terjadi Kesalahan",
            message: "Cek Kembali Koneksi Anda",
            backgroundColor: warningColor);
      }
    });
  }

  @override
  void onInit() {
    fetchAlamat();
    super.onInit();
  }
}