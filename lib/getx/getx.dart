import 'package:get/get.dart';
import 'package:getx_final/constant/clothe_list.dart';
import 'package:getx_final/model/product_model.dart';

class DotChange extends GetxController {
  final RxInt dot = 0.obs;
  final RxInt indexedDot = 0.obs;

  List<Product>? clotheList;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    clotheList = clothes.map((e) => Product.fromJson(e)).toList();
  }

  void onAdd(int index) {
    clotheList![index].count = clotheList![index].count! + 1;
    update();
  }

  void onRemove(int index) {
    if (clotheList![index].count != 1) {
      clotheList![index].count = clotheList![index].count! - 1;
      update();
    }
  }
}
