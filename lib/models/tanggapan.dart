class Tanggapan {
  int? id;
  int? idTanggapan;
  int? idPengaduan;
  String? tglTanggapan;
  String? tanggapan;
  int? idPetugas;
  String? createdAt;
  String? updatedAt;

  Tanggapan(
      {this.id,
      this.idTanggapan,
      this.idPengaduan,
      this.tglTanggapan,
      this.tanggapan,
      this.idPetugas,
      this.createdAt,
      this.updatedAt});

  Tanggapan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idTanggapan = json['id_tanggapan'];
    idPengaduan = json['id_pengaduan'];
    tglTanggapan = json['tgl_tanggapan'];
    tanggapan = json['tanggapan'];
    idPetugas = json['id_petugas'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_tanggapan'] = this.idTanggapan;
    data['id_pengaduan'] = this.idPengaduan;
    data['tgl_tanggapan'] = this.tglTanggapan;
    data['tanggapan'] = this.tanggapan;
    data['id_petugas'] = this.idPetugas;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
