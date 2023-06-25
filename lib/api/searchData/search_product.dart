// ignore_for_file: unused_local_variable, non_constant_identifier_names, avoid_function_literals_in_foreach_calls, avoid_print

import 'dart:async';


import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../model/product_Model.dart';
import '../../../notifire/productNotifire.dart';

Future SearchProduct(ProductNotifire pro) async {
  List<product_Model>? _Product = [];
  List<product_Model> _f = [];
  QuerySnapshot<Map<String, dynamic>> rfn = await FirebaseFirestore.instance
      .collection('products')
      .where('nameProduct', isGreaterThanOrEqualTo: '${pro.shech}')
      .get();
  pro.Product.clear();
  rfn.docs.forEach((data) async {
    String nameProduct = data['nameProduct'].toString();
    if (nameProduct.trim() == pro.shech.trim()) {
      product_Model p = await product_Model.formMap(data.data());
      _f.add(p);
      pro.RefreshProduct();
    } else if (nameProduct[0] == pro.shech[0] && nameProduct[1] == pro.shech[1] || nameProduct[0] == pro.shech[0] || nameProduct[0] == pro.shech[1]) {
      product_Model p = await product_Model.formMap(data.data());
      _Product.add(p);
    }
  });
  waitt(pro, _f, _Product);
}

Future waitt(ProductNotifire pro, _f, _Product) async {
  Future.delayed(Duration(seconds: 1), () {
    if (_f.length != 0) {
      print(_f.length);
      pro.Product = _f;
      pro.RefreshProduct();
    } else {
      pro.Product.clear();
      print(_Product.length);
      pro.Product = _Product;
      pro.RefreshProduct();
    }
  }).catchError((err) {});
}
