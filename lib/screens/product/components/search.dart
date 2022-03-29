import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_cartridje_mobile/components/default_button.dart';
import 'package:project_cartridje_mobile/config/colors_config.dart';
import 'package:project_cartridje_mobile/config/size_config.dart';
import 'package:project_cartridje_mobile/controllers/category_controller.dart';
import 'package:project_cartridje_mobile/controllers/search_controller.dart';
import 'package:project_cartridje_mobile/screens/details/components/top_rounded_container.dart';
import 'package:project_cartridje_mobile/screens/home/components/search_field.dart';
import 'package:project_cartridje_mobile/screens/product/components/search_item.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchEditController = TextEditingController();

  final CategoryController _categoriesController =
      Get.find<CategoryController>();

  final SearchController _searchController = Get.find<SearchController>();

  List<String> selectedCategories = [];

  @override
  void initState() {
    super.initState();
    for (String curCat in _searchController.search!.categories) {
      selectedCategories.add(curCat);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
          right: 0,
          bottom: 0,
          left: SizeConfig.screenWidth * 0.05,
          top: SizeConfig.screenWidth * 0.1,
          child: Container(
            width: SizeConfig.screenWidth * .85,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(0),
                    topRight: Radius.circular(0))),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          bottom: 15,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Search product",
                                  style: TextStyle(
                                      fontSize: getProportionateScreenWidth(22),
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold)),
                              IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: Icon(Icons.arrow_forward_ios,
                                      color: primaryColor,
                                      size: getProportionateScreenWidth(20)))
                            ]),
                      ),
                      SearchField(
                        onChange: (_) {},
                        controller: searchEditController,
                        widthPercent: 0.9,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          bottom: 15,
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text("Categories",
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(16),
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold)),
                          subtitle: SizedBox(
                            height: getProportionateScreenWidth(40),
                            child: Obx(() {
                              return ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    _categoriesController.categories.length,
                                itemBuilder: (context, index) {
                                  return SearchItem(
                                      _categoriesController
                                          .categories[index].title,
                                      selectedCategories.contains(
                                          _categoriesController
                                              .categories[index].uuid), () {
                                    selectCategory(_categoriesController
                                        .categories[index].uuid as String);
                                  });
                                },
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TopRoundedContainer(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: SizeConfig.screenWidth * 0.15,
                        right: SizeConfig.screenWidth * 0.15,
                        bottom: getProportionateScreenWidth(40),
                        top: getProportionateScreenWidth(15),
                      ),
                      child: DefaultButton(
                        text: "Apply",
                        press: () async {
                          _searchController.setSearchData(
                              newSearch: _searchController.search!.copyWith(
                                  name: searchEditController.text.toString(),
                                  categories: selectedCategories));
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  )
                ]),
          ))
    ]);
  }

  void selectCategory(String categoryId) {
    selectedCategories.contains(categoryId)
        ? selectedCategories.remove(categoryId)
        : selectedCategories.add(categoryId);

    setState(() {});
  }
}
