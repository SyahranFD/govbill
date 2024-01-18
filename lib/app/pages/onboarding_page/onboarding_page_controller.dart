import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPageController extends GetxController {
  final PageController pageController = PageController();

   final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/onboarding1.png',
      'title': 'Semua Jadi Satu',
      'description':
          'Membayar semua pajak dari mulai Kendaraan, rumah, penghasilkan cukup dengan satu klik! tidak ada lagi kelupaan untuk membayar pajak     ',
    },
    {
      'image': 'assets/images/onboarding2.png',
      'title': 'Gaperlu Ribet',
      'description':
          'Cukup 1 aplikasi kamu juga bisa membayar tagihan Listrik, PDAM, dan lain sebagainya dengan sangat mudah ',
    },
    {
      'image': 'assets/images/onboarding3.png',
      'title': 'Banyak Pilihan',
      'description':
          'Kamu bisa membayar semuanya dengan berbagai macam pilihan metode pembarayan yang tentunya aman',
    },
   ];

   var currentPage = 0.obs;
}