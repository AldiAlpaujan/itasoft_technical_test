import 'package:itasoft_technical_test/interface/iname.dart';

class ProductDetail extends IName {
  final String id;
  final String createdByName;
  final String image;
  final String safetyStok;
  final String gudang;
  final DateTime dateModified;
  final String kategori;
  final String stok;
  final String modifiedByName;
  final DateTime dateCreated;
  final DateTime expired;
  final String createdBy;
  final String modifiedBy;
  final String namaBarang;

  String get initial => getInitialName(namaBarang);

  ProductDetail({
    required this.id,
    required this.createdByName,
    required this.image,
    required this.safetyStok,
    required this.gudang,
    required this.dateModified,
    required this.kategori,
    required this.stok,
    required this.modifiedByName,
    required this.dateCreated,
    required this.expired,
    required this.createdBy,
    required this.modifiedBy,
    required this.namaBarang,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) {
    return ProductDetail(
      id: json['id'],
      createdByName: json['createdByName'],
      image: json['image'],
      safetyStok: json['safety_stok'],
      gudang: json['gudang'],
      dateModified: DateTime.parse(json['dateModified']),
      kategori: json['kategori'],
      stok: json['stok'],
      modifiedByName: json['modifiedByName'],
      dateCreated: DateTime.parse(json['dateCreated']),
      expired: DateTime.parse(json['expired']),
      createdBy: json['createdBy'],
      modifiedBy: json['modifiedBy'],
      namaBarang: json['nama_barang'],
    );
  }
}
