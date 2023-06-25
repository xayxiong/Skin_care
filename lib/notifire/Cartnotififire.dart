// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:collection';
import 'package:flutter/material.dart';

import '../model/Order_Model.dart';
import '../model/product_Model.dart';

class Cartnotifire with ChangeNotifier {
  List<CartDetailData> Carts = [];
  List<int> price = [];
  List<int> amoul = [];
  String? nameCutomer;
  String tel = '020';
  String? address;

  product_Model? Procartcart;
  int amoultoal = 0;
  int sumltoal = 0;
  UnmodifiableListView<CartDetailData> get Cartlist =>
      UnmodifiableListView(Carts);

  Refresh() {
    Carts;
    price;
    amoul;
    amoultoal;
    sumltoal;
    Procartcart;
    notifyListeners();
  }

  cecks() {
    amoultoal++;
    CartDetailData f = CartDetailData(Procartcart, 1, Procartcart!.price ?? 0);
    sumltoal += f.Product!.price!;
    Carts.add(f);
    price.add(f.sum);
    amoul.add(f.Product!.amount!);
    notifyListeners();
  }

  remove(index) {
    amoultoal -= Carts[index].amout;
    sumltoal -= Carts[index].sum;
    Carts.removeAt(index);
    notifyListeners();
  }

  sum(index) async {
    if (Carts[index].amout < amoul[index]) {
      amoultoal++;
      Carts[index].amout++;
      int _pi = price[index] * Carts[index].amout;
      Carts[index].sum = _pi;
      sumltoal += price[index];
      print(sumltoal);
    }

    notifyListeners();
  }

  dedet(index) {
    if (Carts[index].amout > 1) {
      amoultoal--;
      Carts[index].amout--;
      Carts[index].sum -= price[index];
      sumltoal -= price[index];
    }

    notifyListeners();
  }
}
