import 'package:flutter/foundation.dart';
import 'package:skin_care/model/Customer_Model.dart';

// import '../model/Employee_Model.dart';
import '../model/Order_Model.dart';




class Order_Notifire with ChangeNotifier {
  List<Order_Model_upload> Order = [];
  List<CartDetailData> Order_detill = [];
  Order_Model_upload Curren_Order = Order_Model_upload();
  CustomerData ctm_Ooder= CustomerData();
  Referenc() {
    Order;
    notifyListeners();
  }
}
