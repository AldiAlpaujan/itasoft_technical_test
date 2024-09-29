import 'package:itasoft_technical_test/interface/iname.dart';

class Warehouse extends IName {
  final String userName;
  final String warehouseName;
  final String warehouseCode;

  String get initial => getInitialName(warehouseName);

  Warehouse({
    required this.userName,
    required this.warehouseName,
    required this.warehouseCode,
  });

  factory Warehouse.fromJson(Map<String, dynamic> json) {
    return Warehouse(
      userName: json['user_name'],
      warehouseName: json['nama_gudang'] ?? "Gudang ${json['user_name']}",
      warehouseCode: json['kode_gudang'],
    );
  }
}
