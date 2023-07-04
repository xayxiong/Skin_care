// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:intl/intl.dart';
import 'package:skin_care/Order/repor_Order_Day.dart';
import 'package:skin_care/eclement/element.dart';
import 'package:skin_care/notifire/customerNotifire.dart';


import '../api/get_Report_Order.dart';
import '../notifire/Repport_Order_Notifire.dart';




class Report_Order_Month extends StatefulWidget {
  const Report_Order_Month({Key? key}) : super(key: key);

  @override
  State<Report_Order_Month> createState() => _Report_Order_MonthState();
}

class _Report_Order_MonthState extends State<Report_Order_Month> {
  @override
  initState() {
    super.initState();
    report_incomeNotifire order =
        Provider.of<report_incomeNotifire>(context, listen: false);
    CustomerNotifire ctm =
        Provider.of<CustomerNotifire>(context, listen: false);
    Get_reportl_Order_Month(order, ctm);
  }

  @override
  Widget build(BuildContext context) {
    report_incomeNotifire order = Provider.of<report_incomeNotifire>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ລາຍງານຈຳນວນສັ່ງຊື້ທີສຳເລັດ'),
        centerTitle: true,
        backgroundColor: element.main,
        // leading: element().RoutePageBack(context, const Menu()),
        // bottom: WidgetSearch(label: 'ປີ - ເດືອນ'),
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: order.Order_Month.length,
        itemBuilder: (context, index) {
          return Container(
              margin: EdgeInsets.only(right: 10, left: 10),
              child: InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                            // 'ປະຈໍາປີ: ${order.curren_Orderreport!.date!.toDate().toString().substring(0,4)}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                            'ປະຈໍາປີ:  ${DateTime.now().year}',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold))),
                    Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                                'ປີ/ເດືອນ: ${order.Order_Month[index].date!.toDate().toString().substring(0, 7)}'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'ລາຍການສ່ັງຊື້ສຳເລັດ:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      ' ${order.Order_Month[index].amountAll}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: element.main,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      ' ອໍເດີ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'ຍອດເງີນ:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          ' ${NumberFormat.decimalPattern().format(order.Order_Month[index].sumtatall)}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          ' ກີບ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      child: Icon(Icons.arrow_forward_ios_sharp,
                                          size: 14),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  order.curren_Orderreport = order.Order_Month[index];
                  CustomerNotifire ctm =
                      Provider.of<CustomerNotifire>(context, listen: false);
                  Get_reportl_Day(order, ctm);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Report_Order_Day()));
                },
              ));
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox();
        },
      ),
    );
  }
}
