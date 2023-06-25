import 'package:flutter/material.dart';

Dialog_Cire(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => Center(
      child: CircularProgressIndicator(
        color: Colors.pinkAccent,
      ),
    ),
  );
}
