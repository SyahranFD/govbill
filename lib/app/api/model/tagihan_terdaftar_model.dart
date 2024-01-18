// To parse this JSON data, do
//
//     final tagihanTerdaftarModel = tagihanTerdaftarModelFromJson(jsonString);

import 'dart:convert';

TagihanTerdaftarModel tagihanTerdaftarModelFromJson(String str) => TagihanTerdaftarModel.fromJson(json.decode(str));

String tagihanTerdaftarModelToJson(TagihanTerdaftarModel data) => json.encode(data.toJson());

class TagihanTerdaftarModel {
  int? id;
  int? idUser;
  String? noTagihan;
  String? jenisTagihan;
  String? namaTagihan;
  int? tanggalBayar;
  int? bulanBayar;

  TagihanTerdaftarModel({
    this.id,
    this.idUser,
    this.noTagihan,
    this.jenisTagihan,
    this.namaTagihan,
    this.tanggalBayar,
    this.bulanBayar,
  });

  factory TagihanTerdaftarModel.fromJson(Map<String, dynamic> json) => TagihanTerdaftarModel(
    id: json["id"],
    idUser: json["id_user"],
    noTagihan: json["no_tagihan"],
    jenisTagihan: json["jenis_tagihan"],
    namaTagihan: json["nama_tagihan"],
    tanggalBayar: json["tanggal_bayar"],
    bulanBayar: json["bulan_bayar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "id_user": idUser,
    "no_tagihan": noTagihan,
    "jenis_tagihan": jenisTagihan,
    "nama_tagihan": namaTagihan,
    "tanggal_bayar": tanggalBayar,
    "bulan_bayar": bulanBayar,
  };
}
