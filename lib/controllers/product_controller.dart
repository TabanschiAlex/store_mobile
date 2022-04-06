import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_cartridje_mobile/controllers/search_controller.dart';
import 'package:project_cartridje_mobile/models/product.dart';
import 'package:project_cartridje_mobile/models/search.dart';
import 'package:project_cartridje_mobile/repositories/product_repository.dart';

class AllProducts extends GetxController {
  final IProductRepository productsRepo;
  RxList<Product> products = RxList([]);
  RxList<Product> foundedProducts = RxList([]);
  RxBool loading = false.obs;
  RxBool loadingError = false.obs;
  RxBool loadingMore = false.obs;
  RxBool loadingMoreError = false.obs;
  int productsPerPage = 5;
  final SearchController _searchController = Get.put(SearchController());
  Rxn<SearchModel> searchModel = Rxn<SearchModel>();

  AllProducts({
    required this.productsRepo,
  });

  @override
  void onInit() {
    super.onInit();
    searchModel.value = _searchController.search;
    _searchController.addListener(() {
      searchModel.value = _searchController.search;
    });
    initialLoad();
    searchModel.listenAndPump((event) {
      loadFoundedProducts(event!);
    });
  }

  initialLoad() async {
    loading.value = true;
    loadingError.value = false;
    try {
      List<Product> _products = await productsRepo.allProducts();
      products.value = _products;
      foundedProducts.value = _products;
      print("load all products");
      loading.value = false;
    } catch (e) {
      print('all products load error > $e');
      loadingError.value = true;
      loading.value = false;
    }
  }

  loadMore() async {
    if (products.isEmpty) return;
    loadingMore.value = true;
    loadingMoreError.value = false;
    try {
      List<Product> _products = await productsRepo.allProducts();
      products.addAll(_products);
      print("load all products");
      loadingMore.value = false;
    } catch (e) {
      print('all products more load error > $e');
      loadingMoreError.value = true;
      loadingMore.value = false;
    }
  }

  loadFoundedProducts(SearchModel searchModel) {
    debugPrint(searchModel.toString());
    foundedProducts.value = products.where((element) =>
        (element.title.contains(searchModel.name))).toList();
  }
}
