// ignore_for_file: avoid_function_literals_in_foreach_calls, non_constant_identifier_names, unused_local_variable, avoid_print, file_names, unnecessary_brace_in_string_interps, await_only_futures, use_build_context_synchronously, unnecessary_string_interpolations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skin_care/Order/Get_order.dart';
import '../Login/login.dart';

import '../model/Employee_Model.dart';
import '../notifire/employeeNotifire.dart';

GetEmployeeData_only(
    EmployeeNotifire emp, String email, BuildContext context) async {
  QuerySnapshot<Map<String, dynamic>> rfn = await FirebaseFirestore.instance
      .collection('employees')
      .where('email', isEqualTo: '${email}')
      .get();
  rfn.docs.forEach(
    (e) async {
      EmployeeData em = await EmployeeData.frommap(e.data());
      emp.CurrentEmployee_loco = em;
      print(emp.CurrentEmployee_loco!.name);
      try {
        if (emp.CurrentEmployee_loco!.position == 'Sale') {
          formKey.currentState!.reset();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Get_Order(),
            ),
          );
        } else {
          Fluttertoast.showToast(
            msg: "ທ່ານບໍ່ສິດເຂົ້າເຖີງ",
            fontSize: 20,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        }
      } catch (e) {}
    },
  );

  emp.RefreshEmp();
}
