import 'package:cloud_firestore/cloud_firestore.dart';

class Report_Order{
  num? sumtatall;  // jum nuan ngern
  Timestamp? date;
  num? amountAll;  // jum nuan order
  Report_Order({this.date,this.sumtatall,this.amountAll});
}