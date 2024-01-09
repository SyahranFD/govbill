import 'package:get/get.dart';
import 'package:govbill/app/pages/daftar_alamat_page/daftar_alamat_binding.dart';
import 'package:govbill/app/pages/daftar_alamat_page/daftar_alamat_view.dart';
import 'package:govbill/app/pages/detail_kategori_page/detail_kategori_binding.dart';
import 'package:govbill/app/pages/detail_kategori_page/detail_kategori_view.dart';
import 'package:govbill/app/pages/detail_kendaraan_page/component/detail_mobil/detail_mobil_view.dart';
import 'package:govbill/app/pages/detail_kendaraan_page/component/detail_motor/detail_motor_view.dart';
import 'package:govbill/app/pages/detail_kendaraan_page/detail_kendaraan_binding.dart';
import 'package:govbill/app/pages/history_page/history_page_binding.dart';
import 'package:govbill/app/pages/history_page/history_page_view.dart';
import 'package:govbill/app/pages/home_page/home_page_binding.dart';
import 'package:govbill/app/pages/home_page/home_page_view.dart';
import 'package:govbill/app/pages/login_page/login_page_binding.dart';
import 'package:govbill/app/pages/login_page/login_page_view.dart';
import 'package:govbill/app/pages/metode_pembayaran_page/metode_pembayaran_binding.dart';
import 'package:govbill/app/pages/metode_pembayaran_page/metode_pembayaran_view.dart';
import 'package:govbill/app/pages/pilih_tagihan_page/pilih_tagihan_binding.dart';
import 'package:govbill/app/pages/pilih_tagihan_page/pilih_tagihan_view.dart';
import 'package:govbill/app/pages/profile_page/profile_page_binding.dart';
import 'package:govbill/app/pages/profile_page/profile_page_view.dart';
import 'package:govbill/app/pages/register_page/register_page_binding.dart';
import 'package:govbill/app/pages/register_page/register_page_view.dart';
import 'package:govbill/app/pages/splash_screen_page/splash_screen_binding.dart';
import 'package:govbill/app/pages/splash_screen_page/splash_screen_view.dart';
import 'package:govbill/app/pages/tagihan_akan_datang_page/tagihan_akan_datang_binding.dart';
import 'package:govbill/app/pages/tagihan_akan_datang_page/tagihan_akan_datang_view.dart';
import 'package:govbill/app/pages/tambah_alamat_page/tambah_alamat_binding.dart';
import 'package:govbill/app/pages/tambah_alamat_page/tambah_alamat_view.dart';
import 'package:govbill/app/pages/tambah_kartu_page/tambah_kartu_binding.dart';
import 'package:govbill/app/pages/tambah_kartu_page/tambah_kartu_view.dart';
import 'package:govbill/app/pages/tambah_metode_pembayaran_page/tambah_metode_pembayaran_binding.dart';
import 'package:govbill/app/pages/tambah_metode_pembayaran_page/tambah_metode_pembayaran_view.dart';
part 'app_routes.dart';

class AppPages {
  // static var routes;

  AppPages._();
  static const INITIAL = Routes.REGISTER_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenPageView(),
      binding: SplashScreenPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.REGISTER_PAGE,
      page: () => RegisterPageView(),
      binding: RegisterPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => LoginPageView(),
      binding: LoginPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => HomePageView(),
      binding: HomePageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.TAGIHAN_AKAN_DATANG_PAGE,
      page: () => TagihanAkanDatangPageView(),
      binding: TagihanAkanDatangPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.DETAIL_KATEGORI_PAGE,
      page: () => DetailKategoriPageView(),
      binding: DetailKategoriPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.METODE_PEMBAYARAN_PAGE,
      page: () => MetodePembayaranPageView(),
      binding: MetodePembayaranPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.TAMBAH_METODE_PEMBAYARAN_PAGE,
      page: () => TambahMetodePembayaranPageView(),
      binding: TambahMetodePembayaranPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.TAMBAH_KARTU_PAGE,
      page: () => TambahKartuPageView(),
      binding: TambahKartuPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.PILIH_TAGIHAN_PAGE,
      page: () => PilihTagihanPageView(),
      binding: PilihTagihanPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.DAFTAR_ALAMAT_PAGE,
      page: () => DaftarAlamatPageView(),
      binding: DaftarAlamatPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.TAMBAH_ALAMAT_PAGE,
      page: () => TambahAlamatPageView(),
      binding: TambahAlamatPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.HISTORY_PAGE,
      page: () => HistoryPageView(),
      binding: HistoryPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.PROFILE_PAGE,
      page: () => ProfilePageView(),
      binding: ProfilePageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.DETAIL_MOTOR_PAGE,
      page: () => DetailMotorPageView(),
      binding: DetailKendaraanPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.DETAIL_MOBIL_PAGE,
      page: () => DetailMobilPageView(),
      binding: DetailKendaraanPageBinding(),
      transition: Transition.noTransition,
    ),
  ];
}
