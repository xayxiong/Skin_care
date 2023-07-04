// ignore_for_file: avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skin_care/notifire/customerNotifire.dart';
import 'package:skin_care/profile/Profire.dart';
import 'package:skin_care/route/router.dart';
import 'package:skin_care/splashScreen.dart';


import 'Order/Cart.dart';
import 'Order/Get_order.dart';
import 'Order/Report_Order_Month.dart';
import 'Order/managerOrderByCustomer.dart';
import 'notifire/Cartnotififire.dart';
import 'notifire/OrderNotifire.dart';
import 'notifire/Repport_Order_Notifire.dart';
import 'notifire/categoryNotifire.dart';


import 'notifire/productNotifire.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then(
    (value) => print('connect'),
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CategoryNotifire()),
      ChangeNotifierProvider(create: (_) => ProductNotifire()),
      ChangeNotifierProvider(create: (_) => Cartnotifire()),
   
      ChangeNotifierProvider(create: (_) => CustomerNotifire()),
      ChangeNotifierProvider(create: (_) => Order_Notifire()),
      ChangeNotifierProvider(create: (_) =>  report_incomeNotifire()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        dividerColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      home: const SplashScreen(),
      routes: <String, WidgetBuilder>{
        route.Get_oerder: (BuildContext context) => const Get_Order(),
        route.Cart: (BuildContext context) => const Cart(),
        route.Profile: (BuildContext context) => const Profile(),
        route.managerOrder: (BuildContext context) => const ManagerOrderByCustomer(),
        // route.Report_Order_Month: (BuildContext context) => const Report_Order_Month(),
      },
    );
  }
}
