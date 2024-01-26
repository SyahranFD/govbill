import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_tagihan_akan_datang_controller.dart';
import 'package:govbill/common/helper/themes.dart';

class BerhasilTerdaftarPageView extends StatelessWidget {
  final ApiTagihanAkanDatangController apiTagihanAkanDatangController =
      Get.put(ApiTagihanAkanDatangController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        width: double.infinity,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: lunasColor,
              ),
              child: Center(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 64,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Tagihan Anda Berhasil Terdaftar",
                style: tsBodyLargeSemiboldBlack),
            SizedBox(height: 5),
            Container(
              width: width * 0.75,
              child: Text("Pastikan selalu saldo anda mencukupi sebelum waktu pembayaran",
                  textAlign: TextAlign.center,
                  style: tsBodySmallRegularBlack),
            ),
          ],
        ),
      ),
      floatingActionButton: Obx(
        () {
          return apiTagihanAkanDatangController.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 30,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        apiTagihanAkanDatangController.postTagihanAkanDatang();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: secondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        'Kembali ke Halaman Utama',
                        style: tsBodySmallSemiboldWhite,
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
