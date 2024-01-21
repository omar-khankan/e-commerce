import 'package:e_commerce/core/data/models/products_model.dart';
import 'package:e_commerce/core/data/repository/products_repository.dart';
import 'package:get/get.dart';

class TaskController2 extends GetxController {
  RxList allCategory = [].obs;
  RxInt sectedIndex = 0.obs;
  RxList<ProductModel> allProduct = <ProductModel>[].obs;
  RxList<ProductModel> allProductByCategory = <ProductModel>[].obs;

  @override
  void onInit() {
    getCategories();
    getProductsByCategory("");
    getAllProducts();
    super.onInit();
  }

  void getCategories() {
    ProductRepository().getAllCategory().then((value) {
      value.fold((l) {}, (r) {
        allCategory.clear();
        allCategory.addAll(r);
        allCategory.insert(0, 'All');
      });
    });
  }

  void getAllProducts() {
    ProductRepository().getAllProduct().then((value) {
      value.fold((l) {}, (r) {
        allProduct.clear();
        allProduct.addAll(r);
      });
    });
  }

  void getProductsByCategory(String category) {
    ProductRepository().getProductByCategory(category).then((value) {
      value.fold((l) {}, (r) {
        allProductByCategory.clear();
        allProductByCategory.addAll(r);
      });
    });
  }
  //   void getProductByCAtegory(String category) {
  //   productRepository.getProductByCategory(category).then((value) {
  //     value.fold((l) {}, (r) {
  //       productByCategoriesList.clear();
  //       productByCategoriesList.addAll(r);
  //     });
  //   });
  // }
}
