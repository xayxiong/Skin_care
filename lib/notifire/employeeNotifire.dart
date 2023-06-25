// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/foundation.dart';
import 'package:skin_care/model/Employee_Model.dart';

class EmployeeNotifire with ChangeNotifier {
  EmployeeData ?CurrentEmployee_loco;

  RefreshEmp() {
    CurrentEmployee_loco;
    notifyListeners();
  }
}
