import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_cartridje_mobile/models/search.dart';

class SearchController extends GetxController {
  final Rxn<SearchModel> _search = Rxn<SearchModel>();

  SearchModel? get search => _search.value;

  set search(SearchModel? search) => _search.value = search;
  RxBool init = RxBool(false);

  SearchController();

  @override
  void onInit() {
    super.onInit();
    search = SearchModel(name: "", categories: []);
  }

  Future setSearchData({required SearchModel newSearch}) async {
    search = newSearch;
    debugPrint(search.toString());
    update();
  }
}
