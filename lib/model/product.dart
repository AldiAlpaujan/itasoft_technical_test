import 'package:itasoft_technical_test/interface/iname.dart';

class Product extends IName {
  String id;
  String cNamaBarang;
  String cImage;
  DateTime cExpired;
  String cGudang;
  String cStok;
  String cKategori;

  String get initial => getInitialName(cNamaBarang);

  Product({
    required this.id,
    required this.cNamaBarang,
    required this.cImage,
    required this.cExpired,
    required this.cGudang,
    required this.cStok,
    required this.cKategori,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      cNamaBarang: json['c_nama_barang'],
      cImage: json['c_image'],
      cExpired: DateTime.parse(json['c_expired']),
      cGudang: json['c_gudang'],
      cStok: json['c_stok'],
      cKategori: json['c_kategori'],
    );
  }
}
