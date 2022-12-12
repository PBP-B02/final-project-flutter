class Artikel {
  String judul;
  String tanggal;
  String konten;

  Artikel({
    required this.judul,
    required this.tanggal,
    required this.konten,
  });

  factory Artikel.fromJson(Map<String, dynamic> data) => Artikel(
        judul: data["fields"]["judul"],
        tanggal: data["fields"]["tanggal"],
        konten: data["fields"]["konten"],
      );

  Map<String, dynamic> toJson() => {"judul": judul};
}
