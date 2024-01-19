// To parse this JSON data, do
//
//     final historyModel = historyModelFromJson(jsonString);

import 'dart:convert';

HistoryModel historyModelFromJson(String str) => HistoryModel.fromJson(json.decode(str));

String historyModelToJson(HistoryModel data) => json.encode(data.toJson());

class HistoryModel {
  int? id;
  int? idUser;
  int? idTagihanTersedia;
  int? idMetodePembayaran;
  String? noPembayaran;
  String? jenisTagihan;
  String? noTagihan;
  String? namaTagihan;
  int? nominalTagihan;
  DateTime? waktuBayar;
  String? status;

  HistoryModel({
    this.id,
    this.idUser,
    this.idTagihanTersedia,
    this.idMetodePembayaran,
    this.noPembayaran,
    this.jenisTagihan,
    this.noTagihan,
    this.namaTagihan,
    this.nominalTagihan,
    this.waktuBayar,
    this.status,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
    id: json["id"],
    idUser: json["id_user"],
    idTagihanTersedia: json["id_tagihan_tersedia"],
    idMetodePembayaran: json["id_metode_pembayaran"],
    noPembayaran: json["no_pembayaran"],
    jenisTagihan: json["jenis_tagihan"],
    noTagihan: json["no_tagihan"],
    namaTagihan: json["nama_tagihan"],
    nominalTagihan: json["nominal_tagihan"],
    waktuBayar: DateTime.parse(json["waktu_bayar"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "id_user": idUser,
    "id_tagihan_tersedia": idTagihanTersedia,
    "id_metode_pembayaran": idMetodePembayaran,
    "no_pembayaran": noPembayaran,
    "jenis_tagihan": jenisTagihan,
    "no_tagihan": noTagihan,
    "nama_tagihan": namaTagihan,
    "nominal_tagihan": nominalTagihan,
    "waktu_bayar": "${waktuBayar!.year.toString().padLeft(4, '0')}-${waktuBayar!.month.toString().padLeft(2, '0')}-${waktuBayar!.day.toString().padLeft(2, '0')}",
    "status": status,
  };
}
