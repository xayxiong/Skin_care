import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:skin_care/Login/login.dart';
import 'package:skin_care/api/get_EmployeeData.dart';
import 'package:skin_care/model/Employee_Model.dart';

import '../daiglog.dart';

import '../notifire/employeeNotifire.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  EmployeeData employeeData = EmployeeData();
  @override
  Widget build(BuildContext context) {
    EmployeeNotifire em = Provider.of<EmployeeNotifire>(context);
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Error"),
            ),
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "ຮ້ານຂາຍເຄື່ອງສຳອາງອອນລາຍ",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 60),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "ຊື່ ແລະ ນາມສະກຸນ",
                            fillColor:
                                Theme.of(context).primaryColor.withOpacity(0.1),
                            filled: true,
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onSaved: (String? fullname) {
                            fullname = fullname;
                          },
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                  errorText: "ກະລຸນາຊື່ ແລະ ນາມສະກຸນ"),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "ອີເມວ",
                            fillColor:
                                Theme.of(context).primaryColor.withOpacity(0.1),
                            filled: true,
                            prefixIcon: const Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (String? email) {
                            employeeData.email = email;
                          },
                          validator: MultiValidator(
                            [
                              RequiredValidator(errorText: "ກະລຸນາປ້ອນອີເມວ"),
                              EmailValidator(errorText: "ຮູບແບບອີເມວບໍ່ຖືກຕ້ອງ")
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "ລະຫັດຜ່ານ",
                            fillColor:
                                Theme.of(context).primaryColor.withOpacity(0.1),
                            filled: true,
                            prefixIcon: const Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          onSaved: (String? password) {
                            employeeData.password = password;
                          },
                          validator: (String? password) {
                            if (password!.isEmpty) {
                              return "ກະລຸນາປ້ອນລະຫັດຜ່ານ";
                            } else if (password.length < 6) {
                              return "ລະຫັດຜ່ານມັນສັ້ນເກີນໄປ";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          height: 65,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.pinkAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () async {
                              Dialog_Cire(context);

                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                formKey.currentState!.reset();
                                try {
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                          email: employeeData.email!,
                                          password: employeeData.password!)
                                      .then((value) async {
                                    await GetEmployeeData_only(
                                        em, employeeData.email!, context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Login()));
                                  });
                                } on FirebaseAuthException catch (e) {
                                  if (e.code != true) {
                                    print('No user found for that email.');
                                  } else if (e.code == 'wrong-password') {
                                    print(
                                        'Wrong password provided for that user.');
                                  }
                                  Fluttertoast.showToast(
                                    msg: e.message!,
                                    gravity: ToastGravity.CENTER,
                                  );
                                  Navigator.pop(context);
                                }
                              }
                            },
                            child: const Text(
                              "ລົງທະບຽນ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()));
                                },
                                child: Text(
                                  "ເຂົ້າສູ່ລະບົບ",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.redAccent),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
