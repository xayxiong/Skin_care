// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({Key? key}) : super(key: key);

  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
              onChanged: (value) {
                setState(() {
                  emailController = value.trim() as TextEditingController;
                });
              },
            ),
          ),
          ElevatedButton(
            child: const Text('Send Request'),
            onPressed: () async {
              FirebaseAuth.instance
                  .sendPasswordResetEmail(email: emailController.text)
                  .then((value) {
                print('successfully');
                Navigator.of(context).pop();
              });
            },
          ),
        ],
      ),
    );
  }
}
