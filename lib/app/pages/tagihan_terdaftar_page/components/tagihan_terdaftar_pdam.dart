import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_tagihan_terdaftar_controller.dart';
import 'package:govbill/app/pages/index.dart';
import 'package:govbill/app/pages/tagihan_terdaftar_page/widgets/modal_text_input_widget.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/text_input_widget.dart';
import 'package:govbill/common/helper/themes.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class TagihanTerdaftarPDAM extends StatelessWidget {
  final ApiTagihanTerdaftarController apiTagihanTerdaftarController =
  Get.put(ApiTagihanTerdaftarController());
  final TagihanTerdaftarPageController tagihanTerdaftarPageController =
  Get.put(TagihanTerdaftarPageController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Obx(
          () => apiTagihanTerdaftarController.isLoading.value
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Container(
        width: double.infinity,
        margin: EdgeInsets.only(
            top: 15, left: width * 0.05, right: width * 0.05),
        child: SingleChildScrollView(
          child: ListView.builder(
            itemCount: apiTagihanTerdaftarController.listTagihanTerdaftarPDAM.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              var tagihan = apiTagihanTerdaftarController.listTagihanTerdaftarPDAM[index];
              var jenisTagihan = tagihan.jenisTagihan!;
              var tanggal = tagihan.tanggalBayar!;

              return Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: 5, bottom: 20, left: 15, right: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              //** Ubah ini
                              Text("No. Pelanggan : " + tagihan.noTagihan!,
                                  style: tsLabelRegularDarkBlue),
                              IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        backgroundColor: backgroundPageColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                        builder: (context) {
                                          return Container(
                                            padding: EdgeInsets.symmetric(vertical: 15),
                                            height: 200,
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  leading: Icon(Icons.edit_outlined, color: darkGrey),
                                                  title: Text("Edit Tagihan", style: tsBodySmallMediumDarkGrey),
                                                  onTap: () {
                                                    Get.back();
                                                    tagihanTerdaftarPageController.updateControllerValuesWithBulanBayar(index);
                                                    Get.toNamed('/edit-tagihan-terdaftar');
                                                  },
                                                ),
                                                ListTile(
                                                  leading: Icon(
                                                    Icons.delete_outline,
                                                    color: warningColor,
                                                  ),
                                                  title: Text("Hapus Tagihan", style: tsBodySmallMediumRed),
                                                  onTap: () {
                                                    apiTagihanTerdaftarController.deleteTagihanTerdaftar(tagihan.id.toString());
                                                    Get.back();
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                    );
                                  },
                                  icon: Icon(Icons.more_vert, color: secondaryColor, size: 24,))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  //** Ubah ini
                                  color: categoryPDAM,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x19000000),
                                      blurRadius: 10,
                                      offset: Offset(0, 0),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                width: width * 0.1,
                                height: width * 0.1,
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  "assets/icons/icKategori$jenisTagihan.svg",
                                  width: 24,
                                ),
                              ),
                              SizedBox(width: width * 0.04),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: width * 0.685,
                                      child: Text(tagihan.namaTagihan!,
                                          style: tsBodySmallSemiboldBlack)),
                                  SizedBox(height: 4),
                                  Container(
                                      width: width * 0.685,
                                      child: Text(
                                        //** Ubah ini
                                          "Terjadwal dibayar setiap tanggal $tanggal",
                                          style: tsLabelRegularBlack)),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
