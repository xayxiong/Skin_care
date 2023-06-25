// ignore_for_file: non_constant_identifier_names, avoid_function_literals_in_foreach_calls, await_only_futures

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skin_care/model/Order_Model.dart';
import 'package:skin_care/notifire/Cartnotififire.dart';
import 'package:skin_care/notifire/employeeNotifire.dart';
import 'package:skin_care/notifire/productNotifire.dart';

import '../GetProduct.dart';

Upload_Order(
    Cartnotifire cart, ProductNotifire product, EmployeeNotifire emp) async {
  Order_Model_upload Order = Order_Model_upload();
  cart.Carts.forEach((element) async {
    CartModel f =
        await CartModel(element.Product!.id, element.amout, element.sum);
    Order.Ditell.add(f.toMap());
    await FirebaseFirestore.instance
        .collection('products')
        .doc(f.Product_ID)
        .update({'amount': FieldValue.increment(-f.amout!)});
  });
  int randomNumber = await Random().nextInt(90) + 1000000;
  Order.id = await randomNumber.toString();
  Order.nameCutommer = await cart.nameCutomer;
  Order.tel = await cart.tel;

  Order.Employee_ID = await emp.CurrentEmployee_loco!.id;
  Order.address = await cart.address;
  Order.sumtotal = await cart.sumltoal;
  Order.amouttotal = await cart.amoultoal;
  FirebaseFirestore.instance
      .collection('order')
      .doc(randomNumber.toString())
      .set(Order.toMap())
      .then((value) {
    cart.Carts = [];
    cart.price = [];
    cart.amoul = [];
    cart.amoultoal = 0;
    cart.sumltoal = 0;
    cart.nameCutomer = '';
    cart.address = '';
    cart.tel = '020';
    cart.Refresh();
    GetProduct(product);
  });
}
