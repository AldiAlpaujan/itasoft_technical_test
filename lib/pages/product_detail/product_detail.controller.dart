import 'package:get/get.dart';
import 'package:itasoft_technical_test/data/product.data.dart';
import 'package:itasoft_technical_test/helper/dialog.dart';
import 'package:itasoft_technical_test/model/product.detail.dart';

class ProductDetailController extends GetxController {
  final _arg = Get.arguments;
  final _loading = false.obs;
  final _product = Rx<ProductDetail?>(null);

  bool get loading => _loading.value;
  set loading(bool value) => _loading.value = value;

  ProductDetail get product => _product.value!;
  set product(ProductDetail? value) => _product.value = value;

  getData({bool withLoading = true}) async {
    loading = withLoading;
    product = await ProductData.getSingle(_arg);
    loading = false;
    if (_product.value == null) {
      info(message: "Ops, terjadi kesalahan saat mengambil data product");
      Get.back();
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
