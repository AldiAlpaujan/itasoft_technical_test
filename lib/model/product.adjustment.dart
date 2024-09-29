import 'package:itasoft_technical_test/interface/iname.dart';

class ProductAdjustment extends IName {
  final DateTime? expired;
  final String image;
  final String warehouse;
  final String category;
  final String name;
  final String stock;

  String get initial => getInitialName(name);

  ProductAdjustment({
    required this.expired,
    required this.image,
    required this.warehouse,
    required this.category,
    required this.name,
    required this.stock,
  });

  factory ProductAdjustment.fromJson(Map<String, dynamic> json) {
    return ProductAdjustment(
      expired: DateTime.tryParse(json['exipred']),
      image: json['image'],
      warehouse: json['gudang'],
      category: json['kategori'],
      name: json['nama_barang'],
      stock: json['stok'],
    );
  }
}
