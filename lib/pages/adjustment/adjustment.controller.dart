import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:itasoft_technical_test/data/product.data.dart';
import 'package:itasoft_technical_test/enum/sort_filter.enum.dart';
import 'package:itasoft_technical_test/helper/function.dart';
import 'package:itasoft_technical_test/model/product.adjustment.dart';
import 'package:itasoft_technical_test/model/product.dart';
import 'package:itasoft_technical_test/routes/app_pages.dart';

class AdjustmentController extends GetxController {
  var currentPage = 1;
  var pageSize = 20;

  final _loading = false.obs;
  final _lastPage = false.obs;
  final _showSearchClose = false.obs;
  final _sortFilter = SortFilter.unknow.obs;
  final scrollC = ScrollController();
  final searchC = TextEditingController();

  final _products = <ProductAdjustment>[].obs;

  List<ProductAdjustment> get products {
    // switch (sortFilter) {
    //   case SortFilter.asc:
    //     final tmp = [..._products()];
    //     return tmp..sort((a, b) => a.cExpired.compareTo(b.cExpired));
    //   case SortFilter.desc:
    //     final tmp = [..._products()];
    //     return tmp..sort((a, b) => b.cExpired.compareTo(a.cExpired));
    //   default:
    //     return _products();
    // }
    return _products();
  }

  set products(List<ProductAdjustment> value) => _products.value = value;

  bool get loading => _loading.value;
  set loading(bool value) => _loading.value = value;

  bool get lastPage => _lastPage.value;
  set lastPage(bool value) => _lastPage.value = value;

  bool get showSearchClose => _showSearchClose.value;
  set showSearchClose(bool value) => _showSearchClose.value = value;

  SortFilter get sortFilter => _sortFilter.value;
  set sortFilter(SortFilter value) => _sortFilter.value = value;

  getData({String keyword = '', bool isRefresh = true}) async {
    if (isRefresh) loading = true;
    final data = await ProductData.getProductAdjustments(
      search: keyword,
      page: currentPage,
      pageSize: pageSize,
    );
    lastPage = data.length < pageSize;
    if (isRefresh) {
      products = data;
    } else {
      products += data;
    }
    loading = false;
  }

  Future onRefresh() async {
    currentPage = 1;
    await getData(keyword: searchC.text);
  }

  Future onLoad() async {
    currentPage++;
    await getData(keyword: searchC.text, isRefresh: false);
  }

  changeSortFilter() {
    if (sortFilter == SortFilter.unknow) {
      sortFilter = SortFilter.asc;
    } else if (sortFilter == SortFilter.asc) {
      sortFilter = SortFilter.desc;
    } else if (sortFilter == SortFilter.desc) {
      sortFilter = SortFilter.unknow;
    }
  }

  productDetailPage(Product product) {
    Get.toNamed(Routes.productDetail, arguments: product.id);
  }

  _searchListener() {
    Func.searchListener(
      searchC.text,
      (v) async => getData(keyword: v),
    );
    showSearchClose = searchC.text != "";
  }

  @override
  void onInit() {
    searchC.addListener(_searchListener);
    getData();
    super.onInit();
  }
}
