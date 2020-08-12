class ListModel {
  String nama;

  ListModel({
    this.nama,
  });

  factory ListModel.fromJson(Map<String, dynamic> json) {
    return ListModel(
      nama: json['nama'],
    );
  }
}
