


import 'package:flutter/material.dart';
import 'package:shoping_hub/category/model/category_model.dart';
import 'package:shoping_hub/category/service/category_service.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> categoryList = [];
  CategoryService categoryService;
  String? errorMessage;

  CategoryProvider(this.categoryService);

  Future fetchCategory() async {
    try {
      categoryList = await categoryService.fetchCategory();
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      notifyListeners();
    }
  }
}