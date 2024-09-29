import 'package:get/get.dart';
import 'package:itasoft_technical_test/data/product.data.dart';
import 'package:itasoft_technical_test/helper/dialog.dart';
import 'package:itasoft_technical_test/model/product.detail.dart';

class AdjustmentFormController extends GetxController {
  final _arg = Get.arguments;
  final _loading = false.obs;
  final _btnLoading = false.obs;
  final _product = Rx<ProductDetail?>(null);

  bool get loading => _loading.value;
  set loading(bool value) => _loading.value = value;

  bool get btnLoading => _btnLoading.value;
  set btnLoading(bool value) => _btnLoading.value = value;

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

  requestItem() async {
    btnLoading = true;
    final success = await ProductData.adjustmentStock(_product.value!);
    btnLoading = false;
    if (success) {
      Get.back(result: true);
      info(message: "Adjustment stock berhasil");
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
