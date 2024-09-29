import 'package:itasoft_technical_test/model/warehouse.dart';

class User {
  final bool isAdmin;
  final String username;
  final String token;
  List<Warehouse>? warehouses;

  Warehouse get warehouse => warehouses![0];

  User({
    required this.isAdmin,
    required this.username,
    required this.token,
    required this.warehouses,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      isAdmin: json['isAdmin'],
      username: json['username'],
      token: json['token'],
      warehouses: null,
    );
  }
}
