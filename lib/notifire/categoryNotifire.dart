// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:collection';

import 'package:flutter/foundation.dart';
import '../model/category_Model.dart';

class CategoryNotifire with ChangeNotifier {
  List<CategoryData> category = [];
  List<String> cate = [];
  String? categoryType;
  CategoryData? CurrentCategory;
  UnmodifiableListView<CategoryData> get categoryList =>
      UnmodifiableListView(category);

  RefreshCategory() {
    category;
    notifyListeners();
  }
  getCurrentEmployee() {
    CurrentCategory;

    print(CurrentCategory?.category);
    notifyListeners();
  }
  SelectType(String? v) {
    categoryType = v;
    notifyListeners();
  }
}
