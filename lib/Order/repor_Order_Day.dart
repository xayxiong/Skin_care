// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:intl/intl.dart';
import 'package:skin_care/eclement/element.dart';

import '../notifire/Repport_Order_Notifire.dart';
import 'Report_Order_Month.dart';


class Report_Order_Day extends StatefulWidget {
  const Report_Order_Day({Key? key}) : super(key: key);

  @override
  State<Report_Order_Day> createState() => _Report_Order_DayState();
}

final List items = List.generate(3, (i) => "Item $i");

class _Report_Order_DayState extends State<Report_Order_Day> {
  @override
  Widget build(BuildContext context) {
 report_incomeNotifire order = Provider.of<report_incomeNotifire>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ລາຍການສັ່ງຊື້ທີ່ສຳເລັດໃນເເຕ່ລະມື້'),
        centerTitle: true,
        backgroundColor: element.main,
        leading: element().RoutePageBack(context, const Report_Order_Month()),
       // bottom: WidgetSearch(label: 'ປີ - ເດືອນ-ວັນ'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                    '   ປະຈໍາວັນ: ${order.curren_Orderreport.date!.toDate().toString().substring(0,7)}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemCount: order.Order_Day.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.only(right: 10, left: 10),
                    child: InkWell(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Card(
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                      'ປີ : ${order.Order_Day[index].date!.toDate().toString().substring(0,10)}'),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
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
                                            ' ${order.Order_Day[index].amountAll}',
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
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                '${NumberFormat.decimalPattern().format(order.Order_Day[index].sumtatall)}',
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
                    ));
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
