import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../model/Report_Order_Model.dart';

class report_incomeNotifire with ChangeNotifier{
  List<Report_Order> Order_Month = [];
  List<Report_Order>Order_Day = [];
  Report_Order curren_Orderreport = Report_Order();
  Refresh(){
    Order_Day;
    Order_Month;
    curren_Orderreport;
    notifyListeners();
  }

}