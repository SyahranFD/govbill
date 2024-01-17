part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH_SCREEN = _Paths.SPLASH_SCREEN;
  static const REGISTER_PAGE = _Paths.REGISTER_PAGE;
  static const LOGIN_PAGE  = _Paths.LOGIN_PAGE;
  static const HOME_PAGE = _Paths.HOME_PAGE;
  static const TAGIHAN_AKAN_DATANG_PAGE = _Paths.TAGIHAN_AKAN_DATANG_PAGE;
  static const DETAIL_KATEGORI_PAGE = _Paths.DETAIL_KATEGORI_PAGE;
  static const METODE_PEMBAYARAN_PAGE = _Paths.METODE_PEMBAYARAN_PAGE;
  static const TAMBAH_METODE_PEMBAYARAN_PAGE = _Paths.TAMBAH_METODE_PEMBAYARAN_PAGE;
  static const TAMBAH_KARTU_PAGE = _Paths.TAMBAH_KARTU_PAGE;
  static const PILIH_TAGIHAN_PAGE = _Paths.PILIH_TAGIHAN_PAGE;
  static const TAMBAH_TAGIHAN_PAGE = _Paths.TAMBAH_TAGIHAN_PAGE;
  static const DAFTAR_ALAMAT_PAGE = _Paths.DAFTAR_ALAMAT_PAGE;
  static const TAMBAH_ALAMAT_PAGE = _Paths.TAMBAH_ALAMAT_PAGE;
  static const HISTORY_PAGE = _Paths.HISTORY_PAGE;
  static const PROFILE_PAGE = _Paths.PROFILE_PAGE;
  static const DETAIL_MOTOR_PAGE = _Paths.DETAIL_MOTOR_PAGE;
  static const DETAIL_MOBIL_PAGE = _Paths.DETAIL_MOBIL_PAGE;
  static const TAMBAH_MOTOR_PAGE = _Paths.TAMBAH_MOTOR_PAGE;
  static const TAMBAH_MOTOR_KONFIRMASI = _Paths.TAMBAH_MOTOR_KONFIRMASI;
  static const TAMBAH_MOBIL_PAGE = _Paths.TAMBAH_MOBIL_PAGE;
  static const TAMBAH_MOBIL_KONFIRMASI = _Paths.TAMBAH_MOBIL_KONFIRMASI;
  static const TAMBAH_PLN = _Paths.TAMBAH_PLN;
  static const TAMBAH_PBB = _Paths.TAMBAH_PBB;
  static const TAMBAH_PDAM = _Paths.TAMBAH_PDAM;
  static const TAMBAH_PGN = _Paths.TAMBAH_PGN;
  static const TAMBAH_BPJS = _Paths.TAMBAH_BPJS;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH_SCREEN = '/splashscreen';
  static const REGISTER_PAGE = '/register';
  static const LOGIN_PAGE = '/login';
  static const HOME_PAGE = '/';
  static const TAGIHAN_AKAN_DATANG_PAGE = '/tagihan-akan-datang';
  static const DETAIL_KATEGORI_PAGE = '/detail-kategori';
  static const METODE_PEMBAYARAN_PAGE = '/metode-pembayaran';
  static const TAMBAH_METODE_PEMBAYARAN_PAGE = '/tambah-metode-pembayaran';
  static const TAMBAH_KARTU_PAGE = '/tambah-kartu';
  static const PILIH_TAGIHAN_PAGE = '/pilih-tagihan';
  static const TAMBAH_TAGIHAN_PAGE = '/tambah-tagihan';
  static const DAFTAR_ALAMAT_PAGE = '/daftar-alamat';
  static const TAMBAH_ALAMAT_PAGE = '/tambah-alamat';
  static const HISTORY_PAGE = '/history';
  static const PROFILE_PAGE = '/profile';
  static const DETAIL_MOTOR_PAGE = '/detail-motor';
  static const DETAIL_MOBIL_PAGE = '/detail-mobil';
  static const TAMBAH_MOTOR_PAGE = '/tambah-motor';
  static const TAMBAH_MOTOR_KONFIRMASI = "/tambah-motor-konfirmasi";
  static const TAMBAH_MOBIL_PAGE = '/tambah-mobil';
  static const TAMBAH_MOBIL_KONFIRMASI = "/tambah-mobil-konfirmasi";
  static const TAMBAH_PLN = "/tambah-pln";
  static const TAMBAH_PBB = "/tambah-pbb";
  static const TAMBAH_PDAM = "/tambah-pdam";
  static const TAMBAH_PGN = "/tambah-pgn";
  static const TAMBAH_BPJS = "/tambah-bpjs";
}
