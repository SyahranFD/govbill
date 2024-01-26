import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_metode_pembayaran_controller.dart';
import 'package:govbill/app/pages/index.dart';
import 'package:govbill/common/helper/themes.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

Widget bottomSheetMetodePembayaran(
    {required BuildContext context, required id, required index}) {
  final ApiMetodePembayaranController apiMetodePembayaranController =
      Get.put(ApiMetodePembayaranController());

  return IconButton(
      onPressed: () {
        var data = apiMetodePembayaranController.listMetodePembayaran[index];
        showModalBottomSheet(
            context: context,
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
                    data.pembayaranUtama == 0
                        ? ListTile(
                            leading: Icon(Icons.edit_outlined,
                                color: secondaryColor),
                            title: Text("Ubah Menjadi Pembayaran Utama", style: tsBodySmallMediumDarkBlue),
                            onTap: () {
                              apiMetodePembayaranController.changePembayaranUtama(id);
                              PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: MetodePembayaranPageView(),
                                withNavBar: true,
                                pageTransitionAnimation: PageTransitionAnimation.fade,
                              );
                            },
                          )
                        : Container(),
                    ListTile(
                      leading: Icon(
                        Icons.delete_outline,
                        color: warningColor,
                      ),
                      title: Text("Hapus Metode Pembayaran", style: tsBodySmallMediumRed),
                      onTap: () {
                        apiMetodePembayaranController.deleteMetodePembayaran(id);
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: MetodePembayaranPageView(),
                          withNavBar: true, // OPTIONAL VALUE. True by default.
                        );
                      },
                    ),
                  ],
                ),
              );
            });
      },
      icon: Icon(
        Icons.more_vert,
        color: secondaryColor,
        size: 24,
      ));
}
