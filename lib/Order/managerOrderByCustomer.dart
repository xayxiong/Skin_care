// ignore_for_file: unnecessary_string_interpolations, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:skin_care/eclement/element.dart';

import '../Order_detill/View_order_cutommer.dart';
import '../api/get_Order.dart';
import '../notifire/OrderNotifire.dart';

class ManagerOrderByCustomer extends StatefulWidget {
  const ManagerOrderByCustomer({Key? key}) : super(key: key);

  @override
  State<ManagerOrderByCustomer> createState() => _ManagerOrderByCustomerState();
}

class _ManagerOrderByCustomerState extends State<ManagerOrderByCustomer> {
  @override
  initState() {
    super.initState();
    Order_Notifire order = Provider.of<Order_Notifire>(context, listen: false);
    Get_Order(order);
  }

  @override
  Widget build(BuildContext context) {
    Order_Notifire order = Provider.of<Order_Notifire>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('ລູກຄ້າສັ່ງຊື້ສິນຄ້າ'),
          centerTitle: true,
          backgroundColor: element.main,
          // leading: element().RoutePageBack(context, const Menu()),
        ),
        body: ListView.builder(
          itemCount: order.Order.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Card(
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () async {
                        order.Curren_Order = order.Order[index];
                        Get_Order_Detlill(order);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const view_order()));
                      },
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Text(
                                    'ລະຫັດ: ${order.Order[index].id}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(width: 30),
                                  Text(
                                    '${order.Order[index].date!.toDate().toString().substring(0, 10)}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'ຊື່ລູກຄ້າ: ${order.Order[index].nameCutommer}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              'ເບີໂທ: ${order.Order[index].tel} ',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              'ຈຳນວນ: ${order.Order[index].Ditell.length} ລາຍການ',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              'ຈຳນວນທັງໝົດ: ${order.Order[index].amouttotal} ອັນ',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Row(
                                  children: [
                                    const Text(
                                      'ລາຄາລວມ:',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      ' ${NumberFormat.decimalPattern().format(order.Order[index].sumtotal)} ',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      'ກີບ',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                )),
                                Staustus(order, index),
                              ],
                            )
                          ]),
                    )),
              ),
            );
          },
        ));
  }

  Widget Staustus(Order_Notifire order, int index) {
    return order.Order[index].Staustus == 'ລໍຖ້າ'
        ? ElevatedButton(
            onPressed: () {
              order.Curren_Order = order.Order[index];
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.cyan,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: Text('${order.Order[index].Staustus}'),
          )
        : ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: Text('${order.Order[index].Staustus}'),
          );
  }
}
