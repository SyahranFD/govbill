import 'package:flutter/material.dart';
import 'package:govbill/common/helper/themes.dart';

String defineNamaNoTagihan(String jenisTagihan) {
  String namaNoTagihan = '';
  switch (jenisTagihan) {
    case 'PBB':
      namaNoTagihan = 'NOP';
      break;
    case 'PLN':
      namaNoTagihan = 'ID Pelanggan';
      break;
    case 'PGN':
      namaNoTagihan = 'ID Pelanggan';
      break;
    case 'BPJS':
      namaNoTagihan = 'No. VA';
      break;
    case 'PDAM':
      namaNoTagihan = 'No. Pelanggan';
      break;
    default:
      namaNoTagihan = '';
  }
  return namaNoTagihan;
}

Color defineColorTagihan(String jenisTagihan) {
  Color? colorTagihan;
  switch (jenisTagihan) {
    case 'PBB':
      colorTagihan = categoryPBB;
      break;
    case 'PLN':
      colorTagihan = categoryPLN;
      break;
    case 'PGN':
      colorTagihan = categoryPGN;
      break;
    case 'BPJS':
      colorTagihan = categoryBPJS;
      break;
    case 'PDAM':
      colorTagihan = categoryPDAM;
      break;
    default:
      colorTagihan = Colors.white;
  }
  return colorTagihan;
}

bool isStatusGagal(String status) {
  return status == 'Gagal';
}