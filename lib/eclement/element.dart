// ignore_for_file: non_constant_identifier_names, prefer_is_empty, camel_case_types, unused_field

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../notifire/Cartnotififire.dart';

class element {
  static String? category_id;
  String? _name, _des;
  int? _price, _cost, _amount;

  static String nullimage = 'https://rae.mju.ac.th/images/untitled.png';
  //color
  static var main = const Color(0xff179F84);
  static var Indigo = const Color(0xff281E5D);
  static var ocean = const Color(0xff016064);
  static var sky = const Color(0xff63c5da);
  static var wht = const Color(0xffFAFAFA);
  static var gray = const Color(0xffF7F7F7);
  static var pink = Color.fromARGB(255, 239, 34, 160);

  //title
  static String title = 'ຮ້ານຂາຍເຄື່ອງສຳອາງອອນລາຍ';
  static String p1 = "ລາຍການສິນຄ້າ";
  static String p2 = "ຈັດການອໍເດີ";
  static String p3 = "ອໍເດີທີສຳເລັດ";

  static String p4 = "ຂໍ້ມູນສ່ວນຕົວ";
  static CartButton(BuildContext context, route) {
    Cartnotifire amoutotal = Provider.of<Cartnotifire>(context);
    return Row(
      children: [
        Text(
          '${amoutotal.Cartlist.length == 0 ? '' : amoutotal.Cartlist.length}',
          style: const TextStyle(color: Colors.white),
        ),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, route);
            },
            icon: const Icon(Icons.shopping_cart_outlined)),
      ],
    );
  }

  WidgetSearch({String? label}) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(40),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: CupertinoTextField(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 10,
                ),
                placeholder: label,
                prefix: const Padding(
                  padding: EdgeInsets.only(left: 14),
                  child: Icon(
                    Icons.search,
                    color: Color(0xff7b7b7b),
                  ),
                ),
                decoration: BoxDecoration(
                  color: const Color(0xfff7f7f7),
                  borderRadius: BorderRadius.circular(40),
                ),
                style: const TextStyle(
                  color: Color(0xff707070),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // option
  static MenuButton(
      BuildContext context, String rout, var icons, Color colors, txt) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: colors, // Splash color
        onTap: () {
          Navigator.pushNamed(context, rout);
        },
        child: Container(
          decoration: BoxDecoration(
              color: colors,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  offset: const Offset(4.0, 4.0),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 15,
                  spreadRadius: 1,
                )
              ]),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icons,
                  size: 90,
                  color: Colors.white,
                ),
                Text(txt,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }

//BackPage
  static BackPage(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  RoutePageBack(BuildContext context, var page) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
    );
  }

  void showdialog(BuildContext context, {String? title, String? content}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(title!),
              content: Text(content!),
              actions: [
                TextButton(
                    onPressed: () {
                      //Navigator.of(context).pop;
                    },
                    child: const Text(""))
              ],
            ));
  }

  TabbarPage(
      {String? label1,
      String? label2,
      IconData? icos1,
      IconData? icos2,
      required var tap1,
      required var tap2}) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: element.main,
          activeColor: Colors.white,
          inactiveColor: Colors.white70,
          items: [
            BottomNavigationBarItem(
              label: label1,
              icon: Icon(icos1),
            ),
            BottomNavigationBarItem(
              label: label2,
              icon: Icon(icos2),
            ),
          ],
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return tap1;
            case 1:
            default:
              return tap2;
          }
        });
  }
}
