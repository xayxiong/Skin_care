// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers, prefer_is_empty, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:skin_care/eclement/element.dart';

import '../api/GetProduct.dart';
import '../api/Upload_Data/Upload_Order.dart';
import '../daiglog.dart';
import '../notifire/Cartnotififire.dart';
import '../notifire/categoryNotifire.dart';

import '../notifire/employeeNotifire.dart';
import '../notifire/productNotifire.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    super.initState();
    Productfacing();
  }

  Future Productfacing() async {
    CategoryNotifire category =
        Provider.of<CategoryNotifire>(context, listen: false);
    await GetCategoryData(category);
  }

  @override
  Widget build(BuildContext context) {
    Cartnotifire cart = Provider.of<Cartnotifire>(context);
    ProductNotifire product = Provider.of<ProductNotifire>(context);
    // EmployeeNotifire emp = Provider.of<EmployeeNotifire>(context);
    EmployeeNotifire emp = Provider.of<EmployeeNotifire>(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.Cartlist.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  '${cart.Cartlist[index].Product!.image}',
                                  width: 100,
                                  height: 120,
                                  fit: BoxFit.fitWidth,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 112,
                                      height: 40,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Text(
                                                'ຊື່: ',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                  '${cart.Cartlist[index].Product!.nameProduct}'),
                                            ],
                                          ),
                                          Text(
                                              'ລາຄາ: ${NumberFormat.decimalPattern().format(cart.price[index])} ກີບ'),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          cart.sum(index);
                                        },
                                        child: const Text('ເພີ່ມ')),
                                    Text('${cart.Cartlist[index].amout}'),
                                    TextButton(
                                        onPressed: () {
                                          cart.dedet(index);
                                        },
                                        child: const Text('ລົບ')),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(width: 120),
                                    IconButton(
                                      onPressed: () {
                                        cart.remove(index);
                                      },
                                      icon: const Icon(Icons.delete),
                                      color: Colors.red,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'ລາຄາລວມ: ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                                '${NumberFormat.decimalPattern().format(cart.Carts[index].sum)} ກີບ'),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 60,
            width: 370,
            decoration: const BoxDecoration(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10, left: 20),
                        child: Text('ຈຳນວນ: ' '${cart.amoultoal} ອັນ'),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 10, left: 20),
                          child: Row(
                            children: [
                              const Text(
                                'ລາຄາລວມ: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  '${NumberFormat.decimalPattern().format(cart.sumltoal)} ກີບ'),
                            ],
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, right: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: element.main,
                    ),
                    onPressed: () {
                      _Dialog(cart);
                      print('$emp.CurrentEmployee_loco!.id');
                    },
                    child: const Text(
                      'ເພີ່ມທີ່ຢູ່',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 15, left: 15),
            width: 390,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: element.main,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(vertical: 14)),
              onPressed: () async {
                Dialog_Cire(context);
                await Upload_Order(cart, product, emp);
                Navigator.pop(context);
                Fluttertoast.showToast(
                  msg: "ສັ່ງຊື້ສຳເລັດ",
                  fontSize: 20,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                );
                // _key_import.currentState!.reset();
              },
              child: const Text(
                "ສັ່ງຊື້",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  final GlobalKey<FormState> _key_import = GlobalKey<FormState>();
  _Dialog(Cartnotifire cart) {
    return showDialog(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: AlertDialog(
          actions: [
            IconButton(
              icon: const Icon(Icons.indeterminate_check_box_outlined,
                  color: Colors.red, size: 30),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Column(
              children: [
                Form(
                    key: _key_import,
                    child: SizedBox(
                      width: 400,
                      height: 420,
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 10, left: 25),
                              child: Text(
                                'ເພີ່ມທີ່ຢູ່ລູກຄ້າ',
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            const SizedBox(height: 40),
                            ////////////////////////////////////////////////
                            TextFormField(
                              initialValue: cart.nameCutomer,
                              decoration: InputDecoration(
                                hintText: "ຊື່",
                                fillColor: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.1),
                                filled: true,
                                prefixIcon:
                                    const Icon(Icons.person_remove_sharp),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              onSaved: (_name) {
                                cart.nameCutomer = _name;
                              },
                              validator: (cost) {
                                if (cost!.isEmpty) {
                                  return "ກະລຸນາປ້ອນຂໍ້ມູນ";
                                } else if (cost.length < 4) {
                                  return "ກວດສວບລາຄາ";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            /////////////////////////////////////////
                            TextFormField(
                              initialValue: cart.tel.toString(),
                              decoration: InputDecoration(
                                hintText: "ເບີ",
                                fillColor: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.1),
                                filled: true,
                                prefixIcon: const Icon(Icons.phone),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              onSaved: (_tel) {
                                cart.tel = ' ${_tel.toString()}';
                              },
                              validator: (amout) {
                                if (amout!.isEmpty) {
                                  return "ກະລຸນາປ້ອນຂໍ້ມູນ";
                                } else if (amout.length < 12) {
                                  return "ໃສ່ຫມາຍໂທລະສັບໃຫ້ຖຶກຕ້ອງ";
                                } else if (amout.length < 8) {
                                  return "ໃສ່ໝາຍໂທລະສັບໃຫ້ຖຶກຕ້ອງ";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            ////////////////////////////////////////////////
                            Container(
                              height: 80,
                              child: TextFormField(
                                initialValue: cart.address,
                                decoration: InputDecoration(
                                  hintText: "ທີ່ຢູ່",
                                  fillColor: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.1),
                                  filled: true,
                                  prefixIcon: const Icon(Icons.home),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                onSaved: (_address) {
                                  cart.address = _address;
                                },
                                validator: (cost) {
                                  if (cost!.isEmpty) {
                                    return "ກະລຸນາປ້ອນຂໍ້ມູນ";
                                  } else if (cost.length < 4) {
                                    return "ກວດສວບລາຄາ";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 10),

                            Container(
                              width: 300,
                              height: 55,
                              child: ElevatedButton(
                                child: const Text(
                                  'ບັນທືກ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: element.main),
                                onPressed: () async {
                                  Navigator.pop(context);
                                  _Dialog(cart);
                                  if (_key_import.currentState!.validate()) {
                                    _key_import.currentState!.save();
                                    Fluttertoast.showToast(
                                      msg: "ເພີ່ມທີ່ຢູ່ສຳເລັດ",
                                      fontSize: 20,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: Colors.green,
                                      textColor: Colors.white,
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
