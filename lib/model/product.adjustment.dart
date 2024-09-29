class ProductAdjustment {
  final String expired;
  final String image;
  final String warehouse;
  final String category;
  final String name;
  final String stock;

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
      expired: json['exipred'],
      image: json['image'],
      warehouse: json['gudang'],
      category: json['kategori'],
      name: json['nama_barang'],
      stock: json['stok'],
    );
  }
}
