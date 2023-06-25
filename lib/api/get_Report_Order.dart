
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skin_care/model/Report_Order_Model.dart';
import 'package:skin_care/notifire/employeeNotifire.dart';


import '../notifire/Repport_Order_Notifire.dart';

Get_reportl_Order_Month(report_incomeNotifire Order,EmployeeNotifire emp) async {
  List<Report_Order> m1 = [];
  List<num> sumtotal = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<num> amountotal = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<Timestamp> Month = [
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
  ];
  QuerySnapshot<Map<String, dynamic>> rfn = await FirebaseFirestore.instance
      .collection("order")
      .where('date', isGreaterThanOrEqualTo: DateTime(DateTime.now().year, 1))
      .get();
  m1.clear();
  rfn.docs.forEach((element) async {
    Timestamp g = element['date'];
    //print(element.data().length);

    String m = g.toDate().toString().substring(6, 7);
    print(m+' ເດືອນ');
    if (emp.CurrentEmployee_loco!.id == element['Employee_ID']&&element['Staustus'] == 'ສຳເລັດ') {
      print(element.data());
    await  Report_Month(m: m, Month: Month, sumtotal: sumtotal, g: g, element: element,amountotal: amountotal);
    }
  });
  int i = 0;
  for (var shan in Month) {
    if (Month[i] != Timestamp(1, 1)) {
      Report_Order m5 = Report_Order(sumtatall: int.parse(sumtotal[i].toString()), date: Month[i],amountAll: amountotal[i]);
      m1.add(m5);
      Order.Order_Month = m1;
      Order.Refresh();
      print(Order.Order_Month.length.toString() +' ຈຳນວນ');
    }
    i++;
  }
}

Report_Month({required String? m,required List<Timestamp>?Month,required List<num>?sumtotal, required Timestamp? g,required element,required amountotal}){
  switch (m) {
    case '12':
      Month![11] = g!;
      sumtotal![11] += element['sumtotal'];
      amountotal![11]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '11':
      Month![10] = g!;
      sumtotal![10] += element['sumtotal'];
      amountotal![10]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '10':
      Month![9] = g!;
      sumtotal![9] += element['sumtotal'];
      amountotal![9]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '9':
      Month![8] = g!;
      sumtotal![8] += element['sumtotal'];
      amountotal![8]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '8':
      Month![7] = g!;
      sumtotal![7] += element['sumtotal'];
      amountotal![7]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '7':
      Month![6] = g!;
      sumtotal![6] += element['sumtotal'];
      amountotal![6]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '6':
      {
        Month![5] = g!;
        sumtotal![5] += element['sumtotal'];
        amountotal![5]+=(element['amouttotal']-element['amouttotal'])+1;
      }
      break;
    case '5':
      Month![4] = g!;
      sumtotal![4] += element['sumtotal'];
      amountotal![4]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '4':
      {
        Month![3] = g!;
        sumtotal![3] += element['sumtotal'];
        amountotal![3]+=(element['amouttotal']-element['amouttotal'])+1;
      }
      break;
    case '3':
      {
        Month![2] = g!;
        sumtotal![2] += element['sumtotal'];
        amountotal![2]+=(element['amouttotal']-element['amouttotal'])+1;
      }
      break;
    case '2':
      {
        Month![1] = g!;
        sumtotal![1] += element['sumtotal'];
        amountotal![1]+=(element['amouttotal']-element['amouttotal'])+1;
      }
      break;
    case '1':
      {
        Month![0] = g!;
        sumtotal![0] += element['sumtotal'];
        amountotal![0]+=(element['amouttotal']-element['amouttotal'])+1;
      }
  }
  ;
}

Get_reportl_Day(report_incomeNotifire Order ,EmployeeNotifire emp) async {
  List<Report_Order> m1 = [];
  List<num> amountotal = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ];
  List<num> sumtotal = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ];
  List<Timestamp> Day = [
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
    Timestamp(1, 1),
  ];
  List<String> year_M_D =
      Order.curren_Orderreport.date!.toDate().toString().split('-');
  DateTime stars = DateTime(
    int.parse(year_M_D[0]),
    int.parse(year_M_D[1]),
  );
  Timestamp? end = Order.curren_Orderreport.date;
  QuerySnapshot<Map<String, dynamic>> rfn = await FirebaseFirestore.instance
      .collection("order")
      .where('date', isGreaterThan: stars)
      .where('date', isLessThanOrEqualTo: end)
      .get();
  m1.clear();
  rfn.docs.forEach((element) async {
    Timestamp g = element['date'];
    print('${g.toDate()}');
    String m = g.toDate().toString().substring(8, 10);

    if (emp.CurrentEmployee_loco!.id == element['Employee_ID'] && element['Staustus'] == 'ສຳເລັດ') {
      print('${m}');
    await Report_Day(m: m, Day: Day, sumtotal: sumtotal, g: g, element: element,amountotal: amountotal);
    }
  });
  int i = 0;
  for (var shan in Day) {
    if (Day[i] != Timestamp(1, 1)) {
      Report_Order m5 = Report_Order(
          sumtatall: int.parse(sumtotal[i].toString()), date: Day[i],amountAll: amountotal[i]);
      m1.add(m5);
      Order.Order_Day = m1;
      Order.Refresh();
    }
    i++;
  }
}

Report_Day({required String? m,required List<Timestamp>?Day,required List<num>?sumtotal, required Timestamp? g,required element,required amountotal}){
  switch (m) {
    case '31':
      Day![30] = g!;
      sumtotal![30] += element['sumtotal'];
      amountotal![30]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '30':
      Day![29] = g!;
      sumtotal![29] += element['sumtotal'];
      amountotal![29]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '29':
      Day![28] = g!;
      sumtotal![28] += element['sumtotal'];
      amountotal![28]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '28':
      Day![27] = g!;
      sumtotal![27] += element['sumtotal'];
      amountotal![27]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '27':
      Day![26] = g!;
      sumtotal![26] += element['sumtotal'];
      amountotal![26]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '26':
      Day![25] = g!;
      sumtotal![25] += element['sumtotal'];
      amountotal![25]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '25':
      Day![24] = g!;
      sumtotal![24] += element['sumtotal'];
      amountotal![24]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '24':
      Day![23] = g!;
      sumtotal![23] += element['sumtotal'];
      amountotal![23]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '23':
      Day![22] = g!;
      sumtotal![22] += element['sumtotal'];
      amountotal![22]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '22':
      Day![21] = g!;
      sumtotal![21] += element['sumtotal'];
      amountotal![21]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '21':
      Day![20] = g!;
      sumtotal![20] += element['sumtotal'];
      amountotal![20]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '20':
      Day![19] = g!;
      sumtotal![19] += element['sumtotal'];
      amountotal![19]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '19':
      Day![18] = g!;
      sumtotal![18] += element['sumtotal'];
      amountotal![18]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '18':
      Day![17] = g!;
      sumtotal![17] += element['sumtotal'];
      amountotal![17]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '17':
      Day![16] = g!;
      sumtotal![16] += element['sumtotal'];
      amountotal![16]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '16':
      Day![15] = g!;
      sumtotal![15] += element['sumtotal'];
      amountotal![15]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '15':
      Day![14] = g!;
      sumtotal![14] += element['sumtotal'];
      amountotal![14]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '14':
      Day![13] = g!;
      sumtotal![13] += element['sumtotal'];
      amountotal![13]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '13':
      Day![12] = g!;
      sumtotal![12] += element['sumtotal'];
      amountotal![12]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '12':
      Day![11] = g!;
      sumtotal![11] += element['sumtotal'];
      amountotal![11]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '11':
      Day![10] = g!;
      sumtotal![10] += element['sumtotal'];
      amountotal![10]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '10':
      Day![9] = g!;
      sumtotal![9] += element['sumtotal'];
      amountotal![9]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '09':
      Day![8] = g!;
      sumtotal![8] += element['sumtotal'];
      amountotal![8]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '08':
      Day![7] = g!;
      sumtotal![7] += element['sumtotal'];
      amountotal![7]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '07':
      Day![6] = g!;
      sumtotal![6] += element['sumtotal'];
      amountotal![6]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '06':
      {
        Day![5] = g!;
        sumtotal![5] += element['sumtotal'];
        amountotal![5]+=(element['amouttotal']-element['amouttotal'])+1;
      }
      break;
    case '05':
      Day![4] = g!;
      sumtotal![4] += element['sumtotal'];
      amountotal![4]+=(element['amouttotal']-element['amouttotal'])+1;
      break;
    case '04':
      {
        Day![3] = g!;
        sumtotal![3] += element['sumtotal'];
        amountotal![3]+=(element['amouttotal']-element['amouttotal'])+1;
      }
      break;
    case '03':
      {
        Day![2] = g!;
        sumtotal![2] += element['sumtotal'];
        amountotal![2]+=(element['amouttotal']-element['amouttotal'])+1;
      }
      break;
    case '02':
      {
        Day![1] = g!;
        sumtotal![1] += element['sumtotal'];
        amountotal![1]+=(element['amouttotal']-element['amouttotal'])+1;
      }
      break;
    case '01':
      {
        Day![0] = g!;
        sumtotal![0] += element['sumtotal'];
        amountotal![0]+=(element['amouttotal']-element['amouttotal'])+1;
      }
  }
  ;
}