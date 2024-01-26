class AlamatData {
  int? id;
  String? idUser;
  String? namaPenerima;
  String? noHp;
  String? labelAlamat;
  String? alamatLengkap;
  String? catatan;
  String? createdAt;
  String? updatedAt;

  AlamatData(
      {this.id,
      this.idUser,
      this.namaPenerima,
      this.noHp,
      this.labelAlamat,
      this.alamatLengkap,
      this.catatan,
      this.createdAt,
      this.updatedAt});

  AlamatData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUser = json['id_user'];
    namaPenerima = json['nama_penerima'];
    noHp = json['no_hp'];
    labelAlamat = json['label_alamat'];
    alamatLengkap = json['alamat_lengkap'];
    catatan = json['catatan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_user'] = this.idUser;
    data['nama_penerima'] = this.namaPenerima;
    data['no_hp'] = this.noHp;
    data['label_alamat'] = this.labelAlamat;
    data['alamat_lengkap'] = this.alamatLengkap;
    data['catatan'] = this.catatan;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
