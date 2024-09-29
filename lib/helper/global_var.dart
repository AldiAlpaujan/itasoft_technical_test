import 'package:get/get.dart';
import 'package:itasoft_technical_test/model/user.dart';

final _user = Rx<User?>(null);

User? get user => _user.value;
set user(User? value) => _user.value = value;
