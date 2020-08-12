class ListModel {
  String nama;

  ListModel({
    this.nama,
  });

  factory ListModel.fromJson(Map<String, dynamic> json) => ListModel(
        nama: json['nama'],
      );
}
