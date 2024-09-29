class Warehouse {
  final String userName;
  final String kodeGudang;

  Warehouse({
    required this.userName,
    required this.kodeGudang,
  });

  factory Warehouse.fromJson(Map<String, dynamic> json) {
    return Warehouse(
      userName: json['user_name'],
      kodeGudang: json['kode_gudang'],
    );
  }
}
