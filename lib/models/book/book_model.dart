class BookModel {
  BookModel({
    required this.id,
    required this.kategori,
    required this.judul,
    required this.pengarang,
    required this.penerbit,
    required this.jumlahHalaman,
    required this.tahunTerbit,
    required this.edisiBuku,
    required this.isbn,
    required this.dibuatPada,
    required this.dibuatOleh,
    required this.gambar,
  });

  final int id;
  final String kategori;
  final String judul;
  final String pengarang;
  final String penerbit;
  final String jumlahHalaman;
  final String tahunTerbit;
  final String edisiBuku;
  final String isbn;
  final DateTime dibuatPada;
  final String dibuatOleh;
  final String? gambar;

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        id: json["id"],
        kategori: json["kategori"],
        judul: json["judul"],
        pengarang: json["pengarang"],
        penerbit: json["penerbit"],
        jumlahHalaman: json["jumlah_halaman"],
        tahunTerbit: json["tahun_terbit"],
        edisiBuku: json["edisi_buku"],
        isbn: json["isbn"],
        dibuatPada: DateTime.parse(json["dibuat_pada"]),
        dibuatOleh: json["dibuat_oleh"],
        gambar: json["Gambar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kategori": kategori,
        "judul": judul,
        "pengarang": pengarang,
        "penerbit": penerbit,
        "jumlah_halaman": jumlahHalaman,
        "tahun_terbit": tahunTerbit,
        "edisi_buku": edisiBuku,
        "isbn": isbn,
        "dibuat_pada": dibuatPada.toIso8601String(),
        "dibuat_oleh": dibuatOleh,
        "Gambar": gambar,
      };
}
