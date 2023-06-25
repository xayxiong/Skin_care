// ignore_for_file: non_constant_identifier_names, avoid_function_literals_in_foreach_calls, no_leading_underscores_for_local_identifiers, avoid_print



import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/category_Model.dart';
import '../model/product_Model.dart';
import '../notifire/categoryNotifire.dart';
import '../notifire/productNotifire.dart';

GetProduct(ProductNotifire product) async {
  List<product_Model> _Product = [];
  QuerySnapshot<Map<String, dynamic>> rfn = await FirebaseFirestore.instance
      .collection('products')
      .orderBy('amount', descending: true)
      .get();
  rfn.docs.forEach(
    (e) {
      print(e.data());
      product_Model f = product_Model.formMap(e.data());
      _Product.add(f);
    },
  );
  product.Product = _Product;
  product.RefreshProduct();
}

GetProduct_type(ProductNotifire product, var catename, index) async {
  List<product_Model> _Product = [];
  QuerySnapshot<Map<String, dynamic>> rfn = await FirebaseFirestore.instance
      .collection('products')
      .where('category_id', isEqualTo: catename)
      .get();
  rfn.docs.forEach(
    (e) {
      print(e.data());
      product_Model f = product_Model.formMap(e.data());
      _Product.add(f);
    },
  );
  product.Product = _Product;
  product.RefreshProduct();
}

GetCategoryData(CategoryNotifire cate) async {
  List<CategoryData> category = [];
  QuerySnapshot<Map<String, dynamic>> rfn = await FirebaseFirestore.instance
      .collection('categorys')
      .orderBy('category')
      .get();
  cate.cate.clear();
  rfn.docs.forEach((e) {
    print(e.data());
    CategoryData f = CategoryData.frommap(e.data());
    cate.cate.add(e['id']);
    category.add(f);
  });
  cate.category = category;
  cate.RefreshCategory();
}
