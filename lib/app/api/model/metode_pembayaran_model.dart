// To parse this JSON data, do
//
//     final metodePembayaranModel = metodePembayaranModelFromJson(jsonString);

import 'dart:convert';

MetodePembayaranModel metodePembayaranModelFromJson(String str) => MetodePembayaranModel.fromJson(json.decode(str));

String metodePembayaranModelToJson(MetodePembayaranModel data) => json.encode(data.toJson());

class MetodePembayaranModel {
  int? id;
  int? idUser;
  String? jenis;
  String? nomor;
  String? nama;
  int? saldo;
  int? pembayaranUtama;

  MetodePembayaranModel({
    this.id,
    this.idUser,
    this.jenis,
    this.nomor,
    this.nama,
    this.saldo,
    this.pembayaranUtama,
  });

  factory MetodePembayaranModel.fromJson(Map<String, dynamic> json) => MetodePembayaranModel(
    id: json["id"],
    idUser: json["id_user"],
    jenis: json["jenis"],
    nomor: json["nomor"],
    nama: json["nama"],
    saldo: json["saldo"],
    pembayaranUtama: json["pembayaran_utama"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "id_user": idUser,
    "jenis": jenis,
    "nomor": nomor,
    "nama": nama,
    "saldo": saldo,
    "pembayaran_utama": pembayaranUtama,
  };
}
