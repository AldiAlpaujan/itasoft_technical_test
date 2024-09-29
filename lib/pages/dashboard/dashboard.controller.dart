import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itasoft_technical_test/helper/function.dart';

class DashboardController extends GetxController {
  final _loading = false.obs;
  final scrollC = ScrollController();
  final searchC = TextEditingController();

  bool get loading => _loading.value;
  set loading(bool value) => _loading.value = value;

  _searchListener() {
    Func.searchListener(searchC.text, (v) async => print(v));
  }

  @override
  void onInit() {
    searchC.addListener(_searchListener);
    super.onInit();
  }
}
