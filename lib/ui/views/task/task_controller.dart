// import 'package:e_commerce/core/data/models/products_model.dart';
// import 'package:e_commerce/core/data/repository/products_repository.dart';
// import 'package:get/get.dart';

// class TaskController extends GetxController {
//   RxList categoriesList = [].obs;
//   RxList<ProductModel> productsList = <ProductModel>[].obs;
//   RxList<ProductModel> productscategoryList = <ProductModel>[].obs;
//   RxInt selectedIndex = 0.obs;

//   @override
//   void onInit() {
//     getAllCategory();
//     getProductsByCategory("");
//     getAllProducts();
//     super.onInit();
//   }

//   void getAllCategory() {
//     ProductRepository().getCategory().then((value) {
//       value.fold((l) {}, (r) {
//         categoriesList.clear();
//         categoriesList.addAll(r);
//         categoriesList.insert(0, "All");
//       });
//     });
//   }

//   void getAllProducts() {
//     ProductRepository().getAllProduct().then((value) {
//       value.fold((l) {}, (r) {
//         productsList.clear();
//         productsList.addAll(r);
//       });
//     });
//   }

//   void getProductsByCategory(String category) {
//     ProductRepository().getProductByCategory(category).then((value) {
//       value.fold((l) {}, (r) {
//         productscategoryList.clear();
//         productscategoryList.addAll(r);
//       });
//     });
//   }
// }
