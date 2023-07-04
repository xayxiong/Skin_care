import 'package:flutter/foundation.dart';
import 'package:skin_care/model/Customer_Model.dart';


class CustomerNotifire with ChangeNotifier {
  CustomerData ? CurrentCustomer_loco;

  RefreshCtm() {
    CurrentCustomer_loco;
    notifyListeners();
  }
}
