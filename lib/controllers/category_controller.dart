import 'package:get/get.dart';
import 'package:project_cartridje_mobile/models/category.dart';
import 'package:project_cartridje_mobile/repositories/category_repository.dart';

class CategoryController extends GetxController {
  final ICategoryRepository categoryRepository;
  RxList<CategoryModel> categories = RxList([]);
  RxBool loading = false.obs;
  RxBool loadingError = false.obs;
  RxBool loadingMore = false.obs;
  RxBool loadingMoreError = false.obs;

  CategoryController({
    required this.categoryRepository,
  });

  @override
  void onInit() {
    super.onInit();
    initialLoad();
  }

  initialLoad() async {
    loading.value = true;
    loadingError.value = false;
    try {
      List<CategoryModel> _categories =
          await categoryRepository.allCategories();
      categories.value = _categories;
      print("load all Categories");
      loading.value = false;
    } catch (e) {
      print('all Categories load error > $e');
      loadingError.value = true;
      loading.value = false;
    }
  }

  loadMore() async {
    if (categories.isEmpty) return;
    loadingMore.value = true;
    loadingMoreError.value = false;
    try {
      List<CategoryModel> _categories =
          await categoryRepository.allCategories();
      categories.addAll(_categories);
      print("load all Categories");
      loadingMore.value = false;
    } catch (e) {
      print('all Categories more load error > $e');
      loadingMoreError.value = true;
      loadingMore.value = false;
    }
  }
}
