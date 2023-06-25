// import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeeData {
  String? id;
  String? name;
  String? email;
  String? password;
  String? tel;
  String? address;
  String? position;
  Timestamp? date;
  EmployeeData({
    this.id,
    this.email,
    this.password,
    this.name,
    this.date,
    this.address,
    this.position,
    this.tel,
  });
  static List<String> positoin = ['Admin', 'Sale'];
  EmployeeData.frommap(Map<String, dynamic> value) {
    id = value['id'];
    name = value['name'];
    email = value['email'];
    password = value['password'];
    date = value['date'];
    address = value['address'];
    tel = value['tel'];
    position = value['position'];
  }

  Map<String, dynamic>? toMap() {
    return {
      'id':id,
      'name': name,
      'email': email,
      'password': password,
      'date': date,
      'address': address,
      'tel': tel,
      'position': position,
      'date': Timestamp.now()
    };
  }
}
