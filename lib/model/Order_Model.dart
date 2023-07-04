import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skin_care/model/product_Model.dart';

class CartDetailData {
  product_Model? Product;
  int amout = 0;
  int sum = 0;

  CartDetailData(this.Product, this.amout, this.sum);
}

class CartModel {
  String? Product_ID;
  int? amout;
  int? sum;

  CartModel(this.Product_ID, this.amout, this.sum);

  CartModel.formMAp(Map<String, dynamic> v) {
    Product_ID = v['product_id'];
    amout = v['amout'];
    sum = v['sum'];
  }

  Map<String, dynamic> toMap() {
    return {'product_id': Product_ID, 'amout': amout, 'sum': sum};
  }
}

class Order_Model_upload {
  String? id;
  String? nameCutommer;
  String? tel;
  String? address;
  // String? Employee_ID;
  // String? Customer_ID;
  int? amouttotal;
  int? sumtotal;
  String? Staustus;
  var Ditell = [];
  Timestamp? date;

  Order_Model_upload();

  Order_Model_upload.formMap(Map<String, dynamic> v) {
    id = v['id'];
    // Customer_ID = v['Employee_ID'];
    amouttotal = v['amouttotal'];
    Ditell = v['Ditell'];
    Staustus = v['Staustus'];
    date = v['date'];
    nameCutommer = v['nameCutommer'];
    tel = v['tel'];
    address = v['address'];
    sumtotal = v['sumtotal'];
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        // 'Employee_ID': Customer_ID,
        'nameCutommer': nameCutommer,
        'tel': tel,
        'address': address,
        'amouttotal': amouttotal,
        'sumtotal': sumtotal,
        'Ditell': Ditell,
        'Staustus': Staustus ?? 'ລໍຖ້າ',
        'date': DateTime.now()
      };
}
