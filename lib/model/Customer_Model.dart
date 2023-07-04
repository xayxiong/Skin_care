// import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerData {
  String? id;
  String? name;
  String? email;
  String? password;
  String? tel;
  String? address;
 
  Timestamp? date;
  CustomerData({
    this.id,
    this.email,
    this.password,
    this.name,
    this.date,
    this.address,
  
    this.tel,
  });

  CustomerData.frommap(Map<String, dynamic> value) {
    id = value['id'];
    name = value['name'];
    email = value['email'];
    password = value['password'];
    date = value['date'];
    address = value['address'];
    tel = value['tel'];
 
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
      
      'date': Timestamp.now()
    };
  }
}
