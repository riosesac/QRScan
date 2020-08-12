class ProdukModel {
  String nama;
  String code;
  String link;
  String qrcode;

  ProdukModel({
    this.nama,
    this.code,
    this.link,
    this.qrcode,
  });

  factory ProdukModel.fromJson(Map<String, dynamic> json) => ProdukModel(
        nama: json['nama'],
        code: json['code'],
        link: json['link'],
        qrcode: json['qrcode'],
      );
}
