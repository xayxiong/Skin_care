import 'package:flutter/material.dart';

import 'dart:async';

import 'package:skin_care/eclement/element.dart';

import 'Login/register.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Register(),
            )));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: element.pink,
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            // Text(
            //   'ຮ້ານຂາຍເຄື່ອງສຳອາງອອນລາຍ',
            //   style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 44,
            //       fontWeight: FontWeight.bold),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        )),
      ),
    );
  }
}
