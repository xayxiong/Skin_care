// ignore_for_file: camel_case_types, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:skin_care/eclement/element.dart';

import '../notifire/OrderNotifire.dart';
import 'Bill_Order.dart';

class view_order extends StatefulWidget {
  const view_order({Key? key}) : super(key: key);

  @override
  State<view_order> createState() => _View_orderState();
}

class _View_orderState extends State<view_order> {
  @override
  Widget build(BuildContext context) {
    Order_Notifire order = Provider.of<Order_Notifire>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: element.main,
          leading: element.BackPage(context),
          title: const Text('ລາຍລະອຽດອໍເດີ້'),
          centerTitle: true,
        ),
        body: order.Curren_Order != null
            ? Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ວັນທີ: ${order.Curren_Order.date!.toDate().toString().substring(0, 10)}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text('ລະຫັດສັ່ງຊື້ :',
                                      style: TextStyle(fontSize: 16)),
                                  Text(
                                    ' ${order.Curren_Order.id}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('ຊື່ລູກຄ້າ :',
                                      style: TextStyle(fontSize: 16)),
                                  Text(
                                    ' ${order.Curren_Order.nameCutommer}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'ເບີໂທ: ',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text('${order.Curren_Order.tel}',
                                      style: const TextStyle(fontSize: 16)),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'ທີ່ຢຸ່ :',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(' ${order.Curren_Order.address}',
                                      style: const TextStyle(fontSize: 16)),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'ຊື່ພະນັກງານ:',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(' ${order.ctm_Ooder.name}',
                                      style: const TextStyle(fontSize: 16)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            SizedBox(
                                width: 60,
                                child: Text(
                                  'ລຳດັບ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )),
                            SizedBox(
                                width: 80,
                                child: Text('ຊື່ສິນຄ້າ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16))),
                            SizedBox(
                                width: 80,
                                child: Text('ຈຳນວນ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16))),
                            SizedBox(
                                width: 80,
                                child: Text('ປະເພດ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16))),
                            SizedBox(
                                width: 70,
                                child: Text('ລາຄາລວມ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16))),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                          itemBuilder: (context, index) {
                            return order.Order_detill != null
                                ? Card(
                                    child: Column(
                                      children: [
                                        Center(
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                            height: 50,
                                                            width: 60,
                                                            child: Text(
                                                                '${index + 1}')),
                                                        SizedBox(
                                                            height: 50,
                                                            width: 80,
                                                            child: Text(
                                                                '${order.Order_detill[index].Product!.nameProduct}')),
                                                        SizedBox(
                                                            height: 50,
                                                            width: 60,
                                                            child: Text(
                                                                '${NumberFormat.decimalPattern().format(order.Order_detill[index].amout)}')),
                                                        SizedBox(
                                                            height: 50,
                                                            width: 80,
                                                            child: Text(
                                                                '${order.Order_detill[index].Product!.category_id}')),
                                                        SizedBox(
                                                            height: 50,
                                                            width: 80,
                                                            child: Text(
                                                                '${NumberFormat.decimalPattern().format(order.Order_detill[index].sum).toString()}')),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container();
                          },
                          itemCount: order.Order_detill.length),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'ຈຳນວນລວມ :',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    ' ${order.Curren_Order.amouttotal} ອັນ',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    ' ລາຄາທັ້ງໝົດ :',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    ' ${NumberFormat.decimalPattern().format(order.Curren_Order.sumtotal)} ກີບ',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              )
                            ],
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: element.main,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: const Text(
                              'ບັນທຶກເປັນພີດີເອຟ',
                              style: TextStyle(fontSize: 16),
                            ),
                            onPressed: () async {
                              Bill_Order.save_Bill(order, context);
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            : Container());
  }
}
