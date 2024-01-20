import 'package:get/get.dart';
import 'package:govbill/app/pages/edit_tagihan_terdaftar_page/edit_tagihan_binding.dart';
import 'package:govbill/app/pages/edit_tagihan_terdaftar_page/edit_tagihan_view.dart';
import 'package:govbill/app/pages/index.dart';
part 'app_routes.dart';

class AppPages {
  // static var routes;

  AppPages._();
  
  static const INITIAL = Routes.TAMBAH_PGN;

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
      name: _Paths.TAGIHAN_TERDAFTAR_PAGE,
      page: () => TagihanTerdaftarPageView(),
      binding: TagihanTerdaftarPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.EDIT_TAGIHAN_TERDAFTAR_PAGE,
      page: () => EditTagihanTerdaftarPageView(),
      binding: EditTagihanTerdaftarPageBinding(),
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
    GetPage(
        name: _Paths.TAMBAH_MOTOR_PAGE,
        page: () => TambahMotorPageView(),
        binding: TambahTagihanPageBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.TAMBAH_MOTOR_KONFIRMASI,
        page: () => TambahMotorKonfirmasiView(),
        binding: TambahTagihanPageBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.TAMBAH_MOBIL_PAGE,
        page: () => TambahMobilPageView(),
        binding: TambahTagihanPageBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.TAMBAH_MOBIL_KONFIRMASI,
        page: () => TambahMobilKonfirmasiView(),
        binding: TambahTagihanPageBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.TAMBAH_PLN,
        page: () => TambahPlnView(),
        binding: TambahTagihanPageBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.TAMBAH_PBB,
        page: () => TambahPbbView(),
        binding: TambahTagihanPageBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.TAMBAH_PDAM,
        page: () => TambahPdamView(),
        binding: TambahTagihanPageBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.TAMBAH_PGN,
        page: () => TambahPgnView(),
        binding: TambahTagihanPageBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.TAMBAH_BPJS,
        page: () => TambahBpjsView(),
        binding: TambahTagihanPageBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.ONBOARDING,
        page: () => OnboardingPageView(),
        binding: OnboardingPageBinding(),
        transition: Transition.noTransition),
  ];
}
