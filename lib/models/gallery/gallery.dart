class Gallery {
    Gallery({
        required this.foto,
        required this.judul,
        required this.tanggalKegiatan,
        required this.createdAt,
        required this.updatedAt,
    });

    final String foto;
    final String judul;
    final String tanggalKegiatan;
    final dynamic createdAt;
    final dynamic updatedAt;

    factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        foto: json["foto"],
        judul: json["judul"],
        tanggalKegiatan: json["tanggal_kegiatan"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "foto": foto,
        "judul": judul,
        "tanggal_kegiatan": tanggalKegiatan,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}