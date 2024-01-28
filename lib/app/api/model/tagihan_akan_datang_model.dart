// To parse this JSON data, do
//
//     final tagihanAkanDatangModel = tagihanAkanDatangModelFromJson(jsonString);

import 'dart:convert';

TagihanAkanDatangModel tagihanAkanDatangModelFromJson(String str) => TagihanAkanDatangModel.fromJson(json.decode(str));

String tagihanAkanDatangModelToJson(TagihanAkanDatangModel data) => json.encode(data.toJson());

class TagihanAkanDatangModel {
  int? id;
  int? idUser;
  int? idTagihanTerdaftar;
  String? jenisTagihan;
  String? noTagihan;
  String? namaTagihan;
  int? nominalTagihan;
  DateTime? waktuBayar;
  String? status;

  TagihanAkanDatangModel({
    this.id,
    this.idUser,
    this.idTagihanTerdaftar,
    this.jenisTagihan,
    this.noTagihan,
    this.namaTagihan,
    this.nominalTagihan,
    this.waktuBayar,
    this.status,
  });

  factory TagihanAkanDatangModel.fromJson(Map<String, dynamic> json) => TagihanAkanDatangModel(
    id: json["id"],
    idUser: json["id_user"],
    idTagihanTerdaftar: json["id_tagihan_terdaftar"],
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
    "id_tagihan_terdaftar": idTagihanTerdaftar,
    "jenis_tagihan": jenisTagihan,
    "no_tagihan": noTagihan,
    "nama_tagihan": namaTagihan,
    "nominal_tagihan": nominalTagihan,
    "waktu_bayar": "${waktuBayar!.year.toString().padLeft(4, '0')}-${waktuBayar!.month.toString().padLeft(2, '0')}-${waktuBayar!.day.toString().padLeft(2, '0')}",
    "status": status,
  };
}
