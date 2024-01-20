import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/common/helper/themes.dart';
import 'package:govbill/common/routes/app_pages.dart';

void main() async {
  runApp(
    GetMaterialApp(
      title: "Application",
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: blackColor),
        ),
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // home: Navbar()
    ),
  );
}
